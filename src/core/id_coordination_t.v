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
 *  \brief   Contains module definition of the 'id_coordination_t' functional unit.
 */

module id_coordination_t(
    input  wire ACT,
    input  wire [3:0] r_ex1_memop_Q,
    input  wire [4:0] r_ex1_rd_Q,
    input  wire [3:0] r_ex2_memop_Q,
    input  wire [4:0] r_ex2_rd_Q,
    input  wire [3:0] r_me1_memop_Q,
    input  wire [4:0] r_me1_rd_Q,
    input  wire [3:0] r_me2_memop_Q,
    input  wire [4:0] r_me2_rd_Q,
    input  wire s_ex1_stall_Q,
    input  wire s_ex2_stall_Q,
    input  wire [31:0] s_id1_bradd_Q,
    input  wire s_id1_datahaz_Q,
    input  wire s_id1_order_Q,
    input  wire s_id1_pcsrc_Q,
    input  wire [4:0] s_id1_rd_Q,
    input  wire s_id1_regwrite_Q,
    input  wire [4:0] s_id1_rs1_Q,
    input  wire [4:0] s_id1_rs2_Q,
    input  wire [31:0] s_id2_bradd_Q,
    input  wire s_id2_datahaz_Q,
    input  wire s_id2_older_Q,
    input  wire s_id2_order_Q,
    input  wire s_id2_pcsrc_Q,
    input  wire [4:0] s_id2_rd_Q,
    input  wire s_id2_regwrite_Q,
    input  wire [4:0] s_id2_rs1_Q,
    input  wire [4:0] s_id2_rs2_Q,
    input  wire s_me1_memhaz_Q,
    input  wire s_me2_memhaz_Q,
    output wire s_id1_datahaz_D,
    output wire s_id1_stall_D,
    output wire s_id2_datahaz_D,
    output wire s_id2_older_D,
    output wire s_id2_stall_D,
    output wire [31:0] s_id_bradd_D,
    output wire s_id_fetch_order_D,
    output wire s_id_pcsrc_D,
    output wire s_id_stallA_D,
    output wire s_id_stallB_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire codasip_tmp_var_0;
    // signal/wire
    wire id1_stall_B0;
    // signal/wire
    wire id2_stall_B0;
    // signal/wire
    wire ignore_B0;
    // signal/wire
    wire [31:0] s_id_bradd_D_ACT_wire;
    // signal/wire
    wire s_id_pcsrc_D_ACT_wire;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:48:25
    // codasip_tmp_var_0.write((uint1)(s_id1_pcsrc.read() & s_id2_pcsrc.read()));
    assign codasip_tmp_var_0 = (s_id1_pcsrc_Q & s_id2_pcsrc_Q);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:79:9
    // ignore.write((int32)(0x0));
    assign ignore_B0 = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:80:9
    // id1_stall.write(s_id1_datahaz.read() | s_ex1_stall.read());
    assign id1_stall_B0 = (s_id1_datahaz_Q | s_ex1_stall_Q);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:81:9
    // id2_stall.write(s_id2_datahaz.read() | s_ex2_stall.read());
    assign id2_stall_B0 = (s_id2_datahaz_Q | s_ex2_stall_Q);
    assign s_id_bradd_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:51:13
        // s_id_bradd.write(((s_id2_older.read()) ? (s_id2_bradd.read()) : (s_id1_bradd.read())));
        codasip_tmp_var_0 ? ((s_id2_older_Q) ? s_id2_bradd_Q : s_id1_bradd_Q) :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:56:13
        // s_id_bradd.write(((s_id1_pcsrc.read()) ? (s_id1_bradd.read()) : (s_id2_bradd.read())));
        ((s_id1_pcsrc_Q) ? s_id1_bradd_Q : s_id2_bradd_Q);
    assign s_id_pcsrc_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:50:13
        // s_id_pcsrc.write((bool)(1));
        codasip_tmp_var_0 ? 1'b1 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:55:13
        // s_id_pcsrc.write((s_id1_pcsrc.read() | s_id2_pcsrc.read()));
        (s_id1_pcsrc_Q | s_id2_pcsrc_Q);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:62:9
    // s_id1_datahaz.write((((r_ex1_memop.read() & (uint4)(0x8)) != (uint4)(0)) && ((s_id1_rs1.read( ...
    assign s_id1_datahaz_D = (ACT == 1'b1) ? ((((((((r_ex1_memop_Q & 4'h8) != 4'h0) && ((s_id1_rs1_Q == r_ex1_rd_Q) || (s_id1_rs2_Q == r_ex1_rd_Q))) && (r_ex1_rd_Q != 5'h00)) || ((((r_ex2_memop_Q & 4'h8) != 4'h0) && ((s_id1_rs1_Q == r_ex2_rd_Q) || (s_id1_rs2_Q == r_ex2_rd_Q))) && (r_ex2_rd_Q != 5'h00))) || (((((r_me1_memop_Q & 4'h8) != 4'h0) && ((s_id1_rs1_Q == r_me1_rd_Q) || (s_id1_rs2_Q == r_me1_rd_Q))) && (r_me1_rd_Q != 5'h00)) && s_me1_memhaz_Q)) || (((((r_me2_memop_Q & 4'h8) != 4'h0) && ((s_id1_rs1_Q == r_me2_rd_Q) || (s_id1_rs2_Q == r_me2_rd_Q))) && (r_me2_rd_Q != 5'h00)) && s_me2_memhaz_Q)) || ((((s_id2_regwrite_Q == 1'b1) && ((s_id1_rs1_Q == s_id2_rd_Q) || (s_id1_rs2_Q == s_id2_rd_Q))) && (s_id2_rd_Q != 5'h00)) && s_id2_older_Q)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:82:9
    // s_id1_stall.write(id1_stall.read() | (((s_id2_older.read()) ? (id2_stall.read()) : (ignore.re ...
    assign s_id1_stall_D = (ACT == 1'b1) ? (id1_stall_B0 | ((s_id2_older_Q) ? id2_stall_B0 : ignore_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:67:9
    // s_id2_datahaz.write((((r_ex1_memop.read() & (uint4)(0x8)) != (uint4)(0)) && ((s_id2_rs1.read( ...
    assign s_id2_datahaz_D = (ACT == 1'b1) ? ((((((((r_ex1_memop_Q & 4'h8) != 4'h0) && ((s_id2_rs1_Q == r_ex1_rd_Q) || (s_id2_rs2_Q == r_ex1_rd_Q))) && (r_ex1_rd_Q != 5'h00)) || ((((r_ex2_memop_Q & 4'h8) != 4'h0) && ((s_id2_rs1_Q == r_ex2_rd_Q) || (s_id2_rs2_Q == r_ex2_rd_Q))) && (r_ex2_rd_Q != 5'h00))) || (((((r_me1_memop_Q & 4'h8) != 4'h0) && ((s_id2_rs1_Q == r_me1_rd_Q) || (s_id2_rs2_Q == r_me1_rd_Q))) && (r_me1_rd_Q != 5'h00)) && s_me1_memhaz_Q)) || (((((r_me2_memop_Q & 4'h8) != 4'h0) && ((s_id2_rs1_Q == r_me2_rd_Q) || (s_id2_rs2_Q == r_me2_rd_Q))) && (r_me2_rd_Q != 5'h00)) && s_me2_memhaz_Q)) || ((((s_id1_regwrite_Q == 1'b1) && ((s_id2_rs1_Q == s_id1_rd_Q) || (s_id2_rs2_Q == s_id1_rd_Q))) && (s_id1_rd_Q != 5'h00)) && (~s_id2_older_Q))) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:43:9
    // s_id2_older.write(s_id1_order.read() ^ s_id2_order.read());
    assign s_id2_older_D = (ACT == 1'b1) ? (s_id1_order_Q ^ s_id2_order_Q) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:83:9
    // s_id2_stall.write(id2_stall.read() | (((s_id2_older.read()) ? (ignore.read()) : (id1_stall.re ...
    assign s_id2_stall_D = (ACT == 1'b1) ? (id2_stall_B0 | ((s_id2_older_Q) ? ignore_B0 : id1_stall_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:56:13
    assign s_id_bradd_D = (ACT == 1'b1) ? s_id_bradd_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:92:9
    // s_id_fetch_order.write((id1_stall.read() & ~id2_stall.read()) | (id1_stall.read() & s_id2_old ...
    assign s_id_fetch_order_D = (ACT == 1'b1) ? (((id1_stall_B0 & (~id2_stall_B0)) | (id1_stall_B0 & s_id2_older_Q)) | ((~id2_stall_B0) & s_id2_older_Q)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:55:13
    assign s_id_pcsrc_D = (ACT == 1'b1) ? s_id_pcsrc_D_ACT_wire : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:89:9
    // s_id_stallA.write(((s_id2_older.read()) ? (id2_stall.read()) : (id1_stall.read())));
    assign s_id_stallA_D = (ACT == 1'b1) ? ((s_id2_older_Q) ? id2_stall_B0 : id1_stall_B0) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:90:9
    // s_id_stallB.write(((s_id2_older.read()) ? (id1_stall.read()) : (id2_stall.read())));
    assign s_id_stallB_D = (ACT == 1'b1) ? ((s_id2_older_Q) ? id1_stall_B0 : id2_stall_B0) : 1'b0;
endmodule // id_coordination_t
