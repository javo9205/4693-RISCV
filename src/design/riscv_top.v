/**
 *  Codasip s.r.o.
 * 
 *  CONFIDENTIAL
 * 
 *  Copyright 2024 Codasip s.r.o.
 * 
 *  All Rights Reserved.
 *  This file is part of the Codasip Studio product. No part of the Studio product, including this
 *  file, may be use, copied, modified, or distributed except in accordance with the terms contained
 *  in Codasip license agreement under which you obtained this file.  * 
 *  \file
 *  \date    2024-03-30
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains module definition of the 'riscv_top' ASIP top.
 */

module riscv_top(input CLK, RST, output [15:0] LED);
    localparam ROM_FILE="test3.mem";
    localparam ADDR_WIDTH=32;
    localparam DATA_WIDTH=32;
//    localparam NUM_SLAVES=1;
//    localparam SLAVE_BASE_ADDR = {32'h0000_0000};
//    localparam SLAVE_LAST_ADDR = {32'h0000_FFFF};

//	wire [ADDR_WIDTH-1:0] m_haddr;
//	wire [DATA_WIDTH-1:0] m_hrdata;
//	wire [DATA_WIDTH-1:0] m_hwdata;
//	wire [0:0] m_hmastlock;
//	wire [0:0] m_hwrite;
//	wire [1:0] m_htrans;
//	wire [3:0] m_hprot;
//	wire [2:0] m_hburst;
//	wire [2:0] m_hsize;
//	wire [0:0] m_hresp;
//	wire [0:0] m_hready;

	wire [ADDR_WIDTH-1:0] i_haddr;
	wire [DATA_WIDTH-1:0] i_hrdata;
	wire [DATA_WIDTH-1:0] i_hwdata;
	wire [0:0] i_hmastlock;
	wire [0:0] i_hwrite;
	wire [1:0] i_htrans;
	wire [3:0] i_hprot;
	wire [2:0] i_hburst;
	wire [2:0] i_hsize;
	wire [0:0] i_hresp;
	wire [0:0] i_hready;

	wire [ADDR_WIDTH-1:0] d_haddr;
	wire [DATA_WIDTH-1:0] d_hrdata;
	wire [DATA_WIDTH-1:0] d_hwdata;
	wire [0:0] d_hmastlock;
	wire [0:0] d_hwrite;
	wire [1:0] d_htrans;
	wire [3:0] d_hprot;
	wire [2:0] d_hburst;
	wire [2:0] d_hsize;
	wire [0:0] d_hresp;
	wire [0:0] d_hready;

    genvar x;

    assign i_hwdata = 32'h0;
    assign LED[1:0] = 2'b0;
    assign LED[15:14] = 2'b0;
    
    generate
        for (x=2; x<14; x=x+1) begin
            assign LED[x] = i_haddr[15-x];
        end
    endgenerate
	
//	ahb_bus #(
//	   .NUM_SLAVES(1),
//	   .DATA_WIDTH(DATA_WIDTH),
//	   .ADDR_WIDTH(ADDR_WIDTH),
//	   .SEL_BYPASS(0)
//	) ahb_matrix (
//	   .m_haddr_in   (m_haddr ),
//	   .m_hwdata_in  (m_hwdata),
//	   .m_hrdata_out (m_hrdata),
//	   .m_hsel_in    (1'b0),
//	   .m_hwrite_in  (m_hwrite),
//	   .m_htrans_in  (m_htrans),
//	   .m_hsize_in   (m_hsize ),
//	   .m_hburst_in  (m_hburst),
//	   .m_hprot_in   (m_hprot ),
//	   .m_hready_out (m_hready),
//	   .m_hresp_out  (m_hresp ),
//       .m_hmastlock_in (m_hmastlock),
       
//	   .s_haddr_out  (d_haddr ),
//	   .s_hwdata_out (d_hwdata),
//	   .s_hrdata_in  (d_hrdata),
//	   .s_hwrite_out (d_hwrite),
//	   .s_htrans_out (d_htrans),
//	   .s_hsize_out  (d_hsize ),
//	   .s_hburst_out (d_hburst),
//	   .s_hprot_out  (d_hprot ),
//	   .s_hresp_in   (d_hresp ),
//	   .s_hready_in  (d_hready),
//	   .s_hmastlock_out (d_hmastlock),
	   
//       .s_base_addr_in (SLAVE_BASE_ADDR),
//       .s_last_addr_in (SLAVE_LAST_ADDR)
//	);

    ahb_cache #(
        .INITIALIZE(1),
        .INIT_FILE(ROM_FILE)
    ) icache(
        .HCLK(CLK),
        .HRESETn(RST),
        .haddr (i_haddr ),
        .hwdata(i_hwdata),
        .hrdata(i_hrdata),
        .hwrite(i_hwrite),
        .hsel(1'b1),
        .hmastlock(i_hmastlock),
        .htrans(i_htrans),
        .hprot (i_hprot ),
        .hburst(i_hburst),
        .hsize (i_hsize ),
        .hresp (i_hresp ),
        .hready(i_hready)
    );

    ahb_cache dcache(
        .HCLK(CLK),
        .HRESETn(RST),
        .haddr (d_haddr ),
        .hrdata(d_hrdata),
        .hwdata(d_hwdata),
        .hwrite(d_hwrite),
        .hsel(1'b1),
        .hmastlock(d_hmastlock),
        .htrans(d_htrans),
        .hprot (d_hprot ),
        .hburst(d_hburst),
        .hsize (d_hsize ),
        .hresp (d_hresp ),
        .hready(d_hready)
    );

    // child instances inside ASIP top:
    // ASIP instance:
    riscv32ia riscv (
        .CLK(CLK),
        .RST(RST),
        .if_code_HADDR (i_haddr ),
        .if_code_HRDATA(i_hrdata),
        .if_code_HWRITE(i_hwrite),
        .if_code_HREADY(i_hready),
        .if_code_HRESP (i_hresp ),
        .if_code_HBURST(i_hburst),
        .if_code_HPROT (i_hprot ),
        .if_code_HSIZE (i_hsize ),
        .if_code_HTRANS(i_htrans),
        .if_code_HMASTLOCK(i_hmastlock),
        .ldst_HADDR (d_haddr ),
        .ldst_HRDATA(d_hrdata),
        .ldst_HWDATA(d_hwdata),
        .ldst_HWRITE(d_hwrite),
        .ldst_HREADY(d_hready),
        .ldst_HRESP (d_hresp ),
        .ldst_HBURST(d_hburst),
        .ldst_HPROT (d_hprot ),
        .ldst_HSIZE (d_hsize ),
        .ldst_HTRANS(d_htrans),
        .ldst_HMASTLOCK(d_hmastlock)
    );

endmodule // riscv_top
