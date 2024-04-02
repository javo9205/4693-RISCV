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
 *  \brief   Contains module definition of the 'riscv_if_code_t' CodAL interface.
 */

module riscv_if_code_t(
    input  wire if_code_HREADY,
    input  wire if_code_HRESP,
    input  wire [31:0] if_code_HRDATA,
    input  wire [31:0] HADDR,
    input  wire [2:0] HBURST,
    input  wire HMASTLOCK,
    input  wire [3:0] HPROT,
    input  wire [2:0] HSIZE,
    input  wire [1:0] HTRANS,
    input  wire HWRITE,
    output wire [31:0] if_code_HADDR,
    output wire [2:0] if_code_HBURST,
    output wire if_code_HMASTLOCK,
    output wire [3:0] if_code_HPROT,
    output wire [2:0] if_code_HSIZE,
    output wire [1:0] if_code_HTRANS,
    output wire if_code_HWRITE,
    output wire HREADY,
    output wire HRESP,
    output wire [31:0] HRDATA
);
    // data-path code:
    assign if_code_HADDR = HADDR;
    assign if_code_HBURST = HBURST;
    assign if_code_HMASTLOCK = HMASTLOCK;
    assign if_code_HPROT = HPROT;
    assign if_code_HSIZE = HSIZE;
    assign if_code_HTRANS = HTRANS;
    assign if_code_HWRITE = HWRITE;
    assign HRESP = if_code_HRESP;
    assign HREADY = if_code_HREADY;
    assign HRDATA = if_code_HRDATA;
endmodule // riscv_if_code_t
