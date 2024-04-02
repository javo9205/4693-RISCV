// ========================================================================//
// Engineer:       Ânderson Ignacio da Silva - anderson@aignacio.com       //
// Modified By:    James Vogenthaler - jamesvogen@gmail.com                //
//                                                                         //
// Design Name:    AHB Bus Matrix                                          //
// Module Name:    AHB_BUS                                                 //
// Project Name:   --                                                      //
// Language:       Verilog (Originally System Verilog)                     //
//                                                                         //
// Description:    This component implements a an AHB matrix, encompassing //
//                 a decoder and multiplexor to facilitate bus traffic     //
//                 between a single master and multiple slaves according   //
//                 to the AMBA 3 AHB Lite Specification.                   //
//                                                                         //
// ========================================================================//

module ahb_bus #(
    parameter NUM_SLAVES = 8,
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter SEL_BYPASS = 0
)(
    // SINGLE MASTER --> SELECTED SLAVE
    input wire [ADDR_WIDTH-1:0] m_haddr_in,
    input wire [DATA_WIDTH-1:0] m_hwdata_in,
    output reg [DATA_WIDTH-1:0] m_hrdata_out,

    input wire m_hsel_in,
    input wire m_hmastlock_in,
    input wire m_hwrite_in,
    input wire [1:0] m_htrans_in,
    input wire [2:0] m_hsize_in,
    input wire [2:0] m_hburst_in,
    input wire [3:0] m_hprot_in,
    output reg m_hready_out,
    output reg m_hresp_out,

    // SLAVES --> DECODER
    output wire [NUM_SLAVES-1:0][ADDR_WIDTH-1:0] s_haddr_out,
    output wire [NUM_SLAVES-1:0][DATA_WIDTH-1:0] s_hwdata_out,
    input wire  [NUM_SLAVES-1:0][DATA_WIDTH-1:0] s_hrdata_in,

    output wire [NUM_SLAVES-1:0] s_hsel_out,
    output wire [NUM_SLAVES-1:0] s_hmastlock_out,
    output wire [NUM_SLAVES-1:0] s_hwrite_out,
    output wire [NUM_SLAVES-1:0][1:0] s_htrans_out,
    output wire [NUM_SLAVES-1:0][2:0] s_hsize_out,
    output wire [NUM_SLAVES-1:0][2:0] s_hburst_out,
    output wire [NUM_SLAVES-1:0][3:0] s_hprot_out,
    input wire  [NUM_SLAVES-1:0] s_hresp_in,
    input wire  [NUM_SLAVES-1:0] s_hready_in,
    output wire [NUM_SLAVES-1:0] s_hready_out,

    // MEMORY MAPPING
    input wire [NUM_SLAVES-1:0][ADDR_WIDTH-1:0] s_base_addr_in,
    input wire [NUM_SLAVES-1:0][ADDR_WIDTH-1:0] s_last_addr_in
);
//==========================================================
// START OF MODULE
//==========================================================
    genvar i;
    integer j;

    // =====================================================
    // ROUTE MASTER --> SLAVE
    // =====================================================
    generate
        // Set select signal based on memory map
        // (Does not support overlapping ranges unless SEL_BYPASS = 1)
        for (i=0; i<NUM_SLAVES; i=i+1) begin : ahb_decoder
            assign s_hsel_out[i] = (SEL_BYPASS ? (m_hsel_in == i) : 1)
                               & (m_haddr_in >= s_base_addr_in[i])
                               & (m_haddr_in <= s_last_addr_in[i]);
            assign s_hready_out[i] = m_hready_out;
        end

        // This is not a priority decoder. It is up to the RTL designer to
        // ensure there are no overlapping memory regions if SEL_BYPASS is not set
        for (i=0; i<NUM_SLAVES; i=i+1) begin : ahb_multiplexor
            assign s_haddr_out [i]    = (s_hsel_out[i]) ? m_haddr_in     : {ADDR_WIDTH{1'bx}};
            assign s_hwdata_out[i]    = (s_hsel_out[i]) ? m_hwdata_in    : {DATA_WIDTH{1'bx}};
            assign s_hwrite_out[i]    = (s_hsel_out[i]) ? m_hwrite_in    : 1'bx;
            assign s_htrans_out[i]    = (s_hsel_out[i]) ? m_htrans_in    : 2'b00; // Signal IDLE state
            assign s_hsize_out [i]    = (s_hsel_out[i]) ? m_hsize_in     : 3'bxxx;
            assign s_hburst_out[i]    = (s_hsel_out[i]) ? m_hburst_in    : 3'bxxx;
            assign s_hprot_out [i]    = (s_hsel_out[i]) ? m_hprot_in     : 4'bxxxx;
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
                m_hrdata_out = s_hrdata_in[j];
            end
        end
    end

endmodule
