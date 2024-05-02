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

module riscv_top(
    input CLK, RST,
    input  [15:0] SW,
    output [15:0] LED,
    output [ 5:0] RGB,
    output [15:0] D_7SEG,
    output [ 7:0] EN_7SEG
);
    localparam ROM_FILE="test3.mem";
    localparam ADDR_WIDTH=32;
    localparam DATA_WIDTH=32;
    localparam NUM_SLAVES=2;
    localparam SLAVE_BASE_ADDR = {32'h8000,32'hFFFF8000};
    localparam SLAVE_LAST_ADDR = {32'h8004,32'hFFFFFFFF};

	wire [ADDR_WIDTH-1:0] m_haddr;
	wire [DATA_WIDTH-1:0] m_hrdata;
	wire [DATA_WIDTH-1:0] m_hwdata;
	wire [0:0] m_hmastlock;
	wire [0:0] m_hwrite;
	wire [1:0] m_htrans;
	wire [3:0] m_hprot;
	wire [2:0] m_hburst;
	wire [2:0] m_hsize;
	wire [0:0] m_hresp;
	wire [0:0] m_hready;

    localparam N = NUM_SLAVES;
	wire [N*ADDR_WIDTH-1:0] s_haddr;
	wire [N*DATA_WIDTH-1:0] s_hrdata;
	wire [N*DATA_WIDTH-1:0] s_hwdata;
	wire [N*1-1:0] s_hsel;
	wire [N*1-1:0] s_hmastlock;
	wire [N*1-1:0] s_hwrite;
	wire [N*2-1:0] s_htrans;
	wire [N*3-1:0] s_hburst;
	wire [N*4-1:0] s_hprot;
	wire [N*3-1:0] s_hsize;
	wire [N*1-1:0] s_hresp;
	wire [N*1-1:0] s_hready;

	wire [ADDR_WIDTH-1:0] i_haddr;
	wire [DATA_WIDTH-1:0] i_hrdata;
	wire [DATA_WIDTH-1:0] i_hwdata;
	wire [0:0] i_hmastlock;
	wire [0:0] i_hwrite;
	wire [2:0] i_hburst;
	wire [1:0] i_htrans;
	wire [3:0] i_hprot;
	wire [2:0] i_hsize;
	wire [0:0] i_hresp;
	wire [0:0] i_hready;

    assign LED = {2'b0, i_haddr[13:2], 2'b0};
    assign i_hwdata = 32'h0;
    

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
        .ldst_HADDR (m_haddr ),
        .ldst_HRDATA(m_hrdata),
        .ldst_HWDATA(m_hwdata),
        .ldst_HWRITE(m_hwrite),
        .ldst_HREADY(m_hready),
        .ldst_HRESP (m_hresp ),
        .ldst_HBURST(m_hburst),
        .ldst_HPROT (m_hprot ),
        .ldst_HSIZE (m_hsize ),
        .ldst_HTRANS(m_htrans),
        .ldst_HMASTLOCK(m_hmastlock)
    );
	
	AHB_Bus #(
	   .NUM_SLAVES(NUM_SLAVES),
	   .DATA_WIDTH(DATA_WIDTH),
	   .ADDR_WIDTH(ADDR_WIDTH),
	   .SLAVE_BASE_ADDR(SLAVE_BASE_ADDR),
	   .SLAVE_LAST_ADDR(SLAVE_LAST_ADDR),
	   .SEL_BYPASS(0)
	) ahb_bus_matrix (
	   .m_haddr_in   (m_haddr ),
	   .m_hwdata_in  (m_hwdata),
	   .m_hrdata_out (m_hrdata),
	   .m_hsel_in    (1'b0    ),
       .m_hmastlock_in (m_hmastlock),
	   .m_hwrite_in  (m_hwrite),
	   .m_htrans_in  (m_htrans),
	   .m_hsize_in   (m_hsize ),
	   .m_hburst_in  (m_hburst),
	   .m_hprot_in   (m_hprot ),
	   .m_hready_out (m_hready),
	   .m_hresp_out  (m_hresp ),
       
	   .s_haddr_out  (s_haddr ),
	   .s_hwdata_out (s_hwdata),
	   .s_hrdata_in  (s_hrdata),
	   .s_hsel_out   (s_hsel  ),
	   .s_hmastlock_out (s_hmastlock),
	   .s_hwrite_out (s_hwrite),
	   .s_htrans_out (s_htrans),
	   .s_hsize_out  (s_hsize ),
	   .s_hburst_out (s_hburst),
	   .s_hprot_out  (s_hprot ),
	   .s_hresp_in   (s_hresp ),
	   .s_hready_in  (s_hready)
	);

    AHB_Cache #(
        .INITIALIZE(1),
        .INIT_FILE("hello.mem")
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

    AHB_Cache #(
        .START_ADDR(SLAVE_BASE_ADDR[31:0])
    ) dcache (
        .HCLK(CLK),
        .HRESETn(RST),
        .haddr (s_haddr [31:0]),
        .hrdata(s_hrdata[31:0]),
        .hwdata(s_hwdata[31:0]),
        .hwrite(s_hwrite[0]),
        .hsel  (s_hsel  [0]),
        .hmastlock(s_hmastlock[0]),
        .htrans(s_htrans[1:0]),
        .hsize (s_hsize [2:0]),
        .hburst(s_hburst[2:0]),
        .hprot (s_hprot [3:0]),
        .hresp (s_hresp [0]),
        .hready(s_hready[0])
    );
    
    AHB_GPIO #(
        .START_ADDR(SLAVE_BASE_ADDR[63:32])
    ) gpio (
        .SW (SW),
//        .LED(LED),
        .RGB(RGB),
        .D_7SEG (D_7SEG),
        .EN_7SEG(EN_7SEG),
        .haddr (s_haddr [1*32+:32]),
        .hwdata(s_hwdata[1*32+:32]),
        .hrdata(s_hwdata[1*32+:32]),
        .hwrite(s_hwrite[1]),
        .hmastlock(s_hmastlock[1]),
        .hsel  (s_hsel  [1]),
        .htrans(s_htrans[1*2+:2]),
        .hsize (s_hsize [1*3+:3]),
        .hburst(s_hburst[1*3+:3]),
        .hprot (s_hprot [1*4+:4]),
        .hresp (s_hresp [1]),
        .hready(s_hready[1])
    );

endmodule // riscv_top
