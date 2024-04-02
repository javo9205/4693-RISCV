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
 *  in Codasip license agreement under which you obtained this file.
 * 
 *  \file
 *  \date    2024-03-30
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains module definition of the 'riscv_ldst_t' CodAL interface.
 */

module riscv_ldst_t(
    input  wire ldst_HREADY,
    input  wire ldst_HRESP,
    input  wire [31:0] ldst_HRDATA,
    input  wire [31:0] HADDR,
    input  wire [2:0] HBURST,
    input  wire HMASTLOCK,
    input  wire [3:0] HPROT,
    input  wire [2:0] HSIZE,
    input  wire [1:0] HTRANS,
    input  wire HWRITE,
    input  wire [31:0] HWDATA,
    output wire [31:0] ldst_HADDR,
    output wire [2:0] ldst_HBURST,
    output wire ldst_HMASTLOCK,
    output wire [3:0] ldst_HPROT,
    output wire [2:0] ldst_HSIZE,
    output wire [1:0] ldst_HTRANS,
    output wire ldst_HWRITE,
    output wire [31:0] ldst_HWDATA,
    output wire HREADY,
    output wire HRESP,
    output wire [31:0] HRDATA
);
    // data-path code:
    assign ldst_HADDR = HADDR;
    assign ldst_HBURST = HBURST;
    assign ldst_HMASTLOCK = HMASTLOCK;
    assign ldst_HPROT = HPROT;
    assign ldst_HSIZE = HSIZE;
    assign ldst_HTRANS = HTRANS;
    assign ldst_HWRITE = HWRITE;
    assign HRESP = ldst_HRESP;
    assign HREADY = ldst_HREADY;
    assign HRDATA = ldst_HRDATA;
    assign ldst_HWDATA = HWDATA;
endmodule // riscv_ldst_t
