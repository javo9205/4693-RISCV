// ========================================================================//
// Engineer:       Ânderson Ignacio da Silva - anderson@aignacio.com       //
// Modified By:    James Vogenthaler - jamesvogen@gmail.com                //
//                                                                         //
// Design Name:    AHB Bus Matrix                                          //
// Module Name:    AHB_Bus                                                 //
// Project Name:   --                                                      //
// Language:       Verilog (Originally System Verilog)                     //
//                                                                         //
// Description:    This component implements a an AHB matrix, encompassing //
//                 a decoder and multiplexor to facilitate bus traffic     //
//                 between a single master and multiple slaves according   //
//                 to the AMBA 3 AHB Lite Specification.                   //
//                                                                         //
// ========================================================================//

`include "AHB_Interface.svh"

module AHB_Interconnect #(
    parameter NUM_MASTER = 2,
    parameter NUM_SLAVES = 8,
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32
)(
    input wire HCLK, HRESETn,
    AHB_Interface.Master m [NUM_MASTER],
    AHB_Interface.Slave  s [NUM_SLAVES]
);
//==========================================================
// START OF MODULE
//==========================================================
    wire [NUM_SLAVES-1:0][NUM_MASTER-1:0] assigned;
    wire [NUM_MASTER-1:0][NUM_SLAVES-1:0] desires;
    wire [NUM_MASTER-1:0][NUM_SLAVES-1:0] granted;

    AHB_Decoder #(NUM_MASTER, NUM_SLAVES) decoder (m, s, desires);
    AHB_Arbitor #(NUM_MASTER, NUM_SLAVES) arbitor (HCLK, HRESETn, m, s, desires, granted, assigned);
    AHB_Route_Slaves #(NUM_MASTER, NUM_SLAVES, DATA_WIDTH, ADDR_WIDTH) s_route (assigned, m, s);
    AHB_Route_Master #(NUM_MASTER, NUM_SLAVES, DATA_WIDTH)             m_route (CLK, granted, m, s);
endmodule

//==================================================================================
// AHB Data Routing Determination
//==================================================================================
module AHB_Decoder #(
    parameter NUM_MASTER = 2,
    parameter NUM_SLAVES = 8
)(
    AHB_Interface.Master m [NUM_MASTER],
    AHB_Interface.Slave  s [NUM_SLAVES],
    output reg [NUM_MASTER-1:0][NUM_SLAVES-1:0] desires
);
    wire [NUM_MASTER-1:0][NUM_SLAVES-1:0] gte_base;
    wire [NUM_MASTER-1:0][NUM_SLAVES-1:0] lte_last;
    
    // Determine usage desire based on memory map (i.e. base_addr to last_addr)
    generate
        // Note: Overlapping ranges represent multiple ports on a single slave
        // Note: Overlapping ranges for different slaves is not supported.
        for (genvar i=0; i<NUM_MASTER; i++) begin : Memory_Map_Decoding
            for (genvar j=0; j<NUM_SLAVES; j++) begin
                assign gte_base[i][j] = (m[i].haddr >= s[j].base_addr);
                assign lte_last[i][j] = (m[i].haddr <= s[j].last_addr);
                assign desires [i][j] = gte_base[i][j] & lte_last[i][j];
            end
        end
    endgenerate
endmodule

//==================================================================================
// Arbitration
//==================================================================================
module AHB_Arbitor #(
    parameter NUM_MASTER = 2,
    parameter NUM_SLAVES = 8
)(
    input wire CLK, RST,
    AHB_Interface.Master m [NUM_MASTER],
    AHB_Interface.Slave  s [NUM_SLAVES],
    input wire [NUM_MASTER-1:0][NUM_SLAVES-1:0] desires,
    output reg [NUM_MASTER-1:0][NUM_SLAVES-1:0] granted,
    output reg [NUM_SLAVES-1:0][NUM_MASTER-1:0] assigned
);
    reg [NUM_MASTER-1:0][NUM_SLAVES-1:0] gi;
    reg [NUM_MASTER-1:0] processed;
    reg [NUM_SLAVES-1:0] claimed;
    reg [NUM_SLAVES-1:0] hsel;
    integer i, j;
    
    //-------------------------------------------------------------
    // Set select signals and assignment
    always_comb begin
        processed = {NUM_MASTER{1'b0}};
        // Loop through all slaves to determine assignment
        for (j=0; j<NUM_SLAVES; j++) begin      
            // Loop through all masters or until claimed  
            claimed[j] = 0;
            assigned[j] = 0;
            for (i=0; i<NUM_MASTER; i++) begin
                if (desires [i][j] & ~claimed[j] & ~processed[i]) begin
                    granted [i][j] = 1;
                    assigned[j][i] = 1;
                    processed[i] = 1;
                    claimed  [j] = 1;
                    hsel[j] = 1;
                end else begin
                    granted[i][j] = 0;
                end
            end
        end
    end
    
    //-------------------------------------------------------------
    // Connect slave select signal to combination logic
    generate
        for (genvar j=0; j<NUM_SLAVES; j++)
            assign s[j].hsel = hsel[j];
    endgenerate
endmodule

//==================================================================================
// Route Master(s) --> Slaves
//==================================================================================
module AHB_Route_Slaves #(
    parameter NUM_MASTER = 2,
    parameter NUM_SLAVES = 8,
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32
)(
    input wire [NUM_SLAVES-1:0][NUM_MASTER-1:0] select,
    AHB_Interface.Master m [NUM_MASTER-1:0],
    AHB_Interface.Slave  s [NUM_SLAVES-1:0]
);
    wire [NUM_MASTER-1:0][ADDR_WIDTH-1:0] haddr;
    wire [NUM_MASTER-1:0][DATA_WIDTH-1:0] hwdata;
    wire [NUM_MASTER-1:0][DATA_WIDTH-1:0] hrdata;
    wire [NUM_MASTER-1:0]                 hsel;
    wire [NUM_MASTER-1:0]                 hwrite;
    wire [NUM_MASTER-1:0][2:0]            hsize;
    wire [NUM_MASTER-1:0][2:0]            hburst;
    wire [NUM_MASTER-1:0][3:0]            hprot;
    wire [NUM_MASTER-1:0][1:0]            htrans;
    wire [NUM_MASTER-1:0]                 hmastlock;
    reg  [NUM_SLAVES-1:0][NUM_MASTER-1:0] previous;
    
    always_ff @(posedge CLK) previous <= select;
    
    generate
        // Generate wires to connect masters to combinational logic
        for(genvar i=0; i<NUM_MASTER; i++) begin : Map_Master
            assign haddr[i]     = m[i].haddr;
            assign hwdata[i]    = m[i].hwdata;
            assign hrdata[i]    = m[i].hrdata;
            assign hsel[i]      = m[i].hsel;
            assign hwrite[i]    = m[i].hwrite;
            assign hsize[i]     = m[i].hsize;
            assign hburst[i]    = m[i].hburst;
            assign hprot[i]     = m[i].hprot;
            assign htrans[i]    = m[i].htrans;
            assign hmastlock[i] = m[i].hmastlock;
        end
    
        // Generate muxes using always_comb to route each slave
        for (genvar j=0; j<NUM_SLAVES; j++) begin : Route_Slaves
            always_comb begin
                // If no select signal is set, ground everything
                if (!select[j]) begin
                    s[j].haddr     = {ADDR_WIDTH{1'b0}};
                    s[j].hwdata    = {DATA_WIDTH{1'b0}};
                    s[j].htrans    = 2'b00;
                    s[j].hsize     = 3'b000;
                    s[j].hburst    = 3'b000;
                    s[j].hprot     = 4'b0000;
                    s[j].hwrite    = 1'b0;
                    s[j].hmastlock = 1'b0;
                end else begin
                    for (int i=0; i<NUM_MASTER; i++) begin
                        if (select[j][i]) begin
                            s[j].haddr     = haddr[i] - s[j].base_addr;
                            s[j].hwdata    = hwdata[i];
                            s[j].htrans    = htrans[i];
                            s[j].hsize     = hsize[i];
                            s[j].hburst    = hburst[i];
                            s[j].hprot     = hprot[i];
                            s[j].hwrite    = hwrite[i];
                            s[j].hmastlock = hmastlock[i];
                        end
                    end
                end
            end
        end
    endgenerate
endmodule

//==================================================================================
// Route Slaves --> Master(s)
//==================================================================================
module AHB_Route_Master #(
    parameter NUM_MASTER = 2,
    parameter NUM_SLAVES = 8,
    parameter DATA_WIDTH = 32
)(
    input wire CLK,
    input wire [NUM_MASTER-1:0][NUM_SLAVES-1:0] select,
    AHB_Interface.Master m [NUM_MASTER-1:0],
    AHB_Interface.Slave  s [NUM_SLAVES-1:0]
);
    wire [NUM_SLAVES-1:0] hready;
    wire [NUM_SLAVES-1:0] hresp;
    wire [NUM_SLAVES-1:0][DATA_WIDTH-1:0] hrdata;
    reg [NUM_MASTER-1:0][NUM_SLAVES-1:0] previous;
    
    reg  [NUM_MASTER-1:0] default_slave_hsel;
    reg  [NUM_MASTER-1:0] default_slave_hready;
    
    always_ff @(posedge CLK) previous <= select;
    
    generate
        // Generate wires to connect slaves to combinational logic
        for (genvar j=0; j<NUM_SLAVES; j++) begin : Map_Slaves
            assign hresp [j] = s[j].hresp;
            assign hready[j] = s[j].hready;
            assign hrdata[j] = s[j].hrdata;
        end
        
        //----------------------------------------------------------
        // Generate muxes using always_comb to route each master
        for (genvar i=0; i<NUM_MASTER; i++) begin : Route_Master
            always_comb begin
                // If trying to access unmapped region, then...
                if (!select[i]) begin
                    // Provide an ERROR response on SEQ or NONSEQ
                    if (m[i].htrans[1]) begin
                        m[i].hready = default_slave_hready[i];
                        m[i].hresp  = 1;
                        default_slave_hsel[i] = 1;
                    // Else provide a zero-wait state OKAY response
                    end else begin
                        m[i].hready = 1;
                        m[i].hresp  = 0;
                        default_slave_hsel[i] = 0;
                    end
                    m[i].hrdata = {DATA_WIDTH{1'b0}};
                //--------------------------------------------------
                // Else route slave output to master input
                end else begin
                    for (int j=0; j<NUM_SLAVES; j++) begin
                        if (select[i][j]) begin
                            m[i].hresp  = hresp[j];
                            m[i].hready = hready[j];
                            m[i].hrdata = hrdata[j];
                end end end
                default_slave_hsel[i] = 0;
            end
                     
            //------------------------------------------------------
            // Implement default slave which outputs error responses
            always @(posedge default_slave_hsel[i])
                default_slave_hready[i] <= 0;
            always @(posedge CLK)
                default_slave_hready[i] <= 1;
        end
    endgenerate
endmodule
