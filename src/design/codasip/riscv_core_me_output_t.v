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
 *  \brief   Contains module definition of the 'riscv_core_me_output_t' functional unit.
 */

module riscv_core_me_output_t(
    input  wire ACT,
    input  wire [31:0] r_me_alu_Q,
    input  wire [31:0] r_me_pc_Q,
    input  wire [4:0] r_me_rd_Q,
    input  wire r_me_regwrite_Q,
    input  wire [1:0] r_me_rfwt_sel_Q,
    input  wire [31:0] s_me_memdat_Q,
    output wire [31:0] r_wb_alu_D,
    output wire r_wb_alu_WE,
    output wire [31:0] r_wb_memdat_D,
    output wire r_wb_memdat_WE,
    output wire [31:0] r_wb_pc_D,
    output wire r_wb_pc_WE,
    output wire [4:0] r_wb_rd_D,
    output wire r_wb_rd_WE,
    output wire r_wb_regwrite_D,
    output wire r_wb_regwrite_WE,
    output wire [1:0] r_wb_rfwt_sel_D,
    output wire r_wb_rfwt_sel_WE
);
    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:135:9
    // r_wb_alu.write(r_me_alu.read());
    assign r_wb_alu_D = r_me_alu_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:135:9
    // r_wb_alu.write(r_me_alu.read());
    assign r_wb_alu_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:137:9
    // r_wb_memdat.write(s_me_memdat.read());
    assign r_wb_memdat_D = s_me_memdat_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:137:9
    // r_wb_memdat.write(s_me_memdat.read());
    assign r_wb_memdat_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:131:9
    // r_wb_pc.write(r_me_pc.read());
    assign r_wb_pc_D = r_me_pc_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:131:9
    // r_wb_pc.write(r_me_pc.read());
    assign r_wb_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:136:9
    // r_wb_rd.write(r_me_rd.read());
    assign r_wb_rd_D = r_me_rd_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:136:9
    // r_wb_rd.write(r_me_rd.read());
    assign r_wb_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:133:9
    // r_wb_regwrite.write(r_me_regwrite.read());
    assign r_wb_regwrite_D = r_me_regwrite_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:133:9
    // r_wb_regwrite.write(r_me_regwrite.read());
    assign r_wb_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:134:9
    // r_wb_rfwt_sel.write(r_me_rfwt_sel.read());
    assign r_wb_rfwt_sel_D = r_me_rfwt_sel_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:134:9
    // r_wb_rfwt_sel.write(r_me_rfwt_sel.read());
    assign r_wb_rfwt_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // riscv_core_me_output_t
