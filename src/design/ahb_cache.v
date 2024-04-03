// ===========================================================================//
// Engineer:       James Vogenthaler - jamesvogen@gmail.com                   //
//                                                                            //
// Design Name:    Simple AHB Addressable Memory Buffer                       //
// Module Name:    AHB_CACHE                                                  //
// Project Name:   RISCV32I                                                   //
// Language:       Verilog                                                    //
//                                                                            //
// Description:    This component implements an AHB addressable memory buffer //
//                 which reads or writes data with a 1-cycle latency delay.   //
//                                                                            //
// ===========================================================================//

module ahb_cache #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter SIZE_IN_KB = 64, // (16384 * 32) / 8 = 64 KB
    parameter START_ADDR = 0,
    parameter INITIALIZE = 0,
    parameter INIT_FILE = "binary_rom_image.mem"
)(
    input wire HCLK,
    input wire HRESETn,

    // =========================================================================
    // Data and Addr Bus Signals                                              //
    // =========================================================================
    input wire [ADDR_WIDTH-1:0] haddr,
    input wire [DATA_WIDTH-1:0] hwdata,
    output reg [DATA_WIDTH-1:0] hrdata,

    // =========================================================================
    // Control Signals                                                        //
    // =========================================================================
    input wire  hwrite,
    input wire  hsel,
    input wire  hmastlock,
    input wire  [1:0] htrans,
    input wire  [3:0] hprot,
    input wire  [2:0] hburst,
    input wire  [2:0] hsize,
    output wire hresp,
    output wire hready
);
    // =========================================================================
    // Derived Constants                                                      //
    // =========================================================================
    localparam GRANULARITY  = $clog2(DATA_WIDTH / 8);    // 2^x byte addressable
    localparam ADDRESSABLE  = (1024 * SIZE_IN_KB) / (DATA_WIDTH / 8);
    localparam ADDR_PREFIX  = ADDR_WIDTH - GRANULARITY;  // addr bits to get index
    localparam INDEX_WIDTH  = $clog2(ADDRESSABLE);       // # bits to index memory
    localparam SIZE_IN_BITS = DATA_WIDTH * ADDRESSABLE;  // Size of address space

    // =========================================================================
    // Memory Buffer                                                          //
    // =========================================================================
    reg [DATA_WIDTH-1:0] MEMORY [0:ADDRESSABLE-1];
    
    // =========================================================================
    // Intermediate Logic Variables used for calculation                      //
    // =========================================================================
    wire read;     // Flag: True if we are doing a read operation
    wire transfer; // Flag: True if currently transferring data
    wire forward;  // Flag: True if we need to forward data from write buffer
    wire [DATA_WIDTH-1:0]  template;  // Byte mask template based on HSIZE
    wire [DATA_WIDTH-1:0]  bitmask;   // Byte mask shifted to correct position
    wire [GRANULARITY+2:0] bitshift;  // Shift amount based on HADDR and HSIZE
    wire [ADDR_WIDTH-1:0]  real_addr; // Effective address starting from zero
    wire [ADDR_PREFIX-1:0] prefix;    // Prefix of address for index 
    wire [INDEX_WIDTH-1:0] index;     // Used to index into memory buffer

    // =========================================================================
    // Intermediate Data Variables used for calculation                       //
    // =========================================================================
    wire [DATA_WIDTH-1:0] load_data;   // Fetched from write/memory bufffer
    wire [DATA_WIDTH-1:0] read_data;   // load_data w/ size mask applied
    wire [DATA_WIDTH-1:0] return_data; // Data which will be returned in hrdata
    wire [DATA_WIDTH-1:0] old_data;    // load_data w/ inverted mask applied
    wire [DATA_WIDTH-1:0] new_data;    // hwdata shifted to correct position
    wire [DATA_WIDTH-1:0] write_data;  // Combination of old_data & HWDATA
    wire [DATA_WIDTH-1:0] commit_data; // Data which will be commited to memory

    // =========================================================================
    // Propagation Variables to remember data from the previous cycle         //
    // =========================================================================
    reg write;    // Flag: True if we are doing a write operation
    reg [DATA_WIDTH -1:0] prev_data;
    reg [INDEX_WIDTH-1:0] prev_index;
    reg [GRANULARITY+2:0] prev_mask;
    
    // =========================================================================
    // Control signal derivation                                              //
    // =========================================================================
    // Are we transfering data?
    assign transfer = hsel & htrans[1] & HRESETn;
    // Do we need to forward data from the write buffer?
    assign forward = write & (prev_index == index);
    // Are we reading data?
    assign read = transfer & ~hwrite;
    // Subtract start address to get real_addr address into memory array
    assign real_addr = haddr - START_ADDR;
    // Zero wait state. For 1-cycle latency we never need to insert wait cycles.
    assign hready = 1;
    // Send ERROR(1) if addr out of range when transferring, else send OKAY(0)
    assign hresp = transfer & (real_addr >= SIZE_IN_BITS);
    // Determine bitmask template to use based on how many bytes are being transferred
    assign template =
        (hsize == 3'b000) ? {   8{1'b1}} :
        (hsize == 3'b001) ? {  16{1'b1}} :
        (hsize == 3'b010) ? {  32{1'b1}} :
        (hsize == 3'b011) ? {  64{1'b1}} :
        (hsize == 3'b100) ? { 128{1'b1}} :
        (hsize == 3'b101) ? { 256{1'b1}} :
        (hsize == 3'b110) ? { 512{1'b1}} :
        (hsize == 3'b111) ? {1024{1'b1}} : 0;

    // =========================================================================
    // Data Derivation                                                        //
    // =========================================================================
    // Cut off unneeded bits from address for loading memory
    assign prefix = real_addr[ADDR_WIDTH-1:GRANULARITY];
    // Use prefix as index if within range
    assign index  = (hresp) ? {INDEX_WIDTH{1'bx}} : prefix;
    // Determine shift amt to place data correctly from least significant bits
    assign bitshift = (GRANULARITY) ? {real_addr[GRANULARITY-1:0],3'b000} : 0;
    // Shift template to correct position to get the bitmask
    assign bitmask  = template << bitshift;
    // Implement data forwarding. Either from buffer or from write in progress
    assign load_data = (forward) ? write_data : MEMORY[index];
    // Shift data coming in from hwdata
    assign new_data = (hwdata) & prev_mask;
    // If address in range: shift mask to correct pos then apply to load data
    assign old_data  = (hresp) ? {DATA_WIDTH{1'b0}} : load_data & ~bitmask;
    // If address in range: shift requested data to LSB and apply mask
    assign read_data = (hresp) ? {DATA_WIDTH{1'b0}} : load_data &  bitmask;
    // If a write signaled, combine old data with new data to form write data
    assign write_data = prev_data | hwdata;
    // Only return data if it is currently being requested
    assign return_data = (read) ? read_data : {DATA_WIDTH{1'b0}};
    // Only commit data if a write has been signalled
    assign commit_data = (write) ? write_data : MEMORY[prev_index];

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
        hrdata <= return_data;             // READ
        MEMORY[prev_index] <= commit_data; // WRITE
    end
    
    // =========================================================================
    // Simulation Handling
    // =========================================================================
    initial begin
        if (INITIALIZE)
            $readmemh(INIT_FILE, MEMORY);
    end
endmodule


