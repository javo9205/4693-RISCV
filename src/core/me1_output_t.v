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
 *  \brief   Contains module definition of the 'me1_output_t' functional unit.
 */

module me1_output_t(
    input  wire ACT,
    input  wire [31:0] r_me1_alu_Q,
    input  wire r_me1_order_Q,
    input  wire [31:0] r_me1_pc_Q,
    input  wire [4:0] r_me1_rd_Q,
    input  wire r_me1_regwrite_Q,
    input  wire [1:0] r_me1_rfwt_sel_Q,
    input  wire r_me1_valid_Q,
    input  wire [31:0] s_me1_memdat_Q,
    output wire [31:0] r_wb1_alu_D,
    output wire r_wb1_alu_WE,
    output wire [31:0] r_wb1_memdat_D,
    output wire r_wb1_memdat_WE,
    output wire r_wb1_order_D,
    output wire r_wb1_order_WE,
    output wire [31:0] r_wb1_pc_D,
    output wire r_wb1_pc_WE,
    output wire [4:0] r_wb1_rd_D,
    output wire r_wb1_rd_WE,
    output wire r_wb1_regwrite_D,
    output wire r_wb1_regwrite_WE,
    output wire [1:0] r_wb1_rfwt_sel_D,
    output wire r_wb1_rfwt_sel_WE,
    output wire r_wb1_valid_D,
    output wire r_wb1_valid_WE
);
    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:189:9
    // r_wb1_alu.write(r_me1_alu.read());
    assign r_wb1_alu_D = r_me1_alu_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:189:9
    // r_wb1_alu.write(r_me1_alu.read());
    assign r_wb1_alu_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:191:9
    // r_wb1_memdat.write(s_me1_memdat.read());
    assign r_wb1_memdat_D = s_me1_memdat_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:191:9
    // r_wb1_memdat.write(s_me1_memdat.read());
    assign r_wb1_memdat_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:192:9
    // r_wb1_order.write(r_me1_order.read());
    assign r_wb1_order_D = r_me1_order_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:192:9
    // r_wb1_order.write(r_me1_order.read());
    assign r_wb1_order_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:185:9
    // r_wb1_pc.write(r_me1_pc.read());
    assign r_wb1_pc_D = r_me1_pc_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:185:9
    // r_wb1_pc.write(r_me1_pc.read());
    assign r_wb1_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:190:9
    // r_wb1_rd.write(r_me1_rd.read());
    assign r_wb1_rd_D = r_me1_rd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:190:9
    // r_wb1_rd.write(r_me1_rd.read());
    assign r_wb1_rd_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:187:9
    // r_wb1_regwrite.write(r_me1_regwrite.read());
    assign r_wb1_regwrite_D = r_me1_regwrite_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:187:9
    // r_wb1_regwrite.write(r_me1_regwrite.read());
    assign r_wb1_regwrite_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:188:9
    // r_wb1_rfwt_sel.write(r_me1_rfwt_sel.read());
    assign r_wb1_rfwt_sel_D = r_me1_rfwt_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:188:9
    // r_wb1_rfwt_sel.write(r_me1_rfwt_sel.read());
    assign r_wb1_rfwt_sel_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:193:9
    // r_wb1_valid.write(r_me1_valid.read());
    assign r_wb1_valid_D = r_me1_valid_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:193:9
    // r_wb1_valid.write(r_me1_valid.read());
    assign r_wb1_valid_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // me1_output_t
