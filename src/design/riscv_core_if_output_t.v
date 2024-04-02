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
 *  \brief   Contains module definition of the 'riscv_core_if_output_t' functional unit.
 */

module riscv_core_if_output_t(
    input  wire ACT,
    input  wire [31:0] r_pc_Q,
    input  wire s_id_clear_Q,
    input  wire s_id_stall_Q,
    input  wire [31:0] s_if_pcin_Q,
    output wire r_id_clear_D,
    output wire r_id_clear_WE,
    output wire [31:0] r_id_pc_D,
    output wire r_id_pc_WE,
    output wire r_id_stall_D,
    output wire r_id_stall_WE,
    output wire [31:0] r_pc_D,
    output wire r_pc_WE
);
    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:85:9
    // r_id_clear.write(s_id_clear.read());
    assign r_id_clear_D = s_id_clear_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:85:9
    // r_id_clear.write(s_id_clear.read());
    assign r_id_clear_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:83:9
    // r_id_pc.write(r_pc.read());
    assign r_id_pc_D = (ACT == 1'b1) ? r_pc_Q : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:83:9
    // r_id_pc.write(r_pc.read());
    assign r_id_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:86:9
    // r_id_stall.write(s_id_stall.read());
    assign r_id_stall_D = s_id_stall_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:86:9
    // r_id_stall.write(s_id_stall.read());
    assign r_id_stall_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:84:9
    // r_pc.write(s_if_pcin.read());
    assign r_pc_D = (ACT == 1'b1) ? s_if_pcin_Q : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:84:9
    // r_pc.write(s_if_pcin.read());
    assign r_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // riscv_core_if_output_t
