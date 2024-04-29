// ===========================================================================//
// Engineer:       James Vogenthaler - jamesvogen@gmail.com                   //
//                                                                            //
// Design Name:    Simple AHB Addressable GPIO Module                         //
// Module Name:    AHB_GPIO                                                   //
// Project Name:   RISCV32I                                                   //
// Language:       Verilog                                                    //
//                                                                            //
// Description:    This component implements an AHB GPIO Array which reads or //
//                 writes data with a 1-cycle latency delay. Read only        //
//                 registers are enforced between data width boundaries.      //
//                 Use the included Clock_Boundary to syncrhonize any         //
//                 asynchronous peripherals like switches and buttons to      //
//                 eliminate the risk of transients causing glitchy behavior. //
//                                                                            //
// ===========================================================================//

module AHB_GPIO #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter START_ADDR = 0
)(
    input wire HCLK,
    input wire HRESETn,

    // =========================================================================
    // IO Peripherals that form this module
    // =========================================================================
    input wire  [15:0] SW,
    output wire [15:0] LED,
    output wire [ 5:0] RGB,
    output wire [15:0] D_7SEG,
    output wire [ 7:0] EN_7SEG,
    inout wire [ 7:0] PmodA,
    inout wire [ 7:0] PmodB,
    inout wire [ 5:0] PmodAB,
    inout wire [ 7:0] PmodC,
    inout wire [ 7:0] PmodD,
    inout wire [ 5:0] PmodCD,
    inout wire [ 3:0] btn,
    // =========================================================================
    // Data and Addr Bus Signals                                              //
    // =========================================================================
    input wire [ADDR_WIDTH-1:0] haddr,
    input wire [DATA_WIDTH-1:0] hwdata,
    output reg [DATA_WIDTH-1:0] hrdata,

    // =========================================================================
    // Control Signals                                                        //
    // =========================================================================
    // verilator lint_off unused
    input wire  hwrite,
    input wire  hsel,
    input wire  [1:0] htrans,
    input wire  [2:0] hsize,
    input wire  [2:0] hburst,
    input wire  [3:0] hprot,
    input wire  hmastlock,
    output wire hresp,
    output wire hready
    // verilator lint_on unused
);
    // =========================================================================
    // Derived Constants                                                      //
    // =========================================================================
    localparam GPIO_REGS    = 7;
    localparam GRANULARITY  = $clog2(DATA_WIDTH / 8);   // 2^x byte addressable
    localparam INDEX_WIDTH  = $clog2(GPIO_REGS);        // #bits to index memory
    localparam INDEX_START  = INDEX_WIDTH + GRANULARITY;// Starting bit to index
    localparam SIZE_IN_BITS = DATA_WIDTH * GPIO_REGS;   // Size of address space

    // =========================================================================
    // Memory Buffer                                                          //
    // =========================================================================
    reg [DATA_WIDTH-1:0] GPIO [0:GPIO_REGS-1];
    wire [GPIO_REGS-1:0] read_only;
    
    // =========================================================================
    // Intermediate Logic Variables used for calculation                      //
    // =========================================================================
    wire load;     // Flag: Should we load data from memory?
    wire read;     // Flag: Are we doing a read operation?
    wire transfer; // Flag: Are we currently transferring data?
    wire forward;  // Flag: Should we forward data from the write buffer?
    wire illegal;  // Flag: Are we trying to write to a read_only register?
    wire [DATA_WIDTH-1:0]  template;  // Byte mask template based on HSIZE
    wire [DATA_WIDTH-1:0]  bitmask;   // Byte mask shifted to correct position
    wire [GRANULARITY+2:0] bitshift;  // Shift amount based on HADDR and HSIZE
    wire [ADDR_WIDTH-1:0]  real_addr; // Effective address starting from zero
    wire [INDEX_WIDTH-1:0] index;     // Used to index into memory buffer

    // =========================================================================
    // Intermediate Data Variables used for calculation                       //
    // =========================================================================
    wire [DATA_WIDTH-1:0] load_data;   // Fetched from write/memory bufffer
    wire [DATA_WIDTH-1:0] read_data;   // load_data w/ size mask applied
    wire [DATA_WIDTH-1:0] old_data;    // load_data w/ inverted mask applied
    wire [DATA_WIDTH-1:0] new_data;    // hwdata w/ mask applied
    wire [DATA_WIDTH-1:0] write_data;  // Combination of old_data & HWDATA
    wire [DATA_WIDTH-1:0] zero_vec;    // Shortcut to assign all zero bits

    // =========================================================================
    // Propagation Variables to remember data from the previous cycle         //
    // =========================================================================
    reg write;    // Flag: True if we are doing a write operation
    reg [INDEX_WIDTH-1:0] prev_index;
    reg [DATA_WIDTH -1:0] prev_data;
    reg [DATA_WIDTH -1:0] prev_mask;

    // =========================================================================
    // IO MAPPING
    // =========================================================================
    localparam SWITCHES = 0; // Index 0 for switches
    localparam LEDS = 1;     // Index 1 for LEDs
    localparam _7SEG = 2;    // Index 2 for 7 Segments
    
    //New added !!!!
    localparam _PMODAB = 3;
    localparam _PMODCD = 4;
    localparam _BTN = 5;
    //tbd
    
    
    // =========================================================================
    // Memory Map GPIO Pins
    // =========================================================================
    // Map Switches to the same register
    wire [3:0] btn_sync;
    wire [15:0] SW_Sync;
    genvar i;
    integer j;
    generate
        for (i=0; i<16; i=i+1) begin : async_switch
            Clock_Boundary switch_cb(HCLK, SW[i], SW_Sync[i]);
        end
        for (i=0; i<4; i=i+1) begin : async_switch
            Clock_Boundary btn_cb(HCLK, btn[i], btn_sync[i]); 
        end
    endgenerate
    // Map Switches to register
    always @(posedge HCLK) begin
        for (j=0; j<16; j=j+1) begin
            GPIO[SWITCHES][j] <= SW_Sync[j];
        end
        for (j=0; j<4; j=j+1) begin
            GPIO[_BTN][j] <= btn_sync[j];
        end
    end
    assign read_only[SWITCHES] = 1'b1;
    assign read_only[_BTN] = 1'b1;
    // Map LEDs to the same Register
    assign LED = GPIO[LEDS][15:0];
    assign RGB = GPIO[LEDS][21:16];
    assign read_only[LEDS] = 1'b0;

    // Map 7 Segment to the same register
    assign D_7SEG  = GPIO[_7SEG][15:0];
    assign EN_7SEG = GPIO[_7SEG][23:16];
    assign read_only[_7SEG] = 1'b0;
    assign EN_7SEG = GPIO[_7SEG][23:16];
    
    
    //To James: Newly added GPIO
    assign PmodA = GPIO[_PMODAB][11:0];
    assign PmodAB = GPIO[_PMODAB][17:12];
    assign PmodB = GPIO[_PMODB][29:18];
    
    assign PmodC = GPIO[_PMODCD][11:0];
    assign PmodCD = GPIO[_PMODCD][17:12];
    assign PmodD = GPIO[_PMODCD][29:18];
    
    
    
    // RESET !!!!!!
    always @(posedge HCLK or negedge HRESETn) begin
//        if btn[0] or the reset signal is low:
//check hreset
        if (HRESETn == 0)
            begin
        GPIO[0][31:16] <= 16'd0;
        GPIO[1][31:22] <= 10'd0;
        GPIO[2][31:24] <= 8'd0;
        GPIO[3][31:24] <= 8'd0;
        GPIO[4][31:24] <= 8'd0;
        GPIO[5][31:24] <= 8'd0;
        
        LED <= 16'd0;
        RGB <= 6'd0;
        D_7SEG <= 16'd0;
        EN_7SEG <= 8'd0;
        PmodA <= 8'd0;
        PmodB <= 8'd0;
        PmodAB <= 6'd0;
        PmodC <= 8'd0;
        PmodD <= 8'd0;
        PmodCD <= 6'd0;
        btn <= 4'd0;
    end
    
    // =========================================================================
    // Control signals                                                        //
    // =========================================================================
    // Are we transfering data?
    assign transfer = hsel & htrans[1] & HRESETn;
    // Do we need to forward data from the write buffer?
    assign forward = write & ~illegal & (prev_index == index);
    // Should we load data from memory?
    assign load = transfer & ~hresp;
    // Are we reading data?
    assign read = transfer & ~hwrite;
    // Are we trying to write to a read_only register?
    assign illegal = write & read_only[prev_index];
    // Zero wait state. For 1-cycle latency we never need to insert wait cycles.
    assign hready = 1;
    // Send ERROR(1) if addr out of range when transferring, else send OKAY(0)
    assign hresp = illegal | (real_addr >= SIZE_IN_BITS ? transfer : 0);
    // Subtract start address to get real_addr address into memory array
    assign real_addr = transfer ? (haddr - START_ADDR) : zero_vec;;
    // Determine bitmask template to use based on # of bytes being transferred
    assign zero_vec = {DATA_WIDTH{1'b0}};
    // verilator lint_off WIDTH
    assign template = (~hsel) ? zero_vec :
        (hsize == 3'b000) ? {   8{1'b1}} :
        (hsize == 3'b001) ? {  16{1'b1}} :
        (hsize == 3'b010) ? {  32{1'b1}} :
        (hsize == 3'b011) ? {  64{1'b1}} :
        (hsize == 3'b100) ? { 128{1'b1}} :
        (hsize == 3'b101) ? { 256{1'b1}} :
        (hsize == 3'b110) ? { 512{1'b1}} :
        (hsize == 3'b111) ? {1024{1'b1}} : 0;
    // verilator lint_on WIDTH

    // =========================================================================
    // Data Derivation                                                        //
    // =========================================================================
    // Cut off unneeded bits from address for loading memory
    assign index = real_addr[INDEX_START-1:GRANULARITY];
    // Determine shift amt to place data correctly from least significant bits
    assign bitshift = (|GRANULARITY) ? {real_addr[GRANULARITY-1:0],3'b000} : 0;
    // Shift template to correct position to get the bitmask
    assign bitmask  = template << bitshift;
    // Implement data forwarding. Either from buffer or from write in progress
    assign load_data = load ? (forward ? write_data : GPIO[index]) : zero_vec;
    // Shift data coming in from hwdata
    assign new_data  = hwdata & prev_mask;
    // If address in range: shift mask to correct pos then apply to load data
    assign old_data  = load_data & ~bitmask;
    // If address in range: shift requested data to LSB and apply mask
    assign read_data = load_data &  bitmask;
    // If a write signaled, combine old data with new data to form write data
    assign write_data = new_data | prev_data;

    // =========================================================================
    // Operations w/ 1-cycle propogation delay                                //
    // =========================================================================
    always @(posedge HCLK) begin
        // =====================================================================
        // Propagate info needed to capture/process write data in next cycle  //
        // =====================================================================
        write      <= transfer & hwrite;
        prev_index <= index;
        prev_data  <= old_data;
        prev_mask  <= bitmask;
        // =====================================================================
        // Process end and commit data                                        //
        // =====================================================================
        if (read)
            hrdata <= read_data;
        if (write & ~illegal)
            GPIO[prev_index] <= write_data;
    end
    
//    always @( posedge HCLK or negedge HRESETn ) begin
//        if ( HRESETn == 1'b0 ) begin
//            Q_reg <= DEFAULT_VALUE;
//        end else begin
//            Q_reg <= D;
//        end
//    end


    always @(posedge HCLK) begin
        GPIO[0][31:16] <= 16'd0;
        GPIO[1][31:22] <= 10'd0;
        GPIO[2][31:24] <= 8'd0;
    end

endmodule
    


module Clock_Boundary #(SYNC_WIDTH=2) (
    input CLK,
    input async_in,
    output reg sync_out
);
    reg [SYNC_WIDTH-1:0] boundary = {SYNC_WIDTH{1'b0}};
    always @(posedge CLK) begin
        if (~async_in)
            boundary <= {SYNC_WIDTH{1'b0}};
        else
            boundary <= {boundary[SYNC_WIDTH-2:0], async_in};
        sync_out <= boundary[SYNC_WIDTH-1];
    end
endmodule


//module Clock_Boundary #(SYNC_WIDTH=2) (
//    input CLK,
//    input btn[0],
//    output reg rst_out
//);
//    reg [SYNC_WIDTH-1:0] boundary = {SYNC_WIDTH{1'b0}};
//    always @(posedge CLK) begin
//        if (~btn[0])
//            boundary <= {SYNC_WIDTH{1'b0}};
//        else
//            boundary <= {boundary[SYNC_WIDTH-2:0], btn[0]};
//        rst_out <= boundary[SYNC_WIDTH-1];
//    end
//endmodule


//Check logic
//    always @(posedge CLK) begin
//        if (btn[0] == 1) for 3 cycles, forgot how to check XD
//            all async is reset
//        else
//            nothing happens
//    end
