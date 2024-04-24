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
 *  \brief   Contains module definition of the 'me_coordination_t' functional unit.
 */

module me_coordination_t(
    input  wire ACT,
    input  wire [31:0] r_me1_alu_Q,
    input  wire [31:0] r_me1_bradd_Q,
    input  wire r_me1_order_Q,
    input  wire [4:0] r_me1_rd_Q,
    input  wire r_me1_regwrite_Q,
    input  wire r_me1_valid_Q,
    input  wire [31:0] r_me2_alu_Q,
    input  wire [31:0] r_me2_bradd_Q,
    input  wire r_me2_order_Q,
    input  wire [4:0] r_me2_rd_Q,
    input  wire r_me2_regwrite_Q,
    input  wire r_me2_valid_Q,
    input  wire s_me1_memhaz_Q,
    input  wire s_me1_pcsrc_Q,
    input  wire s_me2_memhaz_Q,
    input  wire s_me2_older_Q,
    input  wire s_me2_pcsrc_Q,
    input  wire s_wb1_stall_Q,
    input  wire s_wb2_stall_Q,
    output wire s_me1_stall_D,
    output wire s_me2_older_D,
    output wire s_me2_stall_D,
    output wire [31:0] s_me_bradd_D,
    output wire [31:0] s_me_fwdA_D,
    output wire [31:0] s_me_fwdB_D,
    output wire s_me_pcsrc_D,
    output wire [4:0] s_me_rdA_D,
    output wire [4:0] s_me_rdB_D,
    output wire s_me_wtenA_D,
    output wire s_me_wtenB_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire ignore_B0;
    // signal/wire
    wire me1_stall_B0;
    // signal/wire
    wire me2_stall_B0;
    // signal/wire
    wire s_me1_wten_B0;
    // signal/wire
    wire s_me2_wten_B0;
    // signal/wire
    wire [31:0] s_me_bradd_D_ACT_wire;
    // signal/wire
    wire [31:0] s_me_fwdA_D_ACT_wire;
    // signal/wire
    wire [31:0] s_me_fwdB_D_ACT_wire;
    // signal/wire
    wire s_me_pcsrc_D_ACT_wire;
    // signal/wire
    wire [4:0] s_me_rdA_D_ACT_wire;
    // signal/wire
    wire [4:0] s_me_rdB_D_ACT_wire;
    // signal/wire
    wire s_me_wtenA_D_ACT_wire;
    // signal/wire
    wire s_me_wtenB_D_ACT_wire;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:50:25
    // codasip_tmp_var_0.write((uint1)(s_me1_pcsrc.read() & s_me2_pcsrc.read()));
    assign codasip_tmp_var_0 = (s_me1_pcsrc_Q & s_me2_pcsrc_Q);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:64:9
    // s_me1_wten.write(r_me1_regwrite.read() & (r_me1_rd.read() != (uint5)(0)));
    assign s_me1_wten_B0 = (r_me1_regwrite_Q & (r_me1_rd_Q != 5'h00));
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:65:9
    // s_me2_wten.write(r_me2_regwrite.read() & (r_me2_rd.read() != (uint5)(0)));
    assign s_me2_wten_B0 = (r_me2_regwrite_Q & (r_me2_rd_Q != 5'h00));
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:70:13
    // codasip_tmp_var_1.write((uint1)(s_me2_older.read()));
    assign codasip_tmp_var_1 = s_me2_older_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:84:9
    // ignore.write((int32)(0x0));
    assign ignore_B0 = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:85:9
    // me1_stall.write(s_me1_memhaz.read() | s_wb1_stall.read());
    assign me1_stall_B0 = (s_me1_memhaz_Q | s_wb1_stall_Q);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:86:9
    // me2_stall.write(s_me2_memhaz.read() | s_wb2_stall.read());
    assign me2_stall_B0 = (s_me2_memhaz_Q | s_wb2_stall_Q);
    assign s_me_bradd_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:53:13
        // s_me_bradd.write(((s_me2_older.read()) ? (r_me2_bradd.read()) : (r_me1_bradd.read())));
        codasip_tmp_var_0 ? ((s_me2_older_Q) ? r_me2_bradd_Q : r_me1_bradd_Q) :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:58:13
        // s_me_bradd.write(((s_me1_pcsrc.read()) ? (r_me1_bradd.read()) : (r_me2_bradd.read())));
        ((s_me1_pcsrc_Q) ? r_me1_bradd_Q : r_me2_bradd_Q);
    assign s_me_fwdA_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:73:21
        // s_me_fwdA.write(r_me1_alu.read());
        codasip_tmp_var_1 ? r_me1_alu_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:77:21
        // s_me_fwdA.write(r_me2_alu.read());
        r_me2_alu_Q;
    assign s_me_fwdB_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:73:52
        // s_me_fwdB.write(r_me2_alu.read());
        codasip_tmp_var_1 ? r_me2_alu_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:77:52
        // s_me_fwdB.write(r_me1_alu.read());
        r_me1_alu_Q;
    assign s_me_pcsrc_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:52:13
        // s_me_pcsrc.write((bool)(1));
        codasip_tmp_var_0 ? 1'b1 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:57:13
        // s_me_pcsrc.write((s_me1_pcsrc.read() | s_me2_pcsrc.read()));
        (s_me1_pcsrc_Q | s_me2_pcsrc_Q);
    assign s_me_rdA_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:74:21
        // s_me_rdA.write(r_me1_rd.read());
        codasip_tmp_var_1 ? r_me1_rd_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:78:21
        // s_me_rdA.write(r_me2_rd.read());
        r_me2_rd_Q;
    assign s_me_rdB_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:74:50
        // s_me_rdB.write(r_me2_rd.read());
        codasip_tmp_var_1 ? r_me2_rd_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:78:50
        // s_me_rdB.write(r_me1_rd.read());
        r_me1_rd_Q;
    assign s_me_wtenA_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:72:21
        // s_me_wtenA.write(s_me1_wten.read());
        codasip_tmp_var_1 ? s_me1_wten_B0 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:76:21
        // s_me_wtenA.write(s_me2_wten.read());
        s_me2_wten_B0;
    assign s_me_wtenB_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:72:54
        // s_me_wtenB.write(s_me2_wten.read());
        codasip_tmp_var_1 ? s_me2_wten_B0 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:76:54
        // s_me_wtenB.write(s_me1_wten.read());
        s_me1_wten_B0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:87:9
    // s_me1_stall.write(me1_stall.read() | (((s_me2_older.read()) ? (me2_stall.read()) : (ignore.re ...
    assign s_me1_stall_D = (ACT == 1'b1) ? (me1_stall_B0 | ((s_me2_older_Q) ? me2_stall_B0 : ignore_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:45:9
    // s_me2_older.write((~r_me1_valid.read()) | (r_me2_valid.read() & (r_me1_order.read() ^ r_me2_o ...
    assign s_me2_older_D = (ACT == 1'b1) ? ((~r_me1_valid_Q) | (r_me2_valid_Q & (r_me1_order_Q ^ r_me2_order_Q))) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:88:9
    // s_me2_stall.write(me2_stall.read() || (((s_me2_older.read()) ? (ignore.read()) : (me1_stall.r ...
    assign s_me2_stall_D = (ACT == 1'b1) ? (me2_stall_B0 || ((s_me2_older_Q) ? ignore_B0 : me1_stall_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:58:13
    assign s_me_bradd_D = (ACT == 1'b1) ? s_me_bradd_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:77:21
    assign s_me_fwdA_D = (ACT == 1'b1) ? s_me_fwdA_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:77:52
    assign s_me_fwdB_D = (ACT == 1'b1) ? s_me_fwdB_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:57:13
    assign s_me_pcsrc_D = (ACT == 1'b1) ? s_me_pcsrc_D_ACT_wire : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:78:21
    assign s_me_rdA_D = (ACT == 1'b1) ? s_me_rdA_D_ACT_wire : 5'h00;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:78:50
    assign s_me_rdB_D = (ACT == 1'b1) ? s_me_rdB_D_ACT_wire : 5'h00;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:76:21
    assign s_me_wtenA_D = (ACT == 1'b1) ? s_me_wtenA_D_ACT_wire : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:76:54
    assign s_me_wtenB_D = (ACT == 1'b1) ? s_me_wtenB_D_ACT_wire : 1'b0;
endmodule // me_coordination_t
