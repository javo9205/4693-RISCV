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
 *  \brief   Contains module definition of the 'me2_output_t' functional unit.
 */

module me2_output_t(
    input  wire ACT,
    input  wire [31:0] r_me2_alu_Q,
    input  wire r_me2_order_Q,
    input  wire [31:0] r_me2_pc_Q,
    input  wire [4:0] r_me2_rd_Q,
    input  wire r_me2_regwrite_Q,
    input  wire [1:0] r_me2_rfwt_sel_Q,
    input  wire r_me2_valid_Q,
    input  wire [31:0] s_me2_memdat_Q,
    output wire [31:0] r_wb2_alu_D,
    output wire r_wb2_alu_WE,
    output wire [31:0] r_wb2_memdat_D,
    output wire r_wb2_memdat_WE,
    output wire r_wb2_order_D,
    output wire r_wb2_order_WE,
    output wire [31:0] r_wb2_pc_D,
    output wire r_wb2_pc_WE,
    output wire [4:0] r_wb2_rd_D,
    output wire r_wb2_rd_WE,
    output wire r_wb2_regwrite_D,
    output wire r_wb2_regwrite_WE,
    output wire [1:0] r_wb2_rfwt_sel_D,
    output wire r_wb2_rfwt_sel_WE,
    output wire r_wb2_valid_D,
    output wire r_wb2_valid_WE
);
    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:292:9
    // r_wb2_alu.write(r_me2_alu.read());
    assign r_wb2_alu_D = r_me2_alu_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:292:9
    // r_wb2_alu.write(r_me2_alu.read());
    assign r_wb2_alu_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:294:9
    // r_wb2_memdat.write(s_me2_memdat.read());
    assign r_wb2_memdat_D = s_me2_memdat_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:294:9
    // r_wb2_memdat.write(s_me2_memdat.read());
    assign r_wb2_memdat_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:295:9
    // r_wb2_order.write(r_me2_order.read());
    assign r_wb2_order_D = r_me2_order_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:295:9
    // r_wb2_order.write(r_me2_order.read());
    assign r_wb2_order_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:288:9
    // r_wb2_pc.write(r_me2_pc.read());
    assign r_wb2_pc_D = r_me2_pc_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:288:9
    // r_wb2_pc.write(r_me2_pc.read());
    assign r_wb2_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:293:9
    // r_wb2_rd.write(r_me2_rd.read());
    assign r_wb2_rd_D = r_me2_rd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:293:9
    // r_wb2_rd.write(r_me2_rd.read());
    assign r_wb2_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:290:9
    // r_wb2_regwrite.write(r_me2_regwrite.read());
    assign r_wb2_regwrite_D = r_me2_regwrite_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:290:9
    // r_wb2_regwrite.write(r_me2_regwrite.read());
    assign r_wb2_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:291:9
    // r_wb2_rfwt_sel.write(r_me2_rfwt_sel.read());
    assign r_wb2_rfwt_sel_D = r_me2_rfwt_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:291:9
    // r_wb2_rfwt_sel.write(r_me2_rfwt_sel.read());
    assign r_wb2_rfwt_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:296:9
    // r_wb2_valid.write(r_me2_valid.read());
    assign r_wb2_valid_D = r_me2_valid_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:296:9
    // r_wb2_valid.write(r_me2_valid.read());
    assign r_wb2_valid_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // me2_output_t
