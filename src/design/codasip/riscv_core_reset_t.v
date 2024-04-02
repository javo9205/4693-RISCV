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
 *  \brief   Contains module definition of the 'riscv_core_reset_t' functional unit.
 */

module riscv_core_reset_t #(START_ADDRESS=32'h00001000)(
    input  wire ACT,
    output wire [31:0] r_pc_D,
    output wire r_pc_WE
);
    // data-path code:
    // /home/project/riscv/model/ca/events/ca_main_reset.codal:34:9
    // r_pc.write((int32)(0x1000));
    assign r_pc_D = (ACT == 1'b1) ? START_ADDRESS : 32'h00000000;
    // /home/project/riscv/model/ca/events/ca_main_reset.codal:34:9
    // r_pc.write((int32)(0x1000));
    assign r_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // riscv_core_reset_t
