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
 *  \brief   Contains module definition of the 'wb2_stage_t' functional unit.
 */

module wb2_stage_t(
    input  wire ACT,
    input  wire [4:0] r_wb1_rd_Q,
    input  wire [31:0] r_wb2_alu_Q,
    input  wire [31:0] r_wb2_memdat_Q,
    input  wire [31:0] r_wb2_pc_Q,
    input  wire [4:0] r_wb2_rd_Q,
    input  wire [1:0] r_wb2_rfwt_sel_Q,
    input  wire [31:0] s_wb1_result_Q,
    input  wire s_wb1_wten_Q,
    input  wire [31:0] s_wb2_nextpc_Q,
    input  wire s_wb2_older_Q,
    input  wire [31:0] s_wb2_result_Q,
    input  wire s_wb2_wten_Q,
    output wire [31:0] rf_xpr_wrt1_D,
    output wire [4:0] rf_xpr_wrt1_WA,
    output wire rf_xpr_wrt1_WE,
    output wire [31:0] s_wb2_nextpc_D,
    output wire [31:0] s_wb2_result_D,
    output wire [31:0] s_wb_fwdA_D,
    output wire [31:0] s_wb_fwdB_D,
    output wire [4:0] s_wb_rdA_D,
    output wire [4:0] s_wb_rdB_D,
    output wire s_wb_wtenA_D,
    output wire s_wb_wtenB_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [1:0] codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire codasip_tmp_var_2;
    // signal/wire
    wire [31:0] s_wb2_result_D_ACT_wire;
    // signal/wire
    wire [31:0] s_wb_fwdA_D_ACT_wire;
    // signal/wire
    wire [31:0] s_wb_fwdB_D_ACT_wire;
    // signal/wire
    wire [4:0] s_wb_rdA_D_ACT_wire;
    // signal/wire
    wire [4:0] s_wb_rdB_D_ACT_wire;
    // signal/wire
    wire s_wb_wtenA_D_ACT_wire;
    // signal/wire
    wire s_wb_wtenB_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_wb2_result_D_ACT_wire_1;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:103:17
    // codasip_tmp_var_0.write(r_wb2_rfwt_sel.read());
    assign codasip_tmp_var_0 = r_wb2_rfwt_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:108:22
    always @(*) begin
        case ( codasip_tmp_var_0 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:105:28
            // s_wb2_result.write(r_wb2_alu.read());
            2'h0: tmp_codasip_conv_mux_s_wb2_result_D_ACT_wire_1 = r_wb2_alu_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:106:27
            // s_wb2_result.write(s_wb2_nextpc.read());
            2'h1: tmp_codasip_conv_mux_s_wb2_result_D_ACT_wire_1 = s_wb2_nextpc_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:107:28
            // s_wb2_result.write(r_wb2_memdat.read());
            2'h2: tmp_codasip_conv_mux_s_wb2_result_D_ACT_wire_1 = r_wb2_memdat_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:108:22
            // s_wb2_result.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_wb2_result_D_ACT_wire_1 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_wb2_result_D_ACT_wire_1 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_wb2_result_D_ACT_wire = tmp_codasip_conv_mux_s_wb2_result_D_ACT_wire_1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:113:13
    // codasip_tmp_var_1.write((uint1)(s_wb2_wten.read()));
    assign codasip_tmp_var_1 = s_wb2_wten_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:124:13
    // codasip_tmp_var_2.write((uint1)(s_wb2_older.read()));
    assign codasip_tmp_var_2 = s_wb2_older_Q;
    assign s_wb_fwdA_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:127:21
        // s_wb_fwdA.write(s_wb1_result.read());
        codasip_tmp_var_2 ? s_wb1_result_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:131:21
        // s_wb_fwdA.write(s_wb2_result.read());
        s_wb2_result_Q;
    assign s_wb_fwdB_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:127:54
        // s_wb_fwdB.write(s_wb2_result.read());
        codasip_tmp_var_2 ? s_wb2_result_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:131:54
        // s_wb_fwdB.write(s_wb1_result.read());
        s_wb1_result_Q;
    assign s_wb_rdA_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:128:21
        // s_wb_rdA.write(r_wb1_rd.read());
        codasip_tmp_var_2 ? r_wb1_rd_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:132:21
        // s_wb_rdA.write(r_wb2_rd.read());
        r_wb2_rd_Q;
    assign s_wb_rdB_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:128:49
        // s_wb_rdB.write(r_wb2_rd.read());
        codasip_tmp_var_2 ? r_wb2_rd_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:132:49
        // s_wb_rdB.write(r_wb1_rd.read());
        r_wb1_rd_Q;
    assign s_wb_wtenA_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:126:21
        // s_wb_wtenA.write(s_wb1_wten.read());
        codasip_tmp_var_2 ? s_wb1_wten_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:130:21
        // s_wb_wtenA.write(s_wb2_wten.read());
        s_wb2_wten_Q;
    assign s_wb_wtenB_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:126:53
        // s_wb_wtenB.write(s_wb2_wten.read());
        codasip_tmp_var_2 ? s_wb2_wten_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:130:53
        // s_wb_wtenB.write(s_wb1_wten.read());
        s_wb1_wten_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:115:13
    // rf_xpr.write(s_wb2_result.read(), r_wb2_rd.read(), (uint32)(1));
    assign rf_xpr_wrt1_D = s_wb2_result_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:115:13
    // rf_xpr.write(s_wb2_result.read(), r_wb2_rd.read(), (uint32)(1));
    assign rf_xpr_wrt1_WA = r_wb2_rd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:115:13
    // rf_xpr.write(s_wb2_result.read(), r_wb2_rd.read(), (uint32)(1));
    assign rf_xpr_wrt1_WE = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:101:9
    // s_wb2_nextpc.write(r_wb2_pc.read() + (uint32)(0x4));
    assign s_wb2_nextpc_D = (ACT == 1'b1) ? (r_wb2_pc_Q + 32'h00000004) : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:108:22
    assign s_wb2_result_D = (ACT == 1'b1) ? s_wb2_result_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:131:21
    assign s_wb_fwdA_D = (ACT == 1'b1) ? s_wb_fwdA_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:131:54
    assign s_wb_fwdB_D = (ACT == 1'b1) ? s_wb_fwdB_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:132:21
    assign s_wb_rdA_D = (ACT == 1'b1) ? s_wb_rdA_D_ACT_wire : 5'h00;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:132:49
    assign s_wb_rdB_D = (ACT == 1'b1) ? s_wb_rdB_D_ACT_wire : 5'h00;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:130:21
    assign s_wb_wtenA_D = (ACT == 1'b1) ? s_wb_wtenA_D_ACT_wire : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:130:53
    assign s_wb_wtenB_D = (ACT == 1'b1) ? s_wb_wtenB_D_ACT_wire : 1'b0;
endmodule // wb2_stage_t
