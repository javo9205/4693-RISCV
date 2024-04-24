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
 *  \date    2024-04-23
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains module definition of the 'id1_output_t' functional unit.
 */

module id1_output_t(
    input  wire ACT,
    input  wire r_id1_valid_Q,
    input  wire [3:0] s_id1_aluop_Q,
    input  wire [1:0] s_id1_alusrc1_Q,
    input  wire s_id1_alusrc2_Q,
    input  wire [2:0] s_id1_branchop_Q,
    input  wire s_id1_brnch_sel_Q,
    input  wire [31:0] s_id1_immed_Q,
    input  wire [31:0] s_id1_instr_Q,
    input  wire [3:0] s_id1_memop_Q,
    input  wire s_id1_order_Q,
    input  wire [31:0] s_id1_pc_Q,
    input  wire [4:0] s_id1_rd_Q,
    input  wire [31:0] s_id1_reg1_Q,
    input  wire [31:0] s_id1_reg2_Q,
    input  wire s_id1_regwrite_Q,
    input  wire [1:0] s_id1_rfwt_sel_Q,
    input  wire [4:0] s_id1_rs1_Q,
    input  wire [4:0] s_id1_rs2_Q,
    output wire [3:0] r_ex1_aluop_D,
    output wire r_ex1_aluop_WE,
    output wire [1:0] r_ex1_alusrc1_D,
    output wire r_ex1_alusrc1_WE,
    output wire r_ex1_alusrc2_D,
    output wire r_ex1_alusrc2_WE,
    output wire [2:0] r_ex1_branchop_D,
    output wire r_ex1_branchop_WE,
    output wire r_ex1_brnch_sel_D,
    output wire r_ex1_brnch_sel_WE,
    output wire [31:0] r_ex1_immed_D,
    output wire r_ex1_immed_WE,
    output wire [3:0] r_ex1_memop_D,
    output wire r_ex1_memop_WE,
    output wire r_ex1_order_D,
    output wire r_ex1_order_WE,
    output wire [31:0] r_ex1_pc_D,
    output wire r_ex1_pc_WE,
    output wire [4:0] r_ex1_rd_D,
    output wire r_ex1_rd_WE,
    output wire [31:0] r_ex1_reg1_D,
    output wire r_ex1_reg1_WE,
    output wire [31:0] r_ex1_reg2_D,
    output wire r_ex1_reg2_WE,
    output wire r_ex1_regwrite_D,
    output wire r_ex1_regwrite_WE,
    output wire [1:0] r_ex1_rfwt_sel_D,
    output wire r_ex1_rfwt_sel_WE,
    output wire [4:0] r_ex1_rs1_D,
    output wire r_ex1_rs1_WE,
    output wire [4:0] r_ex1_rs2_D,
    output wire r_ex1_rs2_WE,
    output wire r_ex1_valid_D,
    output wire r_ex1_valid_WE,
    output wire [31:0] r_id1_instr_preserved_D,
    output wire r_id1_instr_preserved_WE,
    output wire r_id1_order_preserved_D,
    output wire r_id1_order_preserved_WE,
    output wire [31:0] r_id1_pc_preserved_D,
    output wire r_id1_pc_preserved_WE
);
    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:244:9
    // r_ex1_aluop.write(s_id1_aluop.read());
    assign r_ex1_aluop_D = s_id1_aluop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:244:9
    // r_ex1_aluop.write(s_id1_aluop.read());
    assign r_ex1_aluop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:245:9
    // r_ex1_alusrc1.write(s_id1_alusrc1.read());
    assign r_ex1_alusrc1_D = s_id1_alusrc1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:245:9
    // r_ex1_alusrc1.write(s_id1_alusrc1.read());
    assign r_ex1_alusrc1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:246:9
    // r_ex1_alusrc2.write(s_id1_alusrc2.read());
    assign r_ex1_alusrc2_D = s_id1_alusrc2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:246:9
    // r_ex1_alusrc2.write(s_id1_alusrc2.read());
    assign r_ex1_alusrc2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:249:9
    // r_ex1_branchop.write(s_id1_branchop.read());
    assign r_ex1_branchop_D = s_id1_branchop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:249:9
    // r_ex1_branchop.write(s_id1_branchop.read());
    assign r_ex1_branchop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:250:9
    // r_ex1_brnch_sel.write(s_id1_brnch_sel.read());
    assign r_ex1_brnch_sel_D = s_id1_brnch_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:250:9
    // r_ex1_brnch_sel.write(s_id1_brnch_sel.read());
    assign r_ex1_brnch_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:243:9
    // r_ex1_immed.write(s_id1_immed.read());
    assign r_ex1_immed_D = s_id1_immed_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:243:9
    // r_ex1_immed.write(s_id1_immed.read());
    assign r_ex1_immed_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:251:9
    // r_ex1_memop.write(s_id1_memop.read());
    assign r_ex1_memop_D = s_id1_memop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:251:9
    // r_ex1_memop.write(s_id1_memop.read());
    assign r_ex1_memop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:253:9
    // r_ex1_order.write(s_id1_order.read());
    assign r_ex1_order_D = s_id1_order_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:253:9
    // r_ex1_order.write(s_id1_order.read());
    assign r_ex1_order_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:236:9
    // r_ex1_pc.write(s_id1_pc.read());
    assign r_ex1_pc_D = s_id1_pc_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:236:9
    // r_ex1_pc.write(s_id1_pc.read());
    assign r_ex1_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:238:9
    // r_ex1_rd.write(s_id1_rd.read());
    assign r_ex1_rd_D = s_id1_rd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:238:9
    // r_ex1_rd.write(s_id1_rd.read());
    assign r_ex1_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:241:9
    // r_ex1_reg1.write(s_id1_reg1.read());
    assign r_ex1_reg1_D = s_id1_reg1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:241:9
    // r_ex1_reg1.write(s_id1_reg1.read());
    assign r_ex1_reg1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:242:9
    // r_ex1_reg2.write(s_id1_reg2.read());
    assign r_ex1_reg2_D = s_id1_reg2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:242:9
    // r_ex1_reg2.write(s_id1_reg2.read());
    assign r_ex1_reg2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:247:9
    // r_ex1_regwrite.write(s_id1_regwrite.read());
    assign r_ex1_regwrite_D = s_id1_regwrite_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:247:9
    // r_ex1_regwrite.write(s_id1_regwrite.read());
    assign r_ex1_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:248:9
    // r_ex1_rfwt_sel.write(s_id1_rfwt_sel.read());
    assign r_ex1_rfwt_sel_D = s_id1_rfwt_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:248:9
    // r_ex1_rfwt_sel.write(s_id1_rfwt_sel.read());
    assign r_ex1_rfwt_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:239:9
    // r_ex1_rs1.write(s_id1_rs1.read());
    assign r_ex1_rs1_D = s_id1_rs1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:239:9
    // r_ex1_rs1.write(s_id1_rs1.read());
    assign r_ex1_rs1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:240:9
    // r_ex1_rs2.write(s_id1_rs2.read());
    assign r_ex1_rs2_D = s_id1_rs2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:240:9
    // r_ex1_rs2.write(s_id1_rs2.read());
    assign r_ex1_rs2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:254:9
    // r_ex1_valid.write(r_id1_valid.read());
    assign r_ex1_valid_D = r_id1_valid_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:254:9
    // r_ex1_valid.write(r_id1_valid.read());
    assign r_ex1_valid_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:259:9
    // r_id1_instr_preserved.write(s_id1_instr.read());
    assign r_id1_instr_preserved_D = s_id1_instr_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:259:9
    // r_id1_instr_preserved.write(s_id1_instr.read());
    assign r_id1_instr_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:260:9
    // r_id1_order_preserved.write(s_id1_order.read());
    assign r_id1_order_preserved_D = s_id1_order_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:260:9
    // r_id1_order_preserved.write(s_id1_order.read());
    assign r_id1_order_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:261:9
    // r_id1_pc_preserved.write(s_id1_pc.read());
    assign r_id1_pc_preserved_D = s_id1_pc_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:261:9
    // r_id1_pc_preserved.write(s_id1_pc.read());
    assign r_id1_pc_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // id1_output_t
