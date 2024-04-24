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
 *  \brief   Contains module definition of the 'if_output_t' functional unit.
 */

module if_output_t(
    input  wire ACT,
    input  wire r_order1_Q,
    input  wire r_order2_Q,
    input  wire s_id1_stall_Q,
    input  wire s_id2_stall_Q,
    input  wire s_if_jump_Q,
    input  wire [31:0] s_if_pc1_Q,
    input  wire [31:0] s_if_pc2_Q,
    input  wire [31:0] s_if_pcin_Q,
    output wire r_id1_order_D,
    output wire r_id1_order_WE,
    output wire [31:0] r_id1_pc_D,
    output wire r_id1_pc_WE,
    output wire r_id1_valid_D,
    output wire r_id1_valid_WE,
    output wire r_id2_order_D,
    output wire r_id2_order_WE,
    output wire [31:0] r_id2_pc_D,
    output wire r_id2_pc_WE,
    output wire r_id2_valid_D,
    output wire r_id2_valid_WE,
    output wire r_order1_D,
    output wire r_order1_WE,
    output wire r_order2_D,
    output wire r_order2_WE,
    output wire [31:0] r_pc_D,
    output wire r_pc_WE
);
    // type, wire and constant declarations:
    // signal/wire
    wire restart_B0;
    // signal/wire
    wire valid_B0;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:88:9
    // restart.write((int32)(0x0));
    assign restart_B0 = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:89:9
    // valid.write((int32)(0x1));
    assign valid_B0 = 1'b1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:100:9
    // r_id1_order.write(r_order1.read());
    assign r_id1_order_D = r_order1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:100:9
    // r_id1_order.write(r_order1.read());
    assign r_id1_order_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:95:9
    // r_id1_pc.write(s_if_pc1.read());
    assign r_id1_pc_D = s_if_pc1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:95:9
    // r_id1_pc.write(s_if_pc1.read());
    assign r_id1_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:98:9
    // r_id1_valid.write(valid.read());
    assign r_id1_valid_D = valid_B0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:98:9
    // r_id1_valid.write(valid.read());
    assign r_id1_valid_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:101:9
    // r_id2_order.write(r_order2.read());
    assign r_id2_order_D = r_order2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:101:9
    // r_id2_order.write(r_order2.read());
    assign r_id2_order_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:96:9
    // r_id2_pc.write(s_if_pc2.read());
    assign r_id2_pc_D = s_if_pc2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:96:9
    // r_id2_pc.write(s_if_pc2.read());
    assign r_id2_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:99:9
    // r_id2_valid.write(valid.read());
    assign r_id2_valid_D = valid_B0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:99:9
    // r_id2_valid.write(valid.read());
    assign r_id2_valid_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:102:9
    // r_order1.write(((s_if_jump.read()) ? (restart.read()) : ((((s_id1_stall.read()) ? (r_order1.r ...
    assign r_order1_D = ((s_if_jump_Q) ? restart_B0 : ((s_id1_stall_Q) ? r_order1_Q : (~r_order1_Q)));
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:102:9
    // r_order1.write(((s_if_jump.read()) ? (restart.read()) : ((((s_id1_stall.read()) ? (r_order1.r ...
    assign r_order1_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:103:9
    // r_order2.write(((s_if_jump.read()) ? (restart.read()) : ((((s_id2_stall.read()) ? (r_order2.r ...
    assign r_order2_D = ((s_if_jump_Q) ? restart_B0 : ((s_id2_stall_Q) ? r_order2_Q : (~r_order2_Q)));
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:103:9
    // r_order2.write(((s_if_jump.read()) ? (restart.read()) : ((((s_id2_stall.read()) ? (r_order2.r ...
    assign r_order2_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:94:9
    // r_pc.write(s_if_pcin.read());
    assign r_pc_D = (ACT == 1'b1) ? s_if_pcin_Q : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:94:9
    // r_pc.write(s_if_pcin.read());
    assign r_pc_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
endmodule // if_output_t
