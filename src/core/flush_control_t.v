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
 *  \brief   Contains module definition of the 'flush_control_t' functional unit.
 */

module flush_control_t(
    input  wire ACT,
    input  wire s_ex1_pcsrc_Q,
    input  wire s_ex1_stall_Q,
    input  wire s_ex2_older_Q,
    input  wire s_ex2_pcsrc_Q,
    input  wire s_ex2_stall_Q,
    input  wire s_ex_pcsrc_Q,
    input  wire s_id1_pcsrc_Q,
    input  wire s_id1_stall_Q,
    input  wire s_id2_older_Q,
    input  wire s_id2_pcsrc_Q,
    input  wire s_id2_stall_Q,
    input  wire s_id_clear_Q,
    input  wire s_if_jump_Q,
    input  wire s_me1_pcsrc_Q,
    input  wire s_me1_stall_Q,
    input  wire s_me2_older_Q,
    input  wire s_me2_pcsrc_Q,
    input  wire s_me2_stall_Q,
    input  wire s_me_pcsrc_Q,
    output wire r_id1_stall_D,
    output wire r_id1_stall_WE,
    output wire r_id2_stall_D,
    output wire r_id2_stall_WE,
    output wire r_id_clear_D,
    output wire r_id_clear_WE,
    output wire s_ex1_clear_D,
    output wire s_ex2_clear_D,
    output wire s_id_clear_D,
    output wire s_if_stall_D,
    output wire s_me1_clear_D,
    output wire s_me2_clear_D,
    output wire s_wb1_clear_D,
    output wire s_wb2_clear_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire ignore_B0;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:36:9
    // ignore.write((int32)(0x0));
    assign ignore_B0 = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:66:9
    // r_id1_stall.write(s_id1_stall.read());
    assign r_id1_stall_D = s_id1_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:66:9
    // r_id1_stall.write(s_id1_stall.read());
    assign r_id1_stall_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:67:9
    // r_id2_stall.write(s_id2_stall.read());
    assign r_id2_stall_D = s_id2_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:67:9
    // r_id2_stall.write(s_id2_stall.read());
    assign r_id2_stall_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:68:9
    // r_id_clear.write(s_id_clear.read());
    assign r_id_clear_D = s_id_clear_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:68:9
    // r_id_clear.write(s_id_clear.read());
    assign r_id_clear_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:55:9
    // s_ex1_clear.write(s_me_pcsrc.read() | s_ex_pcsrc.read() | s_id1_stall.read() | (((s_id2_older ...
    assign s_ex1_clear_D = (ACT == 1'b1) ? (((s_me_pcsrc_Q | s_ex_pcsrc_Q) | s_id1_stall_Q) | ((s_id2_older_Q) ? s_id2_pcsrc_Q : ignore_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:56:9
    // s_ex2_clear.write(s_me_pcsrc.read() | s_ex_pcsrc.read() | s_id2_stall.read() | (((s_id2_older ...
    assign s_ex2_clear_D = (ACT == 1'b1) ? (((s_me_pcsrc_Q | s_ex_pcsrc_Q) | s_id2_stall_Q) | ((s_id2_older_Q) ? ignore_B0 : s_id1_pcsrc_Q)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:53:9
    // s_id_clear.write(s_if_jump.read());
    assign s_id_clear_D = (ACT == 1'b1) ? s_if_jump_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:64:9
    // s_if_stall.write((int32)(0x0));
    assign s_if_stall_D = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:58:9
    // s_me1_clear.write(s_me_pcsrc.read() | s_ex1_stall.read() | (((s_ex2_older.read()) ? (s_ex2_pc ...
    assign s_me1_clear_D = (ACT == 1'b1) ? ((s_me_pcsrc_Q | s_ex1_stall_Q) | ((s_ex2_older_Q) ? s_ex2_pcsrc_Q : ignore_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:59:9
    // s_me2_clear.write(s_me_pcsrc.read() | s_ex2_stall.read() | (((s_ex2_older.read()) ? (ignore.r ...
    assign s_me2_clear_D = (ACT == 1'b1) ? ((s_me_pcsrc_Q | s_ex2_stall_Q) | ((s_ex2_older_Q) ? ignore_B0 : s_ex1_pcsrc_Q)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:61:9
    // s_wb1_clear.write(s_me1_stall.read() | (((s_me2_older.read()) ? (s_me2_pcsrc.read()) : (ignor ...
    assign s_wb1_clear_D = (ACT == 1'b1) ? (s_me1_stall_Q | ((s_me2_older_Q) ? s_me2_pcsrc_Q : ignore_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:62:9
    // s_wb2_clear.write(s_me2_stall.read() | (((s_me2_older.read()) ? (ignore.read()) : (s_me1_pcsr ...
    assign s_wb2_clear_D = (ACT == 1'b1) ? (s_me2_stall_Q | ((s_me2_older_Q) ? ignore_B0 : s_me1_pcsrc_Q)) : 1'b0;
endmodule // flush_control_t
