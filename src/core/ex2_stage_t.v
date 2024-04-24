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
 *  \brief   Contains module definition of the 'ex2_stage_t' functional unit.
 */

module ex2_stage_t(
    input  wire ACT,
    input  wire [3:0] r_ex2_aluop_Q,
    input  wire [1:0] r_ex2_alusrc1_Q,
    input  wire r_ex2_alusrc2_Q,
    input  wire [2:0] r_ex2_branchop_Q,
    input  wire r_ex2_brnch_sel_Q,
    input  wire [31:0] r_ex2_immed_Q,
    input  wire [31:0] r_ex2_pc_Q,
    input  wire [31:0] r_ex2_reg1_preserved_Q,
    input  wire [31:0] r_ex2_reg1_Q,
    input  wire [31:0] r_ex2_reg2_preserved_Q,
    input  wire [31:0] r_ex2_reg2_Q,
    input  wire [4:0] r_ex2_rs1_Q,
    input  wire [4:0] r_ex2_rs2_Q,
    input  wire r_ex2_stall_Q,
    input  wire [31:0] s_ex2_alu_Q,
    input  wire [31:0] s_ex2_brimm_Q,
    input  wire [2:0] s_ex2_fwdA_sel_Q,
    input  wire [2:0] s_ex2_fwdB_sel_Q,
    input  wire [31:0] s_ex2_reg1_Q,
    input  wire [31:0] s_ex2_reg2_Q,
    input  wire [31:0] s_ex2_src1_Q,
    input  wire [31:0] s_ex2_src2_Q,
    input  wire s_ex2_xor_Q,
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
    output wire [31:0] s_ex2_alu_D,
    output wire [31:0] s_ex2_bradd_D,
    output wire [31:0] s_ex2_brimm_D,
    output wire [2:0] s_ex2_fwdA_sel_D,
    output wire [2:0] s_ex2_fwdB_sel_D,
    output wire s_ex2_pcsrc_D,
    output wire [31:0] s_ex2_reg1_D,
    output wire [31:0] s_ex2_reg2_D,
    output wire [31:0] s_ex2_src1_D,
    output wire [31:0] s_ex2_src2_D,
    output wire s_ex2_xor_D,
    output wire s_ex2_zero_D
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
    wire [31:0] s_ex2_alu_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex2_bradd_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex2_reg1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex2_reg2_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex2_src1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex2_src2_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex2_reg1_D_ACT_wire_1;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex2_reg2_D_ACT_wire_2;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex2_src1_D_ACT_wire_3;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex2_src2_D_ACT_wire_4;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex2_bradd_D_ACT_wire_6;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:356:17
    // codasip_tmp_var_0.write(s_ex2_fwdA_sel.read());
    assign codasip_tmp_var_0 = s_ex2_fwdA_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:363:37
    always @(*) begin
        case ( codasip_tmp_var_0 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:358:36
            // s_ex2_reg1.write(r_ex2_reg1.read());
            3'h0: tmp_codasip_conv_mux_s_ex2_reg1_D_ACT_wire_1 = r_ex2_reg1_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:359:36
            // s_ex2_reg1.write(r_ex2_reg1_preserved.read());
            3'h1: tmp_codasip_conv_mux_s_ex2_reg1_D_ACT_wire_1 = r_ex2_reg1_preserved_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:360:37
            // s_ex2_reg1.write(s_me_fwdA.read());
            3'h2: tmp_codasip_conv_mux_s_ex2_reg1_D_ACT_wire_1 = s_me_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:361:37
            // s_ex2_reg1.write(s_me_fwdB.read());
            3'h3: tmp_codasip_conv_mux_s_ex2_reg1_D_ACT_wire_1 = s_me_fwdB_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:362:37
            // s_ex2_reg1.write(s_wb_fwdA.read());
            3'h4: tmp_codasip_conv_mux_s_ex2_reg1_D_ACT_wire_1 = s_wb_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:363:37
            // s_ex2_reg1.write(s_wb_fwdB.read());
            3'h5: tmp_codasip_conv_mux_s_ex2_reg1_D_ACT_wire_1 = s_wb_fwdB_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex2_reg1_D_ACT_wire_1 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex2_reg1_D_ACT_wire = tmp_codasip_conv_mux_s_ex2_reg1_D_ACT_wire_1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:367:17
    // codasip_tmp_var_6.write(s_ex2_fwdB_sel.read());
    assign codasip_tmp_var_6 = s_ex2_fwdB_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:374:37
    always @(*) begin
        case ( codasip_tmp_var_6 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:369:36
            // s_ex2_reg2.write(r_ex2_reg2.read());
            3'h0: tmp_codasip_conv_mux_s_ex2_reg2_D_ACT_wire_2 = r_ex2_reg2_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:370:36
            // s_ex2_reg2.write(r_ex2_reg2_preserved.read());
            3'h1: tmp_codasip_conv_mux_s_ex2_reg2_D_ACT_wire_2 = r_ex2_reg2_preserved_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:371:37
            // s_ex2_reg2.write(s_me_fwdA.read());
            3'h2: tmp_codasip_conv_mux_s_ex2_reg2_D_ACT_wire_2 = s_me_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:372:37
            // s_ex2_reg2.write(s_me_fwdB.read());
            3'h3: tmp_codasip_conv_mux_s_ex2_reg2_D_ACT_wire_2 = s_me_fwdB_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:373:37
            // s_ex2_reg2.write(s_wb_fwdA.read());
            3'h4: tmp_codasip_conv_mux_s_ex2_reg2_D_ACT_wire_2 = s_wb_fwdA_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:374:37
            // s_ex2_reg2.write(s_wb_fwdB.read());
            3'h5: tmp_codasip_conv_mux_s_ex2_reg2_D_ACT_wire_2 = s_wb_fwdB_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex2_reg2_D_ACT_wire_2 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex2_reg2_D_ACT_wire = tmp_codasip_conv_mux_s_ex2_reg2_D_ACT_wire_2;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:382:17
    // codasip_tmp_var_12.write(r_ex2_alusrc1.read());
    assign codasip_tmp_var_12 = r_ex2_alusrc1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:386:29
    always @(*) begin
        case ( codasip_tmp_var_12 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:386:29
            // s_ex2_src1.write((int32)(0x0));
            2'h0: tmp_codasip_conv_mux_s_ex2_src1_D_ACT_wire_3 = 32'h00000000;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:384:28
            // s_ex2_src1.write(s_ex2_reg1.read());
            2'h1: tmp_codasip_conv_mux_s_ex2_src1_D_ACT_wire_3 = s_ex2_reg1_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:385:27
            // s_ex2_src1.write(r_ex2_pc.read());
            2'h2: tmp_codasip_conv_mux_s_ex2_src1_D_ACT_wire_3 = r_ex2_pc_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex2_src1_D_ACT_wire_3 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex2_src1_D_ACT_wire = tmp_codasip_conv_mux_s_ex2_src1_D_ACT_wire_3;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:390:17
    // codasip_tmp_var_13.write(r_ex2_alusrc2.read());
    assign codasip_tmp_var_13 = r_ex2_alusrc2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:393:28
    always @(*) begin
        case ( codasip_tmp_var_13 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:393:28
            // s_ex2_src2.write(r_ex2_immed.read());
            1'b0: tmp_codasip_conv_mux_s_ex2_src2_D_ACT_wire_4 = r_ex2_immed_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:392:28
            // s_ex2_src2.write(s_ex2_reg2.read());
            1'b1: tmp_codasip_conv_mux_s_ex2_src2_D_ACT_wire_4 = s_ex2_reg2_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex2_src2_D_ACT_wire_4 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex2_src2_D_ACT_wire = tmp_codasip_conv_mux_s_ex2_src2_D_ACT_wire_4;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:409:17
    // codasip_tmp_var_14.write(r_ex2_aluop.read());
    assign codasip_tmp_var_14 = r_ex2_aluop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:421:28
    always @(*) begin
        case ( codasip_tmp_var_14 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:411:27
            // s_ex2_alu.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = 32'h00000000;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:412:27
            // s_ex2_alu.write(s_ex2_src1.read() + s_ex2_src2.read());
            4'h1: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = (s_ex2_src1_Q + s_ex2_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:413:27
            // s_ex2_alu.write(s_ex2_src1.read() - s_ex2_src2.read());
            4'h2: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = (s_ex2_src1_Q - s_ex2_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:414:27
            // s_ex2_alu.write(s_ex2_src1.read() & s_ex2_src2.read());
            4'h3: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = (s_ex2_src1_Q & s_ex2_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:415:26
            // s_ex2_alu.write(s_ex2_src1.read() | s_ex2_src2.read());
            4'h4: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = (s_ex2_src1_Q | s_ex2_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:416:27
            // s_ex2_alu.write(s_ex2_src1.read() ^ s_ex2_src2.read());
            4'h5: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = (s_ex2_src1_Q ^ s_ex2_src2_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:417:27
            // s_ex2_alu.write(s_ex2_src1.read() << ((int5)(s_ex2_src2.read())));
            4'h6: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = (s_ex2_src1_Q << $signed(s_ex2_src2_Q[4:0]));
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:418:27
            // s_ex2_alu.write(s_ex2_src1.read() >> ((int5)(s_ex2_src2.read())));
            4'h7: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = (s_ex2_src1_Q >> $signed(s_ex2_src2_Q[4:0]));
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:419:27
            // s_ex2_alu.write(((int32)(s_ex2_src1.read())) >> ((int5)(s_ex2_src2.read())));
            4'h8: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = $unsigned(($signed(s_ex2_src1_Q) >>> $signed(s_ex2_src2_Q[4:0])));
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:420:27
            // s_ex2_alu.write(((int32)(s_ex2_src1.read())) < ((int32)(s_ex2_src2.read())));
            4'h9: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = {{31{1'b0}}, ($signed(s_ex2_src1_Q) < $signed(s_ex2_src2_Q))};
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:421:28
            // s_ex2_alu.write((s_ex2_src1.read() < s_ex2_src2.read()));
            4'ha: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = {{31{1'b0}}, (s_ex2_src1_Q < s_ex2_src2_Q)};
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex2_alu_D_ACT_wire = tmp_codasip_conv_mux_s_ex2_alu_D_ACT_wire_5;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:430:17
    // codasip_tmp_var_15.write(r_ex2_brnch_sel.read());
    assign codasip_tmp_var_15 = r_ex2_brnch_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:433:29
    always @(*) begin
        case ( codasip_tmp_var_15 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:433:29
            // s_ex2_bradd.write(s_ex2_alu.read());
            1'b0: tmp_codasip_conv_mux_s_ex2_bradd_D_ACT_wire_6 = s_ex2_alu_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:432:30
            // s_ex2_bradd.write(s_ex2_brimm.read());
            1'b1: tmp_codasip_conv_mux_s_ex2_bradd_D_ACT_wire_6 = s_ex2_brimm_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex2_bradd_D_ACT_wire_6 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex2_bradd_D_ACT_wire = tmp_codasip_conv_mux_s_ex2_bradd_D_ACT_wire_6;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:421:28
    assign s_ex2_alu_D = (ACT == 1'b1) ? s_ex2_alu_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:433:29
    assign s_ex2_bradd_D = (ACT == 1'b1) ? s_ex2_bradd_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:425:9
    // s_ex2_brimm.write(r_ex2_immed.read() + r_ex2_pc.read());
    assign s_ex2_brimm_D = (ACT == 1'b1) ? (r_ex2_immed_Q + r_ex2_pc_Q) : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:340:9
    // s_ex2_fwdA_sel.write((((s_me_wtenA.read() && (s_me_rdA.read() == r_ex2_rs1.read()))) ? ((uint ...
    assign s_ex2_fwdA_sel_D = (ACT == 1'b1) ? (((s_me_wtenA_Q && (s_me_rdA_Q == r_ex2_rs1_Q))) ? 3'h2 : (((s_me_wtenB_Q && (s_me_rdB_Q == r_ex2_rs1_Q))) ? 3'h3 : (((s_wb_wtenA_Q && (s_wb_rdA_Q == r_ex2_rs1_Q))) ? 3'h4 : (((s_wb_wtenB_Q && (s_wb_rdB_Q == r_ex2_rs1_Q))) ? 3'h5 : {{2{1'b0}}, ((r_ex2_stall_Q) ? 1'b1 : 1'b0)})))) : 3'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:346:9
    // s_ex2_fwdB_sel.write((((s_me_wtenA.read() && (s_me_rdA.read() == r_ex2_rs2.read()))) ? ((uint ...
    assign s_ex2_fwdB_sel_D = (ACT == 1'b1) ? (((s_me_wtenA_Q && (s_me_rdA_Q == r_ex2_rs2_Q))) ? 3'h2 : (((s_me_wtenB_Q && (s_me_rdB_Q == r_ex2_rs2_Q))) ? 3'h3 : (((s_wb_wtenA_Q && (s_wb_rdA_Q == r_ex2_rs2_Q))) ? 3'h4 : (((s_wb_wtenB_Q && (s_wb_rdB_Q == r_ex2_rs2_Q))) ? 3'h5 : {{2{1'b0}}, ((r_ex2_stall_Q) ? 1'b1 : 1'b0)})))) : 3'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:401:9
    // s_ex2_pcsrc.write((r_ex2_branchop.read() == (uint3)(0x5)) || (r_ex2_branchop.read() == (uint3 ...
    assign s_ex2_pcsrc_D = (ACT == 1'b1) ? (((r_ex2_branchop_Q == 3'h5) || ((r_ex2_branchop_Q == 3'h7) && s_ex2_xor_Q)) || ((r_ex2_branchop_Q == 3'h6) && (!s_ex2_xor_Q))) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:363:37
    assign s_ex2_reg1_D = (ACT == 1'b1) ? s_ex2_reg1_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:374:37
    assign s_ex2_reg2_D = (ACT == 1'b1) ? s_ex2_reg2_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:386:29
    assign s_ex2_src1_D = (ACT == 1'b1) ? s_ex2_src1_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:393:28
    assign s_ex2_src2_D = (ACT == 1'b1) ? s_ex2_src2_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:400:9
    // s_ex2_xor.write(!((s_ex2_reg1.read() ^ s_ex2_reg2.read()) != (uint32)(0)));
    assign s_ex2_xor_D = (ACT == 1'b1) ? (!((s_ex2_reg1_Q ^ s_ex2_reg2_Q) != 32'h00000000)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:424:9
    // s_ex2_zero.write((s_ex2_alu.read() == (uint32)(0)));
    assign s_ex2_zero_D = (ACT == 1'b1) ? (s_ex2_alu_Q == 32'h00000000) : 1'b0;
endmodule // ex2_stage_t
