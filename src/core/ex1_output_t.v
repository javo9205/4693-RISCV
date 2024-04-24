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
 *  \brief   Contains module definition of the 'ex1_output_t' functional unit.
 */

module ex1_output_t(
    input  wire ACT,
    input  wire [2:0] r_ex1_branchop_Q,
    input  wire [3:0] r_ex1_memop_Q,
    input  wire r_ex1_order_Q,
    input  wire [31:0] r_ex1_pc_Q,
    input  wire [4:0] r_ex1_rd_Q,
    input  wire r_ex1_regwrite_Q,
    input  wire [1:0] r_ex1_rfwt_sel_Q,
    input  wire r_ex1_valid_Q,
    input  wire [31:0] s_ex1_alu_Q,
    input  wire [31:0] s_ex1_bradd_Q,
    input  wire [31:0] s_ex1_encoded_Q,
    input  wire [31:0] s_ex1_reg1_Q,
    input  wire [31:0] s_ex1_reg2_Q,
    input  wire s_ex1_zero_Q,
    output wire [31:0] r_ex1_reg1_preserved_D,
    output wire r_ex1_reg1_preserved_WE,
    output wire [31:0] r_ex1_reg2_preserved_D,
    output wire r_ex1_reg2_preserved_WE,
    output wire [31:0] r_me1_alu_D,
    output wire r_me1_alu_WE,
    output wire [31:0] r_me1_bradd_D,
    output wire r_me1_bradd_WE,
    output wire [2:0] r_me1_branchop_D,
    output wire r_me1_branchop_WE,
    output wire [3:0] r_me1_memop_D,
    output wire r_me1_memop_WE,
    output wire r_me1_order_D,
    output wire r_me1_order_WE,
    output wire [31:0] r_me1_pc_D,
    output wire r_me1_pc_WE,
    output wire [4:0] r_me1_rd_D,
    output wire r_me1_rd_WE,
    output wire r_me1_regwrite_D,
    output wire r_me1_regwrite_WE,
    output wire [1:0] r_me1_rfwt_sel_D,
    output wire r_me1_rfwt_sel_WE,
    output wire r_me1_valid_D,
    output wire r_me1_valid_WE,
    output wire [31:0] r_me1_wtdat_D,
    output wire r_me1_wtdat_WE,
    output wire r_me1_zero_D,
    output wire r_me1_zero_WE
);
    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:325:9
    // r_ex1_reg1_preserved.write(s_ex1_reg1.read());
    assign r_ex1_reg1_preserved_D = s_ex1_reg1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:325:9
    // r_ex1_reg1_preserved.write(s_ex1_reg1.read());
    assign r_ex1_reg1_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:326:9
    // r_ex1_reg2_preserved.write(s_ex1_reg2.read());
    assign r_ex1_reg2_preserved_D = s_ex1_reg2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:326:9
    // r_ex1_reg2_preserved.write(s_ex1_reg2.read());
    assign r_ex1_reg2_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:317:9
    // r_me1_alu.write(s_ex1_alu.read());
    assign r_me1_alu_D = s_ex1_alu_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:317:9
    // r_me1_alu.write(s_ex1_alu.read());
    assign r_me1_alu_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:319:9
    // r_me1_bradd.write(s_ex1_bradd.read());
    assign r_me1_bradd_D = s_ex1_bradd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:319:9
    // r_me1_bradd.write(s_ex1_bradd.read());
    assign r_me1_bradd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:314:9
    // r_me1_branchop.write(r_ex1_branchop.read());
    assign r_me1_branchop_D = r_ex1_branchop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:314:9
    // r_me1_branchop.write(r_ex1_branchop.read());
    assign r_me1_branchop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:315:9
    // r_me1_memop.write(r_ex1_memop.read());
    assign r_me1_memop_D = r_ex1_memop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:315:9
    // r_me1_memop.write(r_ex1_memop.read());
    assign r_me1_memop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:322:9
    // r_me1_order.write(r_ex1_order.read());
    assign r_me1_order_D = r_ex1_order_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:322:9
    // r_me1_order.write(r_ex1_order.read());
    assign r_me1_order_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:310:9
    // r_me1_pc.write(r_ex1_pc.read());
    assign r_me1_pc_D = r_ex1_pc_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:310:9
    // r_me1_pc.write(r_ex1_pc.read());
    assign r_me1_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:316:9
    // r_me1_rd.write(r_ex1_rd.read());
    assign r_me1_rd_D = r_ex1_rd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:316:9
    // r_me1_rd.write(r_ex1_rd.read());
    assign r_me1_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:312:9
    // r_me1_regwrite.write(r_ex1_regwrite.read());
    assign r_me1_regwrite_D = r_ex1_regwrite_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:312:9
    // r_me1_regwrite.write(r_ex1_regwrite.read());
    assign r_me1_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:313:9
    // r_me1_rfwt_sel.write(r_ex1_rfwt_sel.read());
    assign r_me1_rfwt_sel_D = r_ex1_rfwt_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:313:9
    // r_me1_rfwt_sel.write(r_ex1_rfwt_sel.read());
    assign r_me1_rfwt_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:323:9
    // r_me1_valid.write(r_ex1_valid.read());
    assign r_me1_valid_D = r_ex1_valid_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:323:9
    // r_me1_valid.write(r_ex1_valid.read());
    assign r_me1_valid_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:320:9
    // r_me1_wtdat.write(s_ex1_encoded.read());
    assign r_me1_wtdat_D = s_ex1_encoded_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:320:9
    // r_me1_wtdat.write(s_ex1_encoded.read());
    assign r_me1_wtdat_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:318:9
    // r_me1_zero.write(s_ex1_zero.read());
    assign r_me1_zero_D = s_ex1_zero_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:318:9
    // r_me1_zero.write(s_ex1_zero.read());
    assign r_me1_zero_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // ex1_output_t
