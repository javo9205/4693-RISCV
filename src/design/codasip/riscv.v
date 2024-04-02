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
 *  \brief   Contains module definition of the 'riscv' ASIP.
 */

module riscv32ia #(START_ADDRESS=32'h00001000) (
    input  wire CLK,
    input  wire RST,
    input  wire [31:0] if_code_HRDATA,
    input  wire if_code_HREADY,
    input  wire if_code_HRESP,
    input  wire [31:0] ldst_HRDATA,
    input  wire ldst_HREADY,
    input  wire ldst_HRESP,
    output wire [31:0] if_code_HADDR,
    output wire [2:0] if_code_HBURST,
    output wire if_code_HMASTLOCK,
    output wire [3:0] if_code_HPROT,
    output wire [2:0] if_code_HSIZE,
    output wire [1:0] if_code_HTRANS,
    output wire if_code_HWRITE,
    output wire [31:0] ldst_HADDR,
    output wire [2:0] ldst_HBURST,
    output wire ldst_HMASTLOCK,
    output wire [3:0] ldst_HPROT,
    output wire [2:0] ldst_HSIZE,
    output wire [1:0] ldst_HTRANS,
    output wire [31:0] ldst_HWDATA,
    output wire ldst_HWRITE
);
    // type, wire and constant declarations:
    // verilator lint_off UNUSED
    // signal/wire
    wire codasip_halt_wire;
    // verilator lint_on UNUSED

    // additional declarations:
    wire [31:0] core_if_code_HADDR_wire;
    wire [2:0] core_if_code_HBURST_wire;
    wire core_if_code_HMASTLOCK_wire;
    wire [3:0] core_if_code_HPROT_wire;
    wire [2:0] core_if_code_HSIZE_wire;
    wire [1:0] core_if_code_HTRANS_wire;
    wire core_if_code_HWRITE_wire;
    wire if_code_HREADY_wire;
    wire if_code_HRESP_wire;
    wire [31:0] if_code_HRDATA_wire;
    wire [31:0] core_ldst_HADDR_wire;
    wire [2:0] core_ldst_HBURST_wire;
    wire core_ldst_HMASTLOCK_wire;
    wire [3:0] core_ldst_HPROT_wire;
    wire [2:0] core_ldst_HSIZE_wire;
    wire [1:0] core_ldst_HTRANS_wire;
    wire core_ldst_HWRITE_wire;
    wire [31:0] core_ldst_HWDATA_wire;
    wire ldst_HREADY_wire;
    wire ldst_HRESP_wire;
    wire [31:0] ldst_HRDATA_wire;

    // child instances inside ASIP:
    // instance of 'codasip_halt_wire' signal/wire: (missing driver)
    assign codasip_halt_wire = 1'b0;
    // CodAL interface instance:
    riscv_if_code_t if_code (
        .if_code_HREADY(if_code_HREADY),
        .if_code_HRESP(if_code_HRESP),
        .if_code_HRDATA(if_code_HRDATA),
        .HADDR(core_if_code_HADDR_wire),
        .HBURST(core_if_code_HBURST_wire),
        .HMASTLOCK(core_if_code_HMASTLOCK_wire),
        .HPROT(core_if_code_HPROT_wire),
        .HSIZE(core_if_code_HSIZE_wire),
        .HTRANS(core_if_code_HTRANS_wire),
        .HWRITE(core_if_code_HWRITE_wire),
        .if_code_HADDR(if_code_HADDR),
        .if_code_HBURST(if_code_HBURST),
        .if_code_HMASTLOCK(if_code_HMASTLOCK),
        .if_code_HPROT(if_code_HPROT),
        .if_code_HSIZE(if_code_HSIZE),
        .if_code_HTRANS(if_code_HTRANS),
        .if_code_HWRITE(if_code_HWRITE),
        .HREADY(if_code_HREADY_wire),
        .HRESP(if_code_HRESP_wire),
        .HRDATA(if_code_HRDATA_wire)
    );

    // CodAL interface instance:
    riscv_ldst_t ldst (
        .ldst_HREADY(ldst_HREADY),
        .ldst_HRESP(ldst_HRESP),
        .ldst_HRDATA(ldst_HRDATA),
        .HADDR(core_ldst_HADDR_wire),
        .HBURST(core_ldst_HBURST_wire),
        .HMASTLOCK(core_ldst_HMASTLOCK_wire),
        .HPROT(core_ldst_HPROT_wire),
        .HSIZE(core_ldst_HSIZE_wire),
        .HTRANS(core_ldst_HTRANS_wire),
        .HWRITE(core_ldst_HWRITE_wire),
        .HWDATA(core_ldst_HWDATA_wire),
        .ldst_HADDR(ldst_HADDR),
        .ldst_HBURST(ldst_HBURST),
        .ldst_HMASTLOCK(ldst_HMASTLOCK),
        .ldst_HPROT(ldst_HPROT),
        .ldst_HSIZE(ldst_HSIZE),
        .ldst_HTRANS(ldst_HTRANS),
        .ldst_HWRITE(ldst_HWRITE),
        .ldst_HWDATA(ldst_HWDATA),
        .HREADY(ldst_HREADY_wire),
        .HRESP(ldst_HRESP_wire),
        .HRDATA(ldst_HRDATA_wire)
    );

    // ASIP core instance:
    riscv_core_t #(START_ADDRESS) core (
        .CLK(CLK),
        .RST(RST),
        .if_code_HRDATA(if_code_HRDATA_wire),
        .if_code_HREADY(if_code_HREADY_wire),
        .if_code_HRESP(if_code_HRESP_wire),
        .ldst_HRDATA(ldst_HRDATA_wire),
        .ldst_HREADY(ldst_HREADY_wire),
        .ldst_HRESP(ldst_HRESP_wire),
        .if_code_HADDR(core_if_code_HADDR_wire),
        .if_code_HBURST(core_if_code_HBURST_wire),
        .if_code_HMASTLOCK(core_if_code_HMASTLOCK_wire),
        .if_code_HPROT(core_if_code_HPROT_wire),
        .if_code_HSIZE(core_if_code_HSIZE_wire),
        .if_code_HTRANS(core_if_code_HTRANS_wire),
        .if_code_HWRITE(core_if_code_HWRITE_wire),
        .ldst_HADDR(core_ldst_HADDR_wire),
        .ldst_HBURST(core_ldst_HBURST_wire),
        .ldst_HMASTLOCK(core_ldst_HMASTLOCK_wire),
        .ldst_HPROT(core_ldst_HPROT_wire),
        .ldst_HSIZE(core_ldst_HSIZE_wire),
        .ldst_HTRANS(core_ldst_HTRANS_wire),
        .ldst_HWDATA(core_ldst_HWDATA_wire),
        .ldst_HWRITE(core_ldst_HWRITE_wire)
    );

endmodule // riscv

