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
 *  \brief   Contains module definition of the 'id2_output_t' functional unit.
 */

module id2_output_t(
    input  wire ACT,
    input  wire r_id2_valid_Q,
    input  wire [3:0] s_id2_aluop_Q,
    input  wire s_id2_alusrc1_Q,
    input  wire s_id2_alusrc2_Q,
    input  wire [2:0] s_id2_branchop_Q,
    input  wire s_id2_brnch_sel_Q,
    input  wire [31:0] s_id2_immed_Q,
    input  wire [31:0] s_id2_instr_Q,
    input  wire [3:0] s_id2_memop_Q,
    input  wire s_id2_order_Q,
    input  wire [31:0] s_id2_pc_Q,
    input  wire [4:0] s_id2_rd_Q,
    input  wire [31:0] s_id2_reg1_Q,
    input  wire [31:0] s_id2_reg2_Q,
    input  wire s_id2_regwrite_Q,
    input  wire [1:0] s_id2_rfwt_sel_Q,
    input  wire [4:0] s_id2_rs1_Q,
    input  wire [4:0] s_id2_rs2_Q,
    output wire [3:0] r_ex2_aluop_D,
    output wire r_ex2_aluop_WE,
    output wire [1:0] r_ex2_alusrc1_D,
    output wire r_ex2_alusrc1_WE,
    output wire r_ex2_alusrc2_D,
    output wire r_ex2_alusrc2_WE,
    output wire [2:0] r_ex2_branchop_D,
    output wire r_ex2_branchop_WE,
    output wire r_ex2_brnch_sel_D,
    output wire r_ex2_brnch_sel_WE,
    output wire [31:0] r_ex2_immed_D,
    output wire r_ex2_immed_WE,
    output wire [3:0] r_ex2_memop_D,
    output wire r_ex2_memop_WE,
    output wire r_ex2_order_D,
    output wire r_ex2_order_WE,
    output wire [31:0] r_ex2_pc_D,
    output wire r_ex2_pc_WE,
    output wire [4:0] r_ex2_rd_D,
    output wire r_ex2_rd_WE,
    output wire [31:0] r_ex2_reg1_D,
    output wire r_ex2_reg1_WE,
    output wire [31:0] r_ex2_reg2_D,
    output wire r_ex2_reg2_WE,
    output wire r_ex2_regwrite_D,
    output wire r_ex2_regwrite_WE,
    output wire [1:0] r_ex2_rfwt_sel_D,
    output wire r_ex2_rfwt_sel_WE,
    output wire [4:0] r_ex2_rs1_D,
    output wire r_ex2_rs1_WE,
    output wire [4:0] r_ex2_rs2_D,
    output wire r_ex2_rs2_WE,
    output wire r_ex2_valid_D,
    output wire r_ex2_valid_WE,
    output wire [31:0] r_id2_instr_preserved_D,
    output wire r_id2_instr_preserved_WE,
    output wire r_id2_order_preserved_D,
    output wire r_id2_order_preserved_WE,
    output wire [31:0] r_id2_pc_preserved_D,
    output wire r_id2_pc_preserved_WE
);
    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:412:9
    // r_ex2_aluop.write(s_id2_aluop.read());
    assign r_ex2_aluop_D = s_id2_aluop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:412:9
    // r_ex2_aluop.write(s_id2_aluop.read());
    assign r_ex2_aluop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:413:9
    // r_ex2_alusrc1.write(s_id2_alusrc1.read());
    assign r_ex2_alusrc1_D = {{1{1'b0}}, s_id2_alusrc1_Q};
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:413:9
    // r_ex2_alusrc1.write(s_id2_alusrc1.read());
    assign r_ex2_alusrc1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:414:9
    // r_ex2_alusrc2.write(s_id2_alusrc2.read());
    assign r_ex2_alusrc2_D = s_id2_alusrc2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:414:9
    // r_ex2_alusrc2.write(s_id2_alusrc2.read());
    assign r_ex2_alusrc2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:417:9
    // r_ex2_branchop.write(s_id2_branchop.read());
    assign r_ex2_branchop_D = s_id2_branchop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:417:9
    // r_ex2_branchop.write(s_id2_branchop.read());
    assign r_ex2_branchop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:418:9
    // r_ex2_brnch_sel.write(s_id2_brnch_sel.read());
    assign r_ex2_brnch_sel_D = s_id2_brnch_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:418:9
    // r_ex2_brnch_sel.write(s_id2_brnch_sel.read());
    assign r_ex2_brnch_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:411:9
    // r_ex2_immed.write(s_id2_immed.read());
    assign r_ex2_immed_D = s_id2_immed_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:411:9
    // r_ex2_immed.write(s_id2_immed.read());
    assign r_ex2_immed_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:419:9
    // r_ex2_memop.write(s_id2_memop.read());
    assign r_ex2_memop_D = s_id2_memop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:419:9
    // r_ex2_memop.write(s_id2_memop.read());
    assign r_ex2_memop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:421:9
    // r_ex2_order.write(s_id2_order.read());
    assign r_ex2_order_D = s_id2_order_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:421:9
    // r_ex2_order.write(s_id2_order.read());
    assign r_ex2_order_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:404:9
    // r_ex2_pc.write(s_id2_pc.read());
    assign r_ex2_pc_D = s_id2_pc_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:404:9
    // r_ex2_pc.write(s_id2_pc.read());
    assign r_ex2_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:406:9
    // r_ex2_rd.write(s_id2_rd.read());
    assign r_ex2_rd_D = s_id2_rd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:406:9
    // r_ex2_rd.write(s_id2_rd.read());
    assign r_ex2_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:409:9
    // r_ex2_reg1.write(s_id2_reg1.read());
    assign r_ex2_reg1_D = s_id2_reg1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:409:9
    // r_ex2_reg1.write(s_id2_reg1.read());
    assign r_ex2_reg1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:410:9
    // r_ex2_reg2.write(s_id2_reg2.read());
    assign r_ex2_reg2_D = s_id2_reg2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:410:9
    // r_ex2_reg2.write(s_id2_reg2.read());
    assign r_ex2_reg2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:415:9
    // r_ex2_regwrite.write(s_id2_regwrite.read());
    assign r_ex2_regwrite_D = s_id2_regwrite_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:415:9
    // r_ex2_regwrite.write(s_id2_regwrite.read());
    assign r_ex2_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:416:9
    // r_ex2_rfwt_sel.write(s_id2_rfwt_sel.read());
    assign r_ex2_rfwt_sel_D = s_id2_rfwt_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:416:9
    // r_ex2_rfwt_sel.write(s_id2_rfwt_sel.read());
    assign r_ex2_rfwt_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:407:9
    // r_ex2_rs1.write(s_id2_rs1.read());
    assign r_ex2_rs1_D = s_id2_rs1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:407:9
    // r_ex2_rs1.write(s_id2_rs1.read());
    assign r_ex2_rs1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:408:9
    // r_ex2_rs2.write(s_id2_rs2.read());
    assign r_ex2_rs2_D = s_id2_rs2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:408:9
    // r_ex2_rs2.write(s_id2_rs2.read());
    assign r_ex2_rs2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:422:9
    // r_ex2_valid.write(r_id2_valid.read());
    assign r_ex2_valid_D = r_id2_valid_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:422:9
    // r_ex2_valid.write(r_id2_valid.read());
    assign r_ex2_valid_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:427:9
    // r_id2_instr_preserved.write(s_id2_instr.read());
    assign r_id2_instr_preserved_D = s_id2_instr_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:427:9
    // r_id2_instr_preserved.write(s_id2_instr.read());
    assign r_id2_instr_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:428:9
    // r_id2_order_preserved.write(s_id2_order.read());
    assign r_id2_order_preserved_D = s_id2_order_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:428:9
    // r_id2_order_preserved.write(s_id2_order.read());
    assign r_id2_order_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:429:9
    // r_id2_pc_preserved.write(s_id2_pc.read());
    assign r_id2_pc_preserved_D = s_id2_pc_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:429:9
    // r_id2_pc_preserved.write(s_id2_pc.read());
    assign r_id2_pc_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // id2_output_t
