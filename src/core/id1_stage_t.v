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
 *  \brief   Contains module definition of the 'id1_stage_t' functional unit.
 */

module id1_stage_t(
    input  wire ACT,
    input  wire [31:0] if1_ahb_HRDATA,
    input  wire if1_ahb_HREADY,
    input  wire if1_ahb_HRESP,
    input  wire [31:0] r_id1_instr_preserved_Q,
    input  wire r_id1_order_preserved_Q,
    input  wire r_id1_order_Q,
    input  wire [31:0] r_id1_pc_preserved_Q,
    input  wire [31:0] r_id1_pc_Q,
    input  wire r_id1_stall_Q,
    input  wire r_id_clear_Q,
    input  wire [31:0] rf_xpr_read0_Q,
    input  wire [31:0] rf_xpr_read1_Q,
    input  wire [2:0] s_id1_branchop_Q,
    input  wire [31:0] s_id1_immed_Q,
    input  wire [11:0] s_id1_immedb_Q,
    input  wire [11:0] s_id1_immedi_Q,
    input  wire [19:0] s_id1_immedj_Q,
    input  wire [11:0] s_id1_immeds_Q,
    input  wire [19:0] s_id1_immedu_Q,
    input  wire [2:0] s_id1_immsel_Q,
    input  wire [31:0] s_id1_instr_Q,
    input  wire [16:0] s_id1_opc_Q,
    input  wire [31:0] s_id1_pc_Q,
    input  wire [31:0] s_id1_read1_Q,
    input  wire [31:0] s_id1_read2_Q,
    input  wire [1:0] s_id1_rff1_sel_Q,
    input  wire [1:0] s_id1_rff2_sel_Q,
    input  wire [4:0] s_id1_rs1_Q,
    input  wire [4:0] s_id1_rs2_Q,
    input  wire [31:0] s_wb_fwdA_Q,
    input  wire [31:0] s_wb_fwdB_Q,
    input  wire [4:0] s_wb_rdA_Q,
    input  wire [4:0] s_wb_rdB_Q,
    input  wire s_wb_wtenA_Q,
    input  wire s_wb_wtenB_Q,
    output wire decoder1_ACT,
    output wire [16:0] decoder1_codasip_param_0,
    output wire id1_output_ACT,
    output wire [4:0] rf_xpr_read0_RA,
    output wire rf_xpr_read0_RE,
    output wire [4:0] rf_xpr_read1_RA,
    output wire rf_xpr_read1_RE,
    output wire [31:0] s_id1_bradd_D,
    output wire [31:0] s_id1_immed_D,
    output wire [11:0] s_id1_immedb_D,
    output wire [11:0] s_id1_immedi_D,
    output wire [19:0] s_id1_immedj_D,
    output wire [11:0] s_id1_immeds_D,
    output wire [19:0] s_id1_immedu_D,
    output wire [31:0] s_id1_instr_D,
    output wire [16:0] s_id1_opc_D,
    output wire s_id1_order_D,
    output wire [31:0] s_id1_pc_D,
    output wire s_id1_pcsrc_D,
    output wire [4:0] s_id1_rd_D,
    output wire [31:0] s_id1_read1_D,
    output wire [31:0] s_id1_read2_D,
    output wire [31:0] s_id1_reg1_D,
    output wire [31:0] s_id1_reg2_D,
    output wire [1:0] s_id1_rff1_sel_D,
    output wire [1:0] s_id1_rff2_sel_D,
    output wire [4:0] s_id1_rs1_D,
    output wire [4:0] s_id1_rs2_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire [1:0] codasip_tmp_var_2;
    // signal/wire
    wire [1:0] codasip_tmp_var_3;
    // signal/wire
    wire [2:0] codasip_tmp_var_4;
    // signal/wire
    wire hready_B0;
    // signal/wire
    wire hresp_B0;
    // signal/wire
    wire [31:0] id_instr_temp_B0;
    // signal/wire
    wire restart_B0;
    // signal/wire
    wire [31:0] s_id1_immed_D_ACT_wire;
    // signal/wire
    wire [31:0] s_id1_instr_D_ACT_wire;
    // signal/wire
    wire s_id1_order_D_ACT_wire;
    // signal/wire
    wire [31:0] s_id1_pc_D_ACT_wire;
    // signal/wire
    wire [31:0] s_id1_reg1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_id1_reg2_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_id1_reg1_D_ACT_wire_1;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_id1_reg2_D_ACT_wire_2;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_id1_immed_D_ACT_wire_3;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_460_4;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_475_5;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_490_6;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_503_7;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_518_8;

    // conversions for data-path:
    assign tmp_codasip_conv_STATIC_CAST_460_4 = $signed(s_id1_immedi_Q);
    assign tmp_codasip_conv_STATIC_CAST_475_5 = $signed(s_id1_immedb_Q);
    assign tmp_codasip_conv_STATIC_CAST_490_6 = $signed(s_id1_immedu_Q);
    assign tmp_codasip_conv_STATIC_CAST_503_7 = $signed(s_id1_immeds_Q);
    assign tmp_codasip_conv_STATIC_CAST_518_8 = $signed(s_id1_immedj_Q);
    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:110:9
    // restart.write((int32)(0x0));
    assign restart_B0 = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:113:9
    // if1_ahb.transport((uint3)(0x1), hready, hresp, id_instr_temp);
    assign hready_B0 = if1_ahb_HREADY;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:113:9
    // if1_ahb.transport((uint3)(0x1), hready, hresp, id_instr_temp);
    assign hresp_B0 = if1_ahb_HRESP;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:113:9
    // if1_ahb.transport((uint3)(0x1), hready, hresp, id_instr_temp);
    assign id_instr_temp_B0 = if1_ahb_HRDATA;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:115:13
    // codasip_tmp_var_0.write((uint1)(r_id_clear.read()));
    assign codasip_tmp_var_0 = r_id_clear_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:121:18
    // codasip_tmp_var_1.write((uint1)(r_id1_stall.read()));
    assign codasip_tmp_var_1 = (!codasip_tmp_var_0) ? r_id1_stall_Q : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:123:13
    assign s_id1_instr_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:117:13
        // s_id1_instr.write((uint10)(0x13));
        codasip_tmp_var_0 ? 32'h00000013 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:123:13
        // s_id1_instr.write(r_id1_instr_preserved.read());
        codasip_tmp_var_1 ? r_id1_instr_preserved_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:129:13
        // s_id1_instr.write(id_instr_temp.read());
        id_instr_temp_B0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:124:13
    assign s_id1_order_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:118:13
        // s_id1_order.write(restart.read());
        codasip_tmp_var_0 ? restart_B0 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:124:13
        // s_id1_order.write(r_id1_order_preserved.read());
        codasip_tmp_var_1 ? r_id1_order_preserved_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:130:13
        // s_id1_order.write(r_id1_order.read());
        r_id1_order_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:125:13
    assign s_id1_pc_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:119:13
        // s_id1_pc.write(restart.read());
        codasip_tmp_var_0 ? {{31{1'b0}}, restart_B0} :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:125:13
        // s_id1_pc.write(r_id1_pc_preserved.read());
        codasip_tmp_var_1 ? r_id1_pc_preserved_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:131:13
        // s_id1_pc.write(r_id1_pc.read());
        r_id1_pc_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:178:17
    // codasip_tmp_var_2.write(s_id1_rff1_sel.read());
    assign codasip_tmp_var_2 = s_id1_rff1_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:183:22
    always @(*) begin
        case ( codasip_tmp_var_2 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:180:36
            // s_id1_reg1.write(s_id1_read1.read());
            2'h0: tmp_codasip_conv_mux_s_id1_reg1_D_ACT_wire_1 = s_id1_read1_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:181:37
            // s_id1_reg1.write(s_wb_fwdA.read());
            2'h1: tmp_codasip_conv_mux_s_id1_reg1_D_ACT_wire_1 = s_wb_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:182:37
            // s_id1_reg1.write(s_wb_fwdB.read());
            2'h2: tmp_codasip_conv_mux_s_id1_reg1_D_ACT_wire_1 = s_wb_fwdB_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:183:22
            // s_id1_reg1.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_id1_reg1_D_ACT_wire_1 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_id1_reg1_D_ACT_wire_1 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_id1_reg1_D_ACT_wire = tmp_codasip_conv_mux_s_id1_reg1_D_ACT_wire_1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:186:17
    // codasip_tmp_var_3.write(s_id1_rff2_sel.read());
    assign codasip_tmp_var_3 = s_id1_rff2_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:191:22
    always @(*) begin
        case ( codasip_tmp_var_3 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:188:36
            // s_id1_reg2.write(s_id1_read2.read());
            2'h0: tmp_codasip_conv_mux_s_id1_reg2_D_ACT_wire_2 = s_id1_read2_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:189:37
            // s_id1_reg2.write(s_wb_fwdA.read());
            2'h1: tmp_codasip_conv_mux_s_id1_reg2_D_ACT_wire_2 = s_wb_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:190:37
            // s_id1_reg2.write(s_wb_fwdB.read());
            2'h2: tmp_codasip_conv_mux_s_id1_reg2_D_ACT_wire_2 = s_wb_fwdB_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:191:22
            // s_id1_reg2.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_id1_reg2_D_ACT_wire_2 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_id1_reg2_D_ACT_wire_2 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_id1_reg2_D_ACT_wire = tmp_codasip_conv_mux_s_id1_reg2_D_ACT_wire_2;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:202:17
    // codasip_tmp_var_4.write(s_id1_immsel.read());
    assign codasip_tmp_var_4 = s_id1_immsel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:209:29
    always @(*) begin
        case ( codasip_tmp_var_4 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:204:28
            // s_id1_immed.write((int32)(0x0));
            3'h0: tmp_codasip_conv_mux_s_id1_immed_D_ACT_wire_3 = 32'h00000000;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:205:29
            // s_id1_immed.write(((int32)((int12)(s_id1_immedi.read()))));
            3'h1: tmp_codasip_conv_mux_s_id1_immed_D_ACT_wire_3 = $unsigned(tmp_codasip_conv_STATIC_CAST_460_4);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:206:29
            // s_id1_immed.write(((int32)((int12)(s_id1_immedb.read()))) << (int32)(0x1));
            3'h2: tmp_codasip_conv_mux_s_id1_immed_D_ACT_wire_3 = $unsigned((tmp_codasip_conv_STATIC_CAST_475_5 << 32'sh00000001));
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:207:29
            // s_id1_immed.write(((int32)((int20)(s_id1_immedu.read()))) << (int32)(0xc));
            3'h3: tmp_codasip_conv_mux_s_id1_immed_D_ACT_wire_3 = $unsigned((tmp_codasip_conv_STATIC_CAST_490_6 << 32'sh0000000c));
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:208:29
            // s_id1_immed.write(((int32)((int12)(s_id1_immeds.read()))));
            3'h4: tmp_codasip_conv_mux_s_id1_immed_D_ACT_wire_3 = $unsigned(tmp_codasip_conv_STATIC_CAST_503_7);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:209:29
            // s_id1_immed.write(((int32)((int20)(s_id1_immedj.read()))) << (int32)(0x1));
            3'h5: tmp_codasip_conv_mux_s_id1_immed_D_ACT_wire_3 = $unsigned((tmp_codasip_conv_STATIC_CAST_518_8 << 32'sh00000001));
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_id1_immed_D_ACT_wire_3 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_id1_immed_D_ACT_wire = tmp_codasip_conv_mux_s_id1_immed_D_ACT_wire_3;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:197:17
    // decoder1(s_id1_opc.read());
    assign decoder1_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:197:17
    // decoder1(s_id1_opc.read());
    assign decoder1_codasip_param_0 = (ACT == 1'b1) ? s_id1_opc_Q : 17'h00000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:224:19
    // id1_output();
    assign id1_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:156:9
    // s_id1_read1.write(rf_xpr.read(s_id1_rs1.read(), (uint32)(0)));
    assign rf_xpr_read0_RA = s_id1_rs1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:156:9
    // s_id1_read1.write(rf_xpr.read(s_id1_rs1.read(), (uint32)(0)));
    assign rf_xpr_read0_RE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:157:9
    // s_id1_read2.write(rf_xpr.read(s_id1_rs2.read(), (uint32)(1)));
    assign rf_xpr_read1_RA = s_id1_rs2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:157:9
    // s_id1_read2.write(rf_xpr.read(s_id1_rs2.read(), (uint32)(1)));
    assign rf_xpr_read1_RE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:218:9
    // s_id1_bradd.write((s_id1_immed.read() + s_id1_pc.read()));
    assign s_id1_bradd_D = (ACT == 1'b1) ? (s_id1_immed_Q + s_id1_pc_Q) : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:209:29
    assign s_id1_immed_D = (ACT == 1'b1) ? s_id1_immed_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:145:9
    // s_id1_immedb.write(s_id1_instr.read()[31 .. 31] :: s_id1_instr.read()[7 .. 7] :: s_id1_instr. ...
    assign s_id1_immedb_D = (ACT == 1'b1) ? {s_id1_instr_Q[31], s_id1_instr_Q[7], s_id1_instr_Q[30:25], s_id1_instr_Q[11:8]} : 12'h000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:143:9
    // s_id1_immedi.write(s_id1_instr.read()[31 .. 20]);
    assign s_id1_immedi_D = (ACT == 1'b1) ? s_id1_instr_Q[31:20] : 12'h000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:151:9
    // s_id1_immedj.write(s_id1_instr.read()[31 .. 31] :: s_id1_instr.read()[19 .. 12] :: s_id1_inst ...
    assign s_id1_immedj_D = (ACT == 1'b1) ? {s_id1_instr_Q[31], s_id1_instr_Q[19:12], s_id1_instr_Q[20], s_id1_instr_Q[30:21]} : 20'h00000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:149:9
    // s_id1_immeds.write(s_id1_instr.read()[31 .. 25] :: s_id1_instr.read()[11 .. 7]);
    assign s_id1_immeds_D = (ACT == 1'b1) ? {s_id1_instr_Q[31:25], s_id1_instr_Q[11:7]} : 12'h000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:147:9
    // s_id1_immedu.write(s_id1_instr.read()[31 .. 12]);
    assign s_id1_immedu_D = (ACT == 1'b1) ? s_id1_instr_Q[31:12] : 20'h00000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:129:13
    assign s_id1_instr_D = (ACT == 1'b1) ? s_id1_instr_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:137:9
    // s_id1_opc.write(s_id1_instr.read()[31 .. 25] :: s_id1_instr.read()[14 .. 12] :: s_id1_instr.r ...
    assign s_id1_opc_D = (ACT == 1'b1) ? {s_id1_instr_Q[31:25], s_id1_instr_Q[14:12], s_id1_instr_Q[6:0]} : 17'h00000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:130:13
    assign s_id1_order_D = (ACT == 1'b1) ? s_id1_order_D_ACT_wire : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:131:13
    assign s_id1_pc_D = (ACT == 1'b1) ? s_id1_pc_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:219:9
    // s_id1_pcsrc.write((s_id1_branchop.read() == (uint3)(0x4)));
    assign s_id1_pcsrc_D = (ACT == 1'b1) ? (s_id1_branchop_Q == 3'h4) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:140:9
    // s_id1_rd.write(s_id1_instr.read()[11 .. 7]);
    assign s_id1_rd_D = (ACT == 1'b1) ? s_id1_instr_Q[11:7] : 5'h00;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:156:9
    // s_id1_read1.write(rf_xpr.read(s_id1_rs1.read(), (uint32)(0)));
    assign s_id1_read1_D = (ACT == 1'b1) ? rf_xpr_read0_Q : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:157:9
    // s_id1_read2.write(rf_xpr.read(s_id1_rs2.read(), (uint32)(1)));
    assign s_id1_read2_D = (ACT == 1'b1) ? rf_xpr_read1_Q : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:183:22
    assign s_id1_reg1_D = (ACT == 1'b1) ? s_id1_reg1_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:191:22
    assign s_id1_reg2_D = (ACT == 1'b1) ? s_id1_reg2_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:168:9
    // s_id1_rff1_sel.write((((s_wb_wtenA.read() & (s_wb_rdA.read() == s_id1_rs1.read()))) ? ((uint2 ...
    assign s_id1_rff1_sel_D = (ACT == 1'b1) ? (((s_wb_wtenA_Q & (s_wb_rdA_Q == s_id1_rs1_Q))) ? 2'h1 : (((s_wb_wtenB_Q & (s_wb_rdB_Q == s_id1_rs1_Q))) ? 2'h2 : 2'h0)) : 2'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:171:9
    // s_id1_rff2_sel.write((((s_wb_wtenA.read() & (s_wb_rdA.read() == s_id1_rs2.read()))) ? ((uint2 ...
    assign s_id1_rff2_sel_D = (ACT == 1'b1) ? (((s_wb_wtenA_Q & (s_wb_rdA_Q == s_id1_rs2_Q))) ? 2'h1 : (((s_wb_wtenB_Q & (s_wb_rdB_Q == s_id1_rs2_Q))) ? 2'h2 : 2'h0)) : 2'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:139:9
    // s_id1_rs1.write(s_id1_instr.read()[19 .. 15]);
    assign s_id1_rs1_D = (ACT == 1'b1) ? s_id1_instr_Q[19:15] : 5'h00;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe2_id.codal:138:9
    // s_id1_rs2.write(s_id1_instr.read()[24 .. 20]);
    assign s_id1_rs2_D = (ACT == 1'b1) ? s_id1_instr_Q[24:20] : 5'h00;
endmodule // id1_stage_t
