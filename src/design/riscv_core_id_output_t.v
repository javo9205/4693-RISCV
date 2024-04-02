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
 *  \brief   Contains module definition of the 'riscv_core_id_output_t' functional unit.
 */

module riscv_core_id_output_t(
    input  wire ACT,
    input  wire [31:0] r_id_pc_Q,
    input  wire [3:0] s_id_aluop_Q,
    input  wire [1:0] s_id_alusrc1_Q,
    input  wire s_id_alusrc2_Q,
    input  wire [2:0] s_id_branchop_Q,
    input  wire s_id_brnch_sel_Q,
    input  wire [31:0] s_id_immed_Q,
    input  wire [31:0] s_id_instr_Q,
    input  wire [3:0] s_id_memop_Q,
    input  wire [4:0] s_id_rd_Q,
    input  wire [31:0] s_id_reg1_Q,
    input  wire [31:0] s_id_reg2_Q,
    input  wire s_id_regwrite_Q,
    input  wire [1:0] s_id_rfwt_sel_Q,
    input  wire [4:0] s_id_rs1_Q,
    input  wire [4:0] s_id_rs2_Q,
    output wire [3:0] r_ex_aluop_D,
    output wire r_ex_aluop_WE,
    output wire [1:0] r_ex_alusrc1_D,
    output wire r_ex_alusrc1_WE,
    output wire r_ex_alusrc2_D,
    output wire r_ex_alusrc2_WE,
    output wire [2:0] r_ex_branchop_D,
    output wire r_ex_branchop_WE,
    output wire r_ex_brnch_sel_D,
    output wire r_ex_brnch_sel_WE,
    output wire [31:0] r_ex_immed_D,
    output wire r_ex_immed_WE,
    output wire [3:0] r_ex_memop_D,
    output wire r_ex_memop_WE,
    output wire [31:0] r_ex_pc_D,
    output wire r_ex_pc_WE,
    output wire [4:0] r_ex_rd_D,
    output wire r_ex_rd_WE,
    output wire [31:0] r_ex_reg1_D,
    output wire r_ex_reg1_WE,
    output wire [31:0] r_ex_reg2_D,
    output wire r_ex_reg2_WE,
    output wire r_ex_regwrite_D,
    output wire r_ex_regwrite_WE,
    output wire [1:0] r_ex_rfwt_sel_D,
    output wire r_ex_rfwt_sel_WE,
    output wire [4:0] r_ex_rs1_D,
    output wire r_ex_rs1_WE,
    output wire [4:0] r_ex_rs2_D,
    output wire r_ex_rs2_WE,
    output wire [31:0] r_id_instr_preserved_D,
    output wire r_id_instr_preserved_WE,
    output wire [31:0] r_id_pc_preserved_D,
    output wire r_id_pc_preserved_WE
);
    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:207:9
    // r_ex_aluop.write(s_id_aluop.read());
    assign r_ex_aluop_D = s_id_aluop_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:207:9
    // r_ex_aluop.write(s_id_aluop.read());
    assign r_ex_aluop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:208:9
    // r_ex_alusrc1.write(s_id_alusrc1.read());
    assign r_ex_alusrc1_D = s_id_alusrc1_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:208:9
    // r_ex_alusrc1.write(s_id_alusrc1.read());
    assign r_ex_alusrc1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:209:9
    // r_ex_alusrc2.write(s_id_alusrc2.read());
    assign r_ex_alusrc2_D = s_id_alusrc2_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:209:9
    // r_ex_alusrc2.write(s_id_alusrc2.read());
    assign r_ex_alusrc2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:212:9
    // r_ex_branchop.write(s_id_branchop.read());
    assign r_ex_branchop_D = s_id_branchop_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:212:9
    // r_ex_branchop.write(s_id_branchop.read());
    assign r_ex_branchop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:213:9
    // r_ex_brnch_sel.write(s_id_brnch_sel.read());
    assign r_ex_brnch_sel_D = s_id_brnch_sel_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:213:9
    // r_ex_brnch_sel.write(s_id_brnch_sel.read());
    assign r_ex_brnch_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:206:9
    // r_ex_immed.write(s_id_immed.read());
    assign r_ex_immed_D = s_id_immed_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:206:9
    // r_ex_immed.write(s_id_immed.read());
    assign r_ex_immed_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:214:9
    // r_ex_memop.write(s_id_memop.read());
    assign r_ex_memop_D = s_id_memop_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:214:9
    // r_ex_memop.write(s_id_memop.read());
    assign r_ex_memop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:199:9
    // r_ex_pc.write(r_id_pc.read());
    assign r_ex_pc_D = r_id_pc_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:199:9
    // r_ex_pc.write(r_id_pc.read());
    assign r_ex_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:201:9
    // r_ex_rd.write(s_id_rd.read());
    assign r_ex_rd_D = s_id_rd_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:201:9
    // r_ex_rd.write(s_id_rd.read());
    assign r_ex_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:204:9
    // r_ex_reg1.write(s_id_reg1.read());
    assign r_ex_reg1_D = s_id_reg1_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:204:9
    // r_ex_reg1.write(s_id_reg1.read());
    assign r_ex_reg1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:205:9
    // r_ex_reg2.write(s_id_reg2.read());
    assign r_ex_reg2_D = s_id_reg2_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:205:9
    // r_ex_reg2.write(s_id_reg2.read());
    assign r_ex_reg2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:210:9
    // r_ex_regwrite.write(s_id_regwrite.read());
    assign r_ex_regwrite_D = s_id_regwrite_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:210:9
    // r_ex_regwrite.write(s_id_regwrite.read());
    assign r_ex_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:211:9
    // r_ex_rfwt_sel.write(s_id_rfwt_sel.read());
    assign r_ex_rfwt_sel_D = s_id_rfwt_sel_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:211:9
    // r_ex_rfwt_sel.write(s_id_rfwt_sel.read());
    assign r_ex_rfwt_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:202:9
    // r_ex_rs1.write(s_id_rs1.read());
    assign r_ex_rs1_D = s_id_rs1_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:202:9
    // r_ex_rs1.write(s_id_rs1.read());
    assign r_ex_rs1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:203:9
    // r_ex_rs2.write(s_id_rs2.read());
    assign r_ex_rs2_D = s_id_rs2_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:203:9
    // r_ex_rs2.write(s_id_rs2.read());
    assign r_ex_rs2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:221:9
    // r_id_instr_preserved.write(s_id_instr.read());
    assign r_id_instr_preserved_D = s_id_instr_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:221:9
    // r_id_instr_preserved.write(s_id_instr.read());
    assign r_id_instr_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:222:9
    // r_id_pc_preserved.write(r_id_pc.read());
    assign r_id_pc_preserved_D = r_id_pc_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe2_id.codal:222:9
    // r_id_pc_preserved.write(r_id_pc.read());
    assign r_id_pc_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // riscv_core_id_output_t
