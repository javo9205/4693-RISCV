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

module AHB_Bus #(
    parameter NUM_SLAVES = 8,
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter SLAVE_BASE_ADDR = { 32'h0000, 32'h1000, 32'h2000, 32'h3000, 32'h4000, 32'h5000, 32'h6000, 32'h7000 },
    parameter SLAVE_LAST_ADDR = { 32'h0FFF, 32'h1FFF, 32'h2FFF, 32'h3FFF, 32'h4FFF, 32'h5FFF, 32'h6FFF, 32'h7FFF },
    parameter SEL_BYPASS = 0
)(
    // SINGLE MASTER --> SELECTED SLAVE
    input wire [ADDR_WIDTH-1:0] m_haddr_in,
    input wire [DATA_WIDTH-1:0] m_hwdata_in,
    output reg [DATA_WIDTH-1:0] m_hrdata_out,

    input wire [1:0] m_htrans_in,
    input wire [2:0] m_hsize_in,
    input wire [2:0] m_hburst_in,
    input wire [3:0] m_hprot_in,
    input wire [$clog2(NUM_SLAVES)-(NUM_SLAVES>1 ? 1:0):0] m_hsel_in,
    input wire m_hwrite_in,
    input wire m_hmastlock_in,
    output reg m_hready_out,
    output reg m_hresp_out,

    // SLAVES --> DECODER
    output wire [NUM_SLAVES * ADDR_WIDTH - 1:0] s_haddr_out,
    output wire [NUM_SLAVES * ADDR_WIDTH - 1:0] s_hwdata_out,
    input wire  [NUM_SLAVES * ADDR_WIDTH - 1:0] s_hrdata_in,

    output wire [NUM_SLAVES * 2-1:0] s_htrans_out,
    output wire [NUM_SLAVES * 3-1:0] s_hsize_out,
    output wire [NUM_SLAVES * 3-1:0] s_hburst_out,
    output wire [NUM_SLAVES * 4-1:0] s_hprot_out,
    output wire [NUM_SLAVES-1:0] s_hsel_out,
    output wire [NUM_SLAVES-1:0] s_hwrite_out,
    output wire [NUM_SLAVES-1:0] s_hmastlock_out,
    input wire  [NUM_SLAVES-1:0] s_hresp_in,
    input wire  [NUM_SLAVES-1:0] s_hready_in,
    output wire [NUM_SLAVES-1:0] s_hready_out
);
//==========================================================
// START OF MODULE
//==========================================================
    genvar i;
    integer j;
    
    wire [NUM_SLAVES-1:0] bypass;
    wire [NUM_SLAVES-1:0] gte_base;
    wire [NUM_SLAVES-1:0] lte_last;

    // =====================================================
    // ROUTE MASTER --> SLAVE
    // =====================================================
    generate
        // Set select signal based on memory map
        // (Does not support overlapping ranges unless SEL_BYPASS = 1)
        for (i=0; i<NUM_SLAVES; i=i+1) begin : ahb_decoder
            assign bypass  [i] = (~SEL_BYPASS) ?  1  : (m_hsel_in == i) ? 1 : 0;
            assign gte_base[i] = (m_haddr_in >= SLAVE_BASE_ADDR[i*32+:32]) ? 1 : 0;
            assign lte_last[i] = (m_haddr_in <= SLAVE_LAST_ADDR[i*32+:32]) ? 1 : 0;
            assign s_hsel_out  [i] = bypass & gte_base & lte_last;
            assign s_hready_out[i] = m_hready_out;
        end

        // This is not a priority decoder. It is up to the RTL designer to
        // ensure there are no overlapping memory regions if SEL_BYPASS is not set
        for (i=0; i<NUM_SLAVES; i=i+1) begin : ahb_multiplexor
            assign s_haddr_out [32*i+:32] = (s_hsel_out[i]) ? m_haddr_in     : {ADDR_WIDTH{1'bx}};
            assign s_hwdata_out[32*i+:32] = (s_hsel_out[i]) ? m_hwdata_in    : {DATA_WIDTH{1'bx}};
            assign s_htrans_out[ 2*i+: 2] = (s_hsel_out[i]) ? m_htrans_in    : 2'b00; // Signal IDLE state
            assign s_hsize_out [ 3*i+: 3] = (s_hsel_out[i]) ? m_hsize_in     : 3'bxxx;
            assign s_hburst_out[ 3*i+: 3] = (s_hsel_out[i]) ? m_hburst_in    : 3'bxxx;
            assign s_hprot_out [ 4*i+: 4] = (s_hsel_out[i]) ? m_hprot_in     : 4'bxxxx;
            assign s_hwrite_out   [i] = (s_hsel_out[i]) ? m_hwrite_in    : 1'bx;
            assign s_hmastlock_out[i] = (s_hsel_out[i]) ? m_hmastlock_in : 1'bx;
        end
    endgenerate

    // =====================================================
    // ROUTE SLAVE --> MASTER
    // =====================================================
    always @(*) begin
        // If memory mapped to invalid region, response = ...
        //  - OKAY  for IDLE|BUSY
        //  - ERROR for SEQ|NONSEQ
        m_hresp_out  = m_htrans_in[1];
        m_hready_out = 1'b1;
        m_hrdata_out = {DATA_WIDTH{1'b0}};

        // Otherwise assign signal based on selected slave
        for (j=0; j<NUM_SLAVES; j=j+1) begin
            if (s_hsel_out[j]) begin
                m_hresp_out  = s_hresp_in [j];
                m_hready_out = s_hready_in[j];
            end
        end

        for (j=0; j<NUM_SLAVES*32; j=j+32)
            if (s_hsel_out[j])
                m_hrdata_out = s_hrdata_in[j+:32];
    end

endmodule

