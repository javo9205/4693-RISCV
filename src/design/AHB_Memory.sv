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

module AHB_Memory #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter PORTS = 2,
    parameter SIZE_IN_KB = 32, // (8192 * 32) / 8 = 32 KB
    parameter INITIALIZE = 0,
    parameter INIT_FILE = "binary_rom_image.mem"
)(
    input wire HCLK,
    input wire HRESETn,
    AHB_Interface.Master AHB [PORTS-1:0]
);
    // =========================================================================
    // Derived Constants                                                      //
    // =========================================================================
    localparam ADDRESSABLE  = (1024 * SIZE_IN_KB) / (DATA_WIDTH / 8);
    localparam GRANULARITY  = $clog2(DATA_WIDTH / 8);   // 2^x byte addressable
    localparam INDEX_WIDTH  = $clog2(ADDRESSABLE);      // #bits to index memory
    localparam INDEX_START  = INDEX_WIDTH + GRANULARITY; // addr bits for index
    localparam ZERO_DATA    = {DATA_WIDTH{1'b0}};

    // =========================================================================
    // Memory Buffer                                                          //
    // =========================================================================
    reg [DATA_WIDTH-1:0] MEM [0:ADDRESSABLE-1];
    
    // =========================================================================
    // Intermediate Logic Variables used for calculation                      //
    // =========================================================================
    wire [PORTS-1:0] will_write; // Flag: Are we getting write data next cycle?
    wire [PORTS-1:0] load;       // Flag: Should we load data from memory?
    wire [PORTS-1:0] read;       // Flag: Are we doing a read operation?
    wire [PORTS-1:0] transfer;   // Flag: Are we currently transferring data?
    reg  [PORTS-1:0] wthaz;      // Flag; Multiple writes to the same location?
    wire [PORTS-1:0][DATA_WIDTH -1:0] template;  // Byte mask template for HSIZE
    wire [PORTS-1:0][DATA_WIDTH -1:0] bitmask;   // Byte mask shifted as needed
    wire [PORTS-1:0][GRANULARITY+2:0] bitshift;  // Shift based on HADDR, HSIZE
    reg [PORTS-1:0][ADDR_WIDTH -1:0] addr; // Effective address into mem
    wire [PORTS-1:0][INDEX_WIDTH-1:0] index;     // Used to index into memory

    // =========================================================================
    // Intermediate Data Variables used for calculation                       //
    // =========================================================================
    wire [PORTS-1:0][DATA_WIDTH-1:0] new_data;     // hwdata w/ mask applied
    wire [PORTS-1:0][DATA_WIDTH-1:0] old_data;     // load_data w/ ~mask applied
    wire [PORTS-1:0][DATA_WIDTH-1:0] read_buffer;  // load_data w/ mask applied
    wire [PORTS-1:0][DATA_WIDTH-1:0] write_buffer; // Correct write data
    wire [PORTS-1:0][DATA_WIDTH-1:0] load_data;    // Data from memory
    reg  [PORTS-1:0][DATA_WIDTH-1:0] load_buffer;  // Either from mem/wt buffer

    // =========================================================================
    // Propagation Variables to remember data from the previous cycle         //
    // =========================================================================
    reg [PORTS-1:0] write;    // Flag: True if we are doing a write operation
    reg [PORTS-1:0][INDEX_WIDTH-1:0] pindex; // Index from previous cycle
    reg [PORTS-1:0][DATA_WIDTH -1:0] pmask;  // Bitmask from previous cycle
    reg [PORTS-1:0][DATA_WIDTH -1:0] pdata;  // Old data from previous cycle
    
    generate
        for (genvar i=0; i<PORTS; i++) begin : AHB_Memory_Port
            // =================================================================
            // Control signals                                                //
            // =================================================================
            // Are we transfering data?
            assign transfer[i] = AHB[i].hsel & AHB[i].htrans[1] & HRESETn;
            // Should we expect write data next cycle?
            assign will_write[i] = transfer[i] & AHB[i].hwrite;
            // Should we load data from memory?
            assign load[i] = transfer[i] & ~AHB[i].hresp;
            // Are we reading data?
            assign read[i] = transfer[i] & ~AHB[i].hwrite;
            // Subtract start address to get real_addr address into memory array
            assign addr[i] = AHB[i].haddr - AHB[i].base_addr;
            // Determine bitmask template based on # of bytes being transferred
            // verilator lint_off WIDTH
            assign template[i] = (~AHB[i].hsel)  ?  ZERO_DATA  :
                        (AHB[i].hsize == 3'b000) ? {   8{1'b1}} :
                        (AHB[i].hsize == 3'b001) ? {  16{1'b1}} :
                        (AHB[i].hsize == 3'b010) ? {  32{1'b1}} :
                        (AHB[i].hsize == 3'b011) ? {  64{1'b1}} :
                        (AHB[i].hsize == 3'b100) ? { 128{1'b1}} :
                        (AHB[i].hsize == 3'b101) ? { 256{1'b1}} :
                        (AHB[i].hsize == 3'b110) ? { 512{1'b1}} :
                        (AHB[i].hsize == 3'b111) ? {1024{1'b1}} : 0;
            // verilator lint_on WIDTH

            // =================================================================
            // Implement Data Forwarding for writes in progress. 
            // =================================================================
            always_comb begin : Write_Buffer_Data_Forwarding
                // By default, load data from memory
                load_buffer[i] = load_data[i];
                // If previous index matches current index, forward from buffer
                for (int j=0; j<PORTS; j++) begin
                    if ((index[i] == pindex[j]) & write[j]) begin
                        load_buffer[i] = write_buffer[j];
                        break;
                    end
                end
            end

            // =================================================================
            // Guard against multiple writes to the same location
            // =================================================================
            always_comb begin : Write_Hazard_Detection
                wthaz[i] = 0;
                if (transfer[i] & AHB[i].hwrite) begin
                    for (int j=0; j<i; j++) begin
                        if ((index[i] == index[j]) & will_write[j]) begin
                            wthaz[i] = 1;
                            break;
                        end
                    end
                end
            end

            // =================================================================
            // Data Derivation                                                //
            // =================================================================
            // Cut off unneeded bits from address for loading memory
            assign index[i]     = addr[i][INDEX_START-1:GRANULARITY];
            // Determine shift amt to place data correctly from least significant bits
            assign bitshift[i]  = (|GRANULARITY) ? {addr[i][GRANULARITY-1:0],3'b000} : 0;
            // Shift template to correct position to get the bitmask
            assign bitmask[i]   = template[i] << bitshift[i];
            // Load data from memory if load control signal is set high
            assign load_data[i] = load[i] ? MEM[index[i]] : ZERO_DATA;
            // Shift data coming in from hwdata
            assign new_data[i]  = AHB[i].hwdata & pmask[i];
            // If address in range: shift mask to correct pos then apply to load data
            assign old_data[i]  = load_buffer[i] & ~bitmask[i];
            // If address in range: shift requested data to LSB and apply mask
            assign read_buffer[i]  = load_buffer[i] & bitmask[i];
            // If a write signaled, combine old data with new data to form write data
            assign write_buffer[i] = new_data[i] | pdata[i];

            // =================================================================
            // Module Outputs                                                 //
            // =================================================================
            // Zero wait state. For 1-cycle latency we never need to insert wait cycles.
            assign AHB[i].hready = 1;
            // Send ERROR(1) if addr out of range when transferring, else send OKAY(0)
            assign AHB[i].hresp = (AHB[i].haddr > AHB[i].last_addr) ? transfer[i] : wthaz[i];

            // =================================================================
            // Operations w/ 1-cycle propogation delay                        //
            // =================================================================
            always @(posedge HCLK) begin
                // =============================================================
                // Propagate info needed to capture write data in next cycle  //
                // =============================================================
                write[i]  <= will_write[i] & ~wthaz[i];
                pindex[i] <= index[i];
                pmask[i]  <= bitmask[i];
                pdata[i]  <= old_data[i];
                // =============================================================
                // Process end and commit data                                //
                // =============================================================
                if (read[i])  AHB[i].hrdata  <= read_buffer[i];
                if (write[i]) MEM[pindex[i]] <= write_buffer[i];
            end
        end
    endgenerate
    
    // =========================================================================
    // Simulation Handling                                                    //
    // =========================================================================
    initial begin
        if (INITIALIZE)
            $readmemh(INIT_FILE, MEM);
    end
endmodule


