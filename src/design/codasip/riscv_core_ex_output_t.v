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
 *  \brief   Contains module definition of the 'riscv_core_ex_output_t' functional unit.
 */

module riscv_core_ex_output_t(
    input  wire ACT,
    input  wire [2:0] r_ex_branchop_Q,
    input  wire [3:0] r_ex_memop_Q,
    input  wire [31:0] r_ex_pc_Q,
    input  wire [4:0] r_ex_rd_Q,
    input  wire r_ex_regwrite_Q,
    input  wire [1:0] r_ex_rfwt_sel_Q,
    input  wire [31:0] s_ex_alu_Q,
    input  wire [31:0] s_ex_bradd_Q,
    input  wire [31:0] s_ex_encoded_Q,
    input  wire s_ex_zero_Q,
    output wire [31:0] r_me_alu_D,
    output wire r_me_alu_WE,
    output wire [31:0] r_me_bradd_D,
    output wire r_me_bradd_WE,
    output wire [2:0] r_me_branchop_D,
    output wire r_me_branchop_WE,
    output wire [3:0] r_me_memop_D,
    output wire r_me_memop_WE,
    output wire [31:0] r_me_pc_D,
    output wire r_me_pc_WE,
    output wire [4:0] r_me_rd_D,
    output wire r_me_rd_WE,
    output wire r_me_regwrite_D,
    output wire r_me_regwrite_WE,
    output wire [1:0] r_me_rfwt_sel_D,
    output wire r_me_rfwt_sel_WE,
    output wire [31:0] r_me_wtdat_D,
    output wire r_me_wtdat_WE,
    output wire r_me_zero_D,
    output wire r_me_zero_WE
);
    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:322:9
    // r_me_alu.write(s_ex_alu.read());
    assign r_me_alu_D = s_ex_alu_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:322:9
    // r_me_alu.write(s_ex_alu.read());
    assign r_me_alu_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:324:9
    // r_me_bradd.write(s_ex_bradd.read());
    assign r_me_bradd_D = s_ex_bradd_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:324:9
    // r_me_bradd.write(s_ex_bradd.read());
    assign r_me_bradd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:319:9
    // r_me_branchop.write(r_ex_branchop.read());
    assign r_me_branchop_D = r_ex_branchop_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:319:9
    // r_me_branchop.write(r_ex_branchop.read());
    assign r_me_branchop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:320:9
    // r_me_memop.write(r_ex_memop.read());
    assign r_me_memop_D = r_ex_memop_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:320:9
    // r_me_memop.write(r_ex_memop.read());
    assign r_me_memop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:315:9
    // r_me_pc.write(r_ex_pc.read());
    assign r_me_pc_D = r_ex_pc_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:315:9
    // r_me_pc.write(r_ex_pc.read());
    assign r_me_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:321:9
    // r_me_rd.write(r_ex_rd.read());
    assign r_me_rd_D = r_ex_rd_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:321:9
    // r_me_rd.write(r_ex_rd.read());
    assign r_me_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:317:9
    // r_me_regwrite.write(r_ex_regwrite.read());
    assign r_me_regwrite_D = r_ex_regwrite_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:317:9
    // r_me_regwrite.write(r_ex_regwrite.read());
    assign r_me_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:318:9
    // r_me_rfwt_sel.write(r_ex_rfwt_sel.read());
    assign r_me_rfwt_sel_D = r_ex_rfwt_sel_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:318:9
    // r_me_rfwt_sel.write(r_ex_rfwt_sel.read());
    assign r_me_rfwt_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:325:9
    // r_me_wtdat.write(s_ex_encoded.read());
    assign r_me_wtdat_D = s_ex_encoded_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:325:9
    // r_me_wtdat.write(s_ex_encoded.read());
    assign r_me_wtdat_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:323:9
    // r_me_zero.write(s_ex_zero.read());
    assign r_me_zero_D = s_ex_zero_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:323:9
    // r_me_zero.write(s_ex_zero.read());
    assign r_me_zero_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // riscv_core_ex_output_t
