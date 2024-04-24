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
 *  \brief   Contains module definition of the 'ex2_output_t' functional unit.
 */

module ex2_output_t(
    input  wire ACT,
    input  wire [2:0] r_ex2_branchop_Q,
    input  wire [3:0] r_ex2_memop_Q,
    input  wire r_ex2_order_Q,
    input  wire [31:0] r_ex2_pc_Q,
    input  wire [4:0] r_ex2_rd_Q,
    input  wire r_ex2_regwrite_Q,
    input  wire [1:0] r_ex2_rfwt_sel_Q,
    input  wire r_ex2_valid_Q,
    input  wire [31:0] s_ex2_alu_Q,
    input  wire [31:0] s_ex2_bradd_Q,
    input  wire [31:0] s_ex2_encoded_Q,
    input  wire [31:0] s_ex2_reg1_Q,
    input  wire [31:0] s_ex2_reg2_Q,
    input  wire s_ex2_zero_Q,
    output wire [31:0] r_ex2_reg1_preserved_D,
    output wire r_ex2_reg1_preserved_WE,
    output wire [31:0] r_ex2_reg2_preserved_D,
    output wire r_ex2_reg2_preserved_WE,
    output wire [31:0] r_me2_alu_D,
    output wire r_me2_alu_WE,
    output wire [31:0] r_me2_bradd_D,
    output wire r_me2_bradd_WE,
    output wire [2:0] r_me2_branchop_D,
    output wire r_me2_branchop_WE,
    output wire [3:0] r_me2_memop_D,
    output wire r_me2_memop_WE,
    output wire r_me2_order_D,
    output wire r_me2_order_WE,
    output wire [31:0] r_me2_pc_D,
    output wire r_me2_pc_WE,
    output wire [4:0] r_me2_rd_D,
    output wire r_me2_rd_WE,
    output wire r_me2_regwrite_D,
    output wire r_me2_regwrite_WE,
    output wire [1:0] r_me2_rfwt_sel_D,
    output wire r_me2_rfwt_sel_WE,
    output wire r_me2_valid_D,
    output wire r_me2_valid_WE,
    output wire [31:0] r_me2_wtdat_D,
    output wire r_me2_wtdat_WE,
    output wire r_me2_zero_D,
    output wire r_me2_zero_WE
);
    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:541:9
    // r_ex2_reg1_preserved.write(s_ex2_reg1.read());
    assign r_ex2_reg1_preserved_D = s_ex2_reg1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:541:9
    // r_ex2_reg1_preserved.write(s_ex2_reg1.read());
    assign r_ex2_reg1_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:542:9
    // r_ex2_reg2_preserved.write(s_ex2_reg2.read());
    assign r_ex2_reg2_preserved_D = s_ex2_reg2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:542:9
    // r_ex2_reg2_preserved.write(s_ex2_reg2.read());
    assign r_ex2_reg2_preserved_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:533:9
    // r_me2_alu.write(s_ex2_alu.read());
    assign r_me2_alu_D = s_ex2_alu_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:533:9
    // r_me2_alu.write(s_ex2_alu.read());
    assign r_me2_alu_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:535:9
    // r_me2_bradd.write(s_ex2_bradd.read());
    assign r_me2_bradd_D = s_ex2_bradd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:535:9
    // r_me2_bradd.write(s_ex2_bradd.read());
    assign r_me2_bradd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:530:9
    // r_me2_branchop.write(r_ex2_branchop.read());
    assign r_me2_branchop_D = r_ex2_branchop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:530:9
    // r_me2_branchop.write(r_ex2_branchop.read());
    assign r_me2_branchop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:531:9
    // r_me2_memop.write(r_ex2_memop.read());
    assign r_me2_memop_D = r_ex2_memop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:531:9
    // r_me2_memop.write(r_ex2_memop.read());
    assign r_me2_memop_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:538:9
    // r_me2_order.write(r_ex2_order.read());
    assign r_me2_order_D = r_ex2_order_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:538:9
    // r_me2_order.write(r_ex2_order.read());
    assign r_me2_order_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:526:9
    // r_me2_pc.write(r_ex2_pc.read());
    assign r_me2_pc_D = r_ex2_pc_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:526:9
    // r_me2_pc.write(r_ex2_pc.read());
    assign r_me2_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:532:9
    // r_me2_rd.write(r_ex2_rd.read());
    assign r_me2_rd_D = r_ex2_rd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:532:9
    // r_me2_rd.write(r_ex2_rd.read());
    assign r_me2_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:528:9
    // r_me2_regwrite.write(r_ex2_regwrite.read());
    assign r_me2_regwrite_D = r_ex2_regwrite_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:528:9
    // r_me2_regwrite.write(r_ex2_regwrite.read());
    assign r_me2_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:529:9
    // r_me2_rfwt_sel.write(r_ex2_rfwt_sel.read());
    assign r_me2_rfwt_sel_D = r_ex2_rfwt_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:529:9
    // r_me2_rfwt_sel.write(r_ex2_rfwt_sel.read());
    assign r_me2_rfwt_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:539:9
    // r_me2_valid.write(r_ex2_valid.read());
    assign r_me2_valid_D = r_ex2_valid_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:539:9
    // r_me2_valid.write(r_ex2_valid.read());
    assign r_me2_valid_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:536:9
    // r_me2_wtdat.write(s_ex2_encoded.read());
    assign r_me2_wtdat_D = s_ex2_encoded_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:536:9
    // r_me2_wtdat.write(s_ex2_encoded.read());
    assign r_me2_wtdat_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:534:9
    // r_me2_zero.write(s_ex2_zero.read());
    assign r_me2_zero_D = s_ex2_zero_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:534:9
    // r_me2_zero.write(s_ex2_zero.read());
    assign r_me2_zero_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // ex2_output_t
