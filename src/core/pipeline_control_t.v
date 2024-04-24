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
 *  \brief   Contains module definition of the 'pipeline_control_t' functional unit.
 */

module pipeline_control_t(
    input  wire ACT,
    input  wire s_ex1_clear_Q,
    input  wire s_ex1_stall_Q,
    input  wire s_ex2_clear_Q,
    input  wire s_ex2_stall_Q,
    input  wire s_id1_stall_Q,
    input  wire s_id2_stall_Q,
    input  wire s_id_clear_Q,
    input  wire s_if_stall_Q,
    input  wire s_me1_clear_Q,
    input  wire s_me1_stall_Q,
    input  wire s_me2_clear_Q,
    input  wire s_me2_stall_Q,
    input  wire s_wb1_clear_Q,
    input  wire s_wb1_stall_Q,
    input  wire s_wb2_clear_Q,
    input  wire s_wb2_stall_Q,
    output wire pipe_EX1_CLEAR_D,
    output wire pipe_EX1_STALL_D,
    output wire pipe_EX2_CLEAR_D,
    output wire pipe_EX2_STALL_D,
    output wire pipe_ID1_CLEAR_D,
    output wire pipe_ID1_STALL_D,
    output wire pipe_ID2_CLEAR_D,
    output wire pipe_ID2_STALL_D,
    output wire pipe_IF_STALL_D,
    output wire pipe_ME1_CLEAR_D,
    output wire pipe_ME1_STALL_D,
    output wire pipe_ME2_CLEAR_D,
    output wire pipe_ME2_STALL_D,
    output wire pipe_WB1_CLEAR_D,
    output wire pipe_WB1_STALL_D,
    output wire pipe_WB2_CLEAR_D,
    output wire pipe_WB2_STALL_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire codasip_tmp_var_10;
    // signal/wire
    wire codasip_tmp_var_11;
    // signal/wire
    wire codasip_tmp_var_12;
    // signal/wire
    wire codasip_tmp_var_13;
    // signal/wire
    wire codasip_tmp_var_14;
    // signal/wire
    wire codasip_tmp_var_15;
    // signal/wire
    wire codasip_tmp_var_16;
    // signal/wire
    wire codasip_tmp_var_2;
    // signal/wire
    wire codasip_tmp_var_3;
    // signal/wire
    wire codasip_tmp_var_4;
    // signal/wire
    wire codasip_tmp_var_5;
    // signal/wire
    wire codasip_tmp_var_6;
    // signal/wire
    wire codasip_tmp_var_7;
    // signal/wire
    wire codasip_tmp_var_8;
    // signal/wire
    wire codasip_tmp_var_9;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:85:13
    // codasip_tmp_var_0.write((uint1)(s_if_stall.read()));
    assign codasip_tmp_var_0 = s_if_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:90:13
    // codasip_tmp_var_1.write((uint1)(s_id1_stall.read()));
    assign codasip_tmp_var_1 = s_id1_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:91:18
    // codasip_tmp_var_2.write((uint1)(s_id_clear.read()));
    assign codasip_tmp_var_2 = (!codasip_tmp_var_1) ? s_id_clear_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:92:13
    // codasip_tmp_var_3.write((uint1)(s_id2_stall.read()));
    assign codasip_tmp_var_3 = s_id2_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:93:18
    // codasip_tmp_var_4.write((uint1)(s_id_clear.read()));
    assign codasip_tmp_var_4 = (!codasip_tmp_var_3) ? s_id_clear_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:98:13
    // codasip_tmp_var_5.write((uint1)(s_ex1_stall.read()));
    assign codasip_tmp_var_5 = s_ex1_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:99:18
    // codasip_tmp_var_6.write((uint1)(s_ex1_clear.read()));
    assign codasip_tmp_var_6 = (!codasip_tmp_var_5) ? s_ex1_clear_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:100:13
    // codasip_tmp_var_7.write((uint1)(s_ex2_stall.read()));
    assign codasip_tmp_var_7 = s_ex2_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:101:18
    // codasip_tmp_var_8.write((uint1)(s_ex2_clear.read()));
    assign codasip_tmp_var_8 = (!codasip_tmp_var_7) ? s_ex2_clear_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:106:13
    // codasip_tmp_var_9.write((uint1)(s_me1_stall.read()));
    assign codasip_tmp_var_9 = s_me1_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:107:18
    // codasip_tmp_var_10.write((uint1)(s_me1_clear.read()));
    assign codasip_tmp_var_10 = (!codasip_tmp_var_9) ? s_me1_clear_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:108:13
    // codasip_tmp_var_11.write((uint1)(s_me2_stall.read()));
    assign codasip_tmp_var_11 = s_me2_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:109:18
    // codasip_tmp_var_12.write((uint1)(s_me2_clear.read()));
    assign codasip_tmp_var_12 = (!codasip_tmp_var_11) ? s_me2_clear_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:114:13
    // codasip_tmp_var_13.write((uint1)(s_wb1_stall.read()));
    assign codasip_tmp_var_13 = s_wb1_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:115:18
    // codasip_tmp_var_14.write((uint1)(s_wb1_clear.read()));
    assign codasip_tmp_var_14 = (!codasip_tmp_var_13) ? s_wb1_clear_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:116:13
    // codasip_tmp_var_15.write((uint1)(s_wb2_stall.read()));
    assign codasip_tmp_var_15 = s_wb2_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:117:18
    // codasip_tmp_var_16.write((uint1)(s_wb2_clear.read()));
    assign codasip_tmp_var_16 = (!codasip_tmp_var_15) ? s_wb2_clear_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:99:33
    // pipe.EX1.clear();
    assign pipe_EX1_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_6) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:98:28
    // pipe.EX1.stall();
    assign pipe_EX1_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_5) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:101:33
    // pipe.EX2.clear();
    assign pipe_EX2_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_8) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:100:28
    // pipe.EX2.stall();
    assign pipe_EX2_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_7) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:91:33
    // pipe.ID1.clear();
    assign pipe_ID1_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_2) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:90:28
    // pipe.ID1.stall();
    assign pipe_ID1_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:93:33
    // pipe.ID2.clear();
    assign pipe_ID2_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_4) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:92:28
    // pipe.ID2.stall();
    assign pipe_ID2_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_3) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:85:27
    // pipe.IF.stall();
    assign pipe_IF_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_0) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:107:33
    // pipe.ME1.clear();
    assign pipe_ME1_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_10) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:106:28
    // pipe.ME1.stall();
    assign pipe_ME1_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_9) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:109:33
    // pipe.ME2.clear();
    assign pipe_ME2_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_12) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:108:28
    // pipe.ME2.stall();
    assign pipe_ME2_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_11) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:115:33
    // pipe.WB1.clear();
    assign pipe_WB1_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_14) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:114:28
    // pipe.WB1.stall();
    assign pipe_WB1_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_13) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:117:33
    // pipe.WB2.clear();
    assign pipe_WB2_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_16) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe_control.codal:116:28
    // pipe.WB2.stall();
    assign pipe_WB2_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_15) ? 1'b1 : 1'b0;
endmodule // pipeline_control_t
