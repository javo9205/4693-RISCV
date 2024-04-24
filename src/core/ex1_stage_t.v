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
 *  \brief   Contains module definition of the 'ex1_stage_t' functional unit.
 */

module ex1_stage_t(
    input  wire ACT,
    input  wire [3:0] r_ex1_aluop_Q,
    input  wire [1:0] r_ex1_alusrc1_Q,
    input  wire r_ex1_alusrc2_Q,
    input  wire [2:0] r_ex1_branchop_Q,
    input  wire r_ex1_brnch_sel_Q,
    input  wire [31:0] r_ex1_immed_Q,
    input  wire [31:0] r_ex1_pc_Q,
    input  wire [31:0] r_ex1_reg1_preserved_Q,
    input  wire [31:0] r_ex1_reg1_Q,
    input  wire [31:0] r_ex1_reg2_preserved_Q,
    input  wire [31:0] r_ex1_reg2_Q,
    input  wire [4:0] r_ex1_rs1_Q,
    input  wire [4:0] r_ex1_rs2_Q,
    input  wire r_ex1_stall_Q,
    input  wire [31:0] s_ex1_alu_Q,
    input  wire [31:0] s_ex1_brimm_Q,
    input  wire [2:0] s_ex1_fwdA_sel_Q,
    input  wire [2:0] s_ex1_fwdB_sel_Q,
    input  wire [31:0] s_ex1_reg1_Q,
    input  wire [31:0] s_ex1_reg2_Q,
    input  wire [31:0] s_ex1_src1_Q,
    input  wire [31:0] s_ex1_src2_Q,
    input  wire s_ex1_xor_Q,
    input  wire [31:0] s_me_fwdA_Q,
    input  wire [31:0] s_me_fwdB_Q,
    input  wire [4:0] s_me_rdA_Q,
    input  wire [4:0] s_me_rdB_Q,
    input  wire s_me_wtenA_Q,
    input  wire s_me_wtenB_Q,
    input  wire [31:0] s_wb_fwdA_Q,
    input  wire [31:0] s_wb_fwdB_Q,
    input  wire [4:0] s_wb_rdA_Q,
    input  wire [4:0] s_wb_rdB_Q,
    input  wire s_wb_wtenA_Q,
    input  wire s_wb_wtenB_Q,
    output wire [31:0] s_ex1_alu_D,
    output wire [31:0] s_ex1_bradd_D,
    output wire [31:0] s_ex1_brimm_D,
    output wire [2:0] s_ex1_fwdA_sel_D,
    output wire [2:0] s_ex1_fwdB_sel_D,
    output wire s_ex1_pcsrc_D,
    output wire [31:0] s_ex1_reg1_D,
    output wire [31:0] s_ex1_reg2_D,
    output wire [31:0] s_ex1_src1_D,
    output wire [31:0] s_ex1_src2_D,
    output wire s_ex1_xor_D,
    output wire s_ex1_zero_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [2:0] codasip_tmp_var_0;
    // signal/wire
    wire [1:0] codasip_tmp_var_12;
    // signal/wire
    wire codasip_tmp_var_13;
    // signal/wire
    wire [3:0] codasip_tmp_var_14;
    // signal/wire
    wire codasip_tmp_var_15;
    // signal/wire
    wire [2:0] codasip_tmp_var_6;
    // signal/wire
    wire [31:0] s_ex1_alu_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex1_bradd_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex1_reg1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex1_reg2_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex1_src1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex1_src2_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex1_reg1_D_ACT_wire_1;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex1_reg2_D_ACT_wire_2;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex1_src1_D_ACT_wire_3;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex1_src2_D_ACT_wire_4;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex1_bradd_D_ACT_wire_6;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:119:17
    // codasip_tmp_var_0.write(s_ex1_fwdA_sel.read());
    assign codasip_tmp_var_0 = s_ex1_fwdA_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:126:37
    always @(*) begin
        case ( codasip_tmp_var_0 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:121:36
            // s_ex1_reg1.write(r_ex1_reg1.read());
            3'h0: tmp_codasip_conv_mux_s_ex1_reg1_D_ACT_wire_1 = r_ex1_reg1_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:122:36
            // s_ex1_reg1.write(r_ex1_reg1_preserved.read());
            3'h1: tmp_codasip_conv_mux_s_ex1_reg1_D_ACT_wire_1 = r_ex1_reg1_preserved_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:123:37
            // s_ex1_reg1.write(s_me_fwdA.read());
            3'h2: tmp_codasip_conv_mux_s_ex1_reg1_D_ACT_wire_1 = s_me_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:124:37
            // s_ex1_reg1.write(s_me_fwdB.read());
            3'h3: tmp_codasip_conv_mux_s_ex1_reg1_D_ACT_wire_1 = s_me_fwdB_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:125:37
            // s_ex1_reg1.write(s_wb_fwdA.read());
            3'h4: tmp_codasip_conv_mux_s_ex1_reg1_D_ACT_wire_1 = s_wb_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:126:37
            // s_ex1_reg1.write(s_wb_fwdB.read());
            3'h5: tmp_codasip_conv_mux_s_ex1_reg1_D_ACT_wire_1 = s_wb_fwdB_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex1_reg1_D_ACT_wire_1 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex1_reg1_D_ACT_wire = tmp_codasip_conv_mux_s_ex1_reg1_D_ACT_wire_1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:130:17
    // codasip_tmp_var_6.write(s_ex1_fwdB_sel.read());
    assign codasip_tmp_var_6 = s_ex1_fwdB_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:137:37
    always @(*) begin
        case ( codasip_tmp_var_6 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:132:36
            // s_ex1_reg2.write(r_ex1_reg2.read());
            3'h0: tmp_codasip_conv_mux_s_ex1_reg2_D_ACT_wire_2 = r_ex1_reg2_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:133:36
            // s_ex1_reg2.write(r_ex1_reg2_preserved.read());
            3'h1: tmp_codasip_conv_mux_s_ex1_reg2_D_ACT_wire_2 = r_ex1_reg2_preserved_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:134:37
            // s_ex1_reg2.write(s_me_fwdA.read());
            3'h2: tmp_codasip_conv_mux_s_ex1_reg2_D_ACT_wire_2 = s_me_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:135:37
            // s_ex1_reg2.write(s_me_fwdB.read());
            3'h3: tmp_codasip_conv_mux_s_ex1_reg2_D_ACT_wire_2 = s_me_fwdB_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:136:37
            // s_ex1_reg2.write(s_wb_fwdA.read());
            3'h4: tmp_codasip_conv_mux_s_ex1_reg2_D_ACT_wire_2 = s_wb_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:137:37
            // s_ex1_reg2.write(s_wb_fwdB.read());
            3'h5: tmp_codasip_conv_mux_s_ex1_reg2_D_ACT_wire_2 = s_wb_fwdB_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex1_reg2_D_ACT_wire_2 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex1_reg2_D_ACT_wire = tmp_codasip_conv_mux_s_ex1_reg2_D_ACT_wire_2;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:145:17
    // codasip_tmp_var_12.write(r_ex1_alusrc1.read());
    assign codasip_tmp_var_12 = r_ex1_alusrc1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:156:17
    always @(*) begin
        case ( codasip_tmp_var_12 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:156:17
            // s_ex1_src1.write((int32)(0x0));
            2'h0: tmp_codasip_conv_mux_s_ex1_src1_D_ACT_wire_3 = 32'h00000000;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:148:17
            // s_ex1_src1.write(s_ex1_reg1.read());
            2'h1: tmp_codasip_conv_mux_s_ex1_src1_D_ACT_wire_3 = s_ex1_reg1_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:152:17
            // s_ex1_src1.write(r_ex1_pc.read());
            2'h2: tmp_codasip_conv_mux_s_ex1_src1_D_ACT_wire_3 = r_ex1_pc_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex1_src1_D_ACT_wire_3 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex1_src1_D_ACT_wire = tmp_codasip_conv_mux_s_ex1_src1_D_ACT_wire_3;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:164:17
    // codasip_tmp_var_13.write(r_ex1_alusrc2.read());
    assign codasip_tmp_var_13 = r_ex1_alusrc2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:171:17
    always @(*) begin
        case ( codasip_tmp_var_13 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:171:17
            // s_ex1_src2.write(r_ex1_immed.read());
            1'b0: tmp_codasip_conv_mux_s_ex1_src2_D_ACT_wire_4 = r_ex1_immed_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:167:17
            // s_ex1_src2.write(s_ex1_reg2.read());
            1'b1: tmp_codasip_conv_mux_s_ex1_src2_D_ACT_wire_4 = s_ex1_reg2_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex1_src2_D_ACT_wire_4 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex1_src2_D_ACT_wire = tmp_codasip_conv_mux_s_ex1_src2_D_ACT_wire_4;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:191:17
    // codasip_tmp_var_14.write(r_ex1_aluop.read());
    assign codasip_tmp_var_14 = r_ex1_aluop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:203:28
    always @(*) begin
        case ( codasip_tmp_var_14 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:193:27
            // s_ex1_alu.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = 32'h00000000;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:194:27
            // s_ex1_alu.write(s_ex1_src1.read() + s_ex1_src2.read());
            4'h1: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = (s_ex1_src1_Q + s_ex1_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:195:27
            // s_ex1_alu.write(s_ex1_src1.read() - s_ex1_src2.read());
            4'h2: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = (s_ex1_src1_Q - s_ex1_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:196:27
            // s_ex1_alu.write(s_ex1_src1.read() & s_ex1_src2.read());
            4'h3: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = (s_ex1_src1_Q & s_ex1_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:197:26
            // s_ex1_alu.write(s_ex1_src1.read() | s_ex1_src2.read());
            4'h4: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = (s_ex1_src1_Q | s_ex1_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:198:27
            // s_ex1_alu.write(s_ex1_src1.read() ^ s_ex1_src2.read());
            4'h5: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = (s_ex1_src1_Q ^ s_ex1_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:199:27
            // s_ex1_alu.write(s_ex1_src1.read() << ((int5)(s_ex1_src2.read())));
            4'h6: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = (s_ex1_src1_Q << $signed(s_ex1_src2_Q[4:0]));
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:200:27
            // s_ex1_alu.write(s_ex1_src1.read() >> ((int5)(s_ex1_src2.read())));
            4'h7: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = (s_ex1_src1_Q >> $signed(s_ex1_src2_Q[4:0]));
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:201:27
            // s_ex1_alu.write(((int32)(s_ex1_src1.read())) >> ((int5)(s_ex1_src2.read())));
            4'h8: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = $unsigned(($signed(s_ex1_src1_Q) >>> $signed(s_ex1_src2_Q[4:0])));
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:202:27
            // s_ex1_alu.write(((int32)(s_ex1_src1.read())) < ((int32)(s_ex1_src2.read())));
            4'h9: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = {{31{1'b0}}, ($signed(s_ex1_src1_Q) < $signed(s_ex1_src2_Q))};
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:203:28
            // s_ex1_alu.write((s_ex1_src1.read() < s_ex1_src2.read()));
            4'ha: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = {{31{1'b0}}, (s_ex1_src1_Q < s_ex1_src2_Q)};
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex1_alu_D_ACT_wire = tmp_codasip_conv_mux_s_ex1_alu_D_ACT_wire_5;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:214:17
    // codasip_tmp_var_15.write(r_ex1_brnch_sel.read());
    assign codasip_tmp_var_15 = r_ex1_brnch_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:217:29
    always @(*) begin
        case ( codasip_tmp_var_15 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:217:29
            // s_ex1_bradd.write(s_ex1_alu.read());
            1'b0: tmp_codasip_conv_mux_s_ex1_bradd_D_ACT_wire_6 = s_ex1_alu_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:216:30
            // s_ex1_bradd.write(s_ex1_brimm.read());
            1'b1: tmp_codasip_conv_mux_s_ex1_bradd_D_ACT_wire_6 = s_ex1_brimm_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex1_bradd_D_ACT_wire_6 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex1_bradd_D_ACT_wire = tmp_codasip_conv_mux_s_ex1_bradd_D_ACT_wire_6;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:203:28
    assign s_ex1_alu_D = (ACT == 1'b1) ? s_ex1_alu_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:217:29
    assign s_ex1_bradd_D = (ACT == 1'b1) ? s_ex1_bradd_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:209:9
    // s_ex1_brimm.write(r_ex1_immed.read() + r_ex1_pc.read());
    assign s_ex1_brimm_D = (ACT == 1'b1) ? (r_ex1_immed_Q + r_ex1_pc_Q) : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:103:9
    // s_ex1_fwdA_sel.write((((s_me_wtenA.read() && (s_me_rdA.read() == r_ex1_rs1.read()))) ? ((uint ...
    assign s_ex1_fwdA_sel_D = (ACT == 1'b1) ? (((s_me_wtenA_Q && (s_me_rdA_Q == r_ex1_rs1_Q))) ? 3'h2 : (((s_me_wtenB_Q && (s_me_rdB_Q == r_ex1_rs1_Q))) ? 3'h3 : (((s_wb_wtenA_Q && (s_wb_rdA_Q == r_ex1_rs1_Q))) ? 3'h4 : (((s_wb_wtenB_Q && (s_wb_rdB_Q == r_ex1_rs1_Q))) ? 3'h5 : {{2{1'b0}}, ((r_ex1_stall_Q) ? 1'b1 : 1'b0)})))) : 3'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:109:9
    // s_ex1_fwdB_sel.write((((s_me_wtenA.read() && (s_me_rdA.read() == r_ex1_rs2.read()))) ? ((uint ...
    assign s_ex1_fwdB_sel_D = (ACT == 1'b1) ? (((s_me_wtenA_Q && (s_me_rdA_Q == r_ex1_rs2_Q))) ? 3'h2 : (((s_me_wtenB_Q && (s_me_rdB_Q == r_ex1_rs2_Q))) ? 3'h3 : (((s_wb_wtenA_Q && (s_wb_rdA_Q == r_ex1_rs2_Q))) ? 3'h4 : (((s_wb_wtenB_Q && (s_wb_rdB_Q == r_ex1_rs2_Q))) ? 3'h5 : {{2{1'b0}}, ((r_ex1_stall_Q) ? 1'b1 : 1'b0)})))) : 3'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:183:9
    // s_ex1_pcsrc.write((r_ex1_branchop.read() == (uint3)(0x5)) || (r_ex1_branchop.read() == (uint3 ...
    assign s_ex1_pcsrc_D = (ACT == 1'b1) ? (((r_ex1_branchop_Q == 3'h5) || ((r_ex1_branchop_Q == 3'h7) && s_ex1_xor_Q)) || ((r_ex1_branchop_Q == 3'h6) && (!s_ex1_xor_Q))) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:126:37
    assign s_ex1_reg1_D = (ACT == 1'b1) ? s_ex1_reg1_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:137:37
    assign s_ex1_reg2_D = (ACT == 1'b1) ? s_ex1_reg2_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:156:17
    assign s_ex1_src1_D = (ACT == 1'b1) ? s_ex1_src1_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:171:17
    assign s_ex1_src2_D = (ACT == 1'b1) ? s_ex1_src2_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:182:9
    // s_ex1_xor.write(!((s_ex1_reg1.read() ^ s_ex1_reg2.read()) != (uint32)(0)));
    assign s_ex1_xor_D = (ACT == 1'b1) ? (!((s_ex1_reg1_Q ^ s_ex1_reg2_Q) != 32'h00000000)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:208:9
    // s_ex1_zero.write((s_ex1_alu.read() == (uint32)(0)));
    assign s_ex1_zero_D = (ACT == 1'b1) ? (s_ex1_alu_Q == 32'h00000000) : 1'b0;
endmodule // ex1_stage_t
