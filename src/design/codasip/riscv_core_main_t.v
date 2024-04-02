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
 *  \brief   Contains module definition of the 'riscv_core_main_t' functional unit.
 */

module riscv_core_main_t(
    input  wire ACT,
    output wire ex_ACT,
    output wire fe_ACT,
    output wire id_ACT,
    output wire me_ACT,
    output wire pipeline_control_ACT,
    output wire wb_ACT
);
    // data-path code:
    // /home/project/riscv/model/ca/events/ca_main_reset.codal:52:11
    // ex();
    assign ex_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/events/ca_main_reset.codal:54:11
    // fe();
    assign fe_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/events/ca_main_reset.codal:53:11
    // id();
    assign id_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/events/ca_main_reset.codal:51:11
    // me();
    assign me_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/events/ca_main_reset.codal:55:25
    // pipeline_control();
    assign pipeline_control_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/events/ca_main_reset.codal:50:11
    // wb();
    assign wb_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // riscv_core_main_t
