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
 *  \date    2024-04-20
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains module definition of the 'superscalar_ca' ASIP.
 */

`include "AHB_Interface.svh"

module superscalar(
    input  wire CLK,
    input  wire RST,
    AHB_Interface.Slave if1, if2, ldst1, ldst2
);
    // type, wire and constant declarations:
    // verilator lint_off UNUSED
    // signal/wire
    wire codasip_halt_wire;
    // verilator lint_on UNUSED

    // ASIP core instance:
    superscalar_core_t core (
        .CLK(CLK),
        .RST(RST),
        .if1_ahb_HRDATA(if1.hrdata),
        .if1_ahb_HREADY(if1.hready),
        .if1_ahb_HRESP(if1.hresp),
        .if1_ahb_HADDR(if1.haddr),
        .if1_ahb_HBURST(if1.hburst),
        .if1_ahb_HMASTLOCK(if1.hmastlock),
        .if1_ahb_HPROT(if1.hprot),
        .if1_ahb_HSIZE(if1.hsize),
        .if1_ahb_HTRANS(if1.htrans),
        .if1_ahb_HWRITE(if1.hwrite),

        .if2_ahb_HRDATA(if2.hrdata),
        .if2_ahb_HREADY(if2.hready),
        .if2_ahb_HRESP(if2.hresp),
        .if2_ahb_HADDR(if2.haddr),
        .if2_ahb_HBURST(if2.hburst),
        .if2_ahb_HMASTLOCK(if2.hmastlock),
        .if2_ahb_HPROT(if2.hprot),
        .if2_ahb_HSIZE(if2.hsize),
        .if2_ahb_HTRANS(if2.htrans),
        .if2_ahb_HWRITE(if2.hwrite),

        .ldst1_ahb_HRDATA(ldst1.hrdata),
        .ldst1_ahb_HREADY(ldst1.hready),
        .ldst1_ahb_HRESP(ldst1.hresp),
        .ldst1_ahb_HADDR(ldst1.haddr),
        .ldst1_ahb_HBURST(ldst1.hburst),
        .ldst1_ahb_HMASTLOCK(ldst1.hmastlock),
        .ldst1_ahb_HPROT(ldst1.hprot),
        .ldst1_ahb_HSIZE(ldst1.hsize),
        .ldst1_ahb_HTRANS(ldst1.htrans),
        .ldst1_ahb_HWDATA(ldst1.hwdata),
        .ldst1_ahb_HWRITE(ldst1.hwrite),

        .ldst2_ahb_HRDATA(ldst2.hrdata),
        .ldst2_ahb_HREADY(ldst2.hready),
        .ldst2_ahb_HRESP(ldst2.hresp),
        .ldst2_ahb_HADDR(ldst2.haddr),
        .ldst2_ahb_HBURST(ldst2.hburst),
        .ldst2_ahb_HMASTLOCK(ldst2.hmastlock),
        .ldst2_ahb_HPROT(ldst2.hprot),
        .ldst2_ahb_HSIZE(ldst2.hsize),
        .ldst2_ahb_HTRANS(ldst2.htrans),
        .ldst2_ahb_HWDATA(ldst2.hwdata),
        .ldst2_ahb_HWRITE(ldst2.hwrite)
    );

endmodule // superscalar_ca
