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
 *  \date    2024-03-30
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains module definition of the 'riscv_core_pipeline_control_t' functional unit.
 */

module riscv_core_pipeline_control_t(
    input  wire ACT,
    input  wire s_ex_clear_Q,
    input  wire s_ex_stall_Q,
    input  wire s_id_clear_Q,
    input  wire s_id_stall_Q,
    input  wire s_if_stall_Q,
    input  wire s_me_clear_Q,
    input  wire s_me_stall_Q,
    input  wire s_wb_clear_Q,
    input  wire s_wb_stall_Q,
    output wire pipe_EX_CLEAR_D,
    output wire pipe_EX_STALL_D,
    output wire pipe_ID_CLEAR_D,
    output wire pipe_ID_STALL_D,
    output wire pipe_IF_STALL_D,
    output wire pipe_ME_CLEAR_D,
    output wire pipe_ME_STALL_D,
    output wire pipe_WB_CLEAR_D,
    output wire pipe_WB_STALL_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
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

    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:39:13
    // codasip_tmp_var_0.write((uint1)(s_if_stall.read()));
    assign codasip_tmp_var_0 = s_if_stall_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:48:13
    // codasip_tmp_var_1.write((uint1)(s_id_stall.read()));
    assign codasip_tmp_var_1 = s_id_stall_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:53:18
    // codasip_tmp_var_2.write((uint1)(s_id_clear.read()));
    assign codasip_tmp_var_2 = (!codasip_tmp_var_1) ? s_id_clear_Q : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:62:13
    // codasip_tmp_var_3.write((uint1)(s_ex_stall.read()));
    assign codasip_tmp_var_3 = s_ex_stall_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:67:18
    // codasip_tmp_var_4.write((uint1)(s_ex_clear.read()));
    assign codasip_tmp_var_4 = (!codasip_tmp_var_3) ? s_ex_clear_Q : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:76:13
    // codasip_tmp_var_5.write((uint1)(s_me_stall.read()));
    assign codasip_tmp_var_5 = s_me_stall_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:81:18
    // codasip_tmp_var_6.write((uint1)(s_me_clear.read()));
    assign codasip_tmp_var_6 = (!codasip_tmp_var_5) ? s_me_clear_Q : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:90:13
    // codasip_tmp_var_7.write((uint1)(s_wb_stall.read()));
    assign codasip_tmp_var_7 = s_wb_stall_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:95:18
    // codasip_tmp_var_8.write((uint1)(s_wb_clear.read()));
    assign codasip_tmp_var_8 = (!codasip_tmp_var_7) ? s_wb_clear_Q : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:69:13
    // pipe.EX.clear();
    assign pipe_EX_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_4) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:64:13
    // pipe.EX.stall();
    assign pipe_EX_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_3) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:55:13
    // pipe.ID.clear();
    assign pipe_ID_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_2) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:50:13
    // pipe.ID.stall();
    assign pipe_ID_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:41:13
    // pipe.IF.stall();
    assign pipe_IF_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_0) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:83:13
    // pipe.ME.clear();
    assign pipe_ME_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_6) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:78:13
    // pipe.ME.stall();
    assign pipe_ME_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_5) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:97:13
    // pipe.WB.clear();
    assign pipe_WB_CLEAR_D = ((ACT == 1'b1) && codasip_tmp_var_8) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe_control.codal:92:13
    // pipe.WB.stall();
    assign pipe_WB_STALL_D = ((ACT == 1'b1) && codasip_tmp_var_7) ? 1'b1 : 1'b0;
endmodule // riscv_core_pipeline_control_t
