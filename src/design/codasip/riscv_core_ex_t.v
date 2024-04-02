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
 *  \brief   Contains module definition of the 'riscv_core_ex_t' functional unit.
 */

module riscv_core_ex_t(
    input  wire ACT,
    input  wire [3:0] r_ex_aluop_Q,
    input  wire [1:0] r_ex_alusrc1_Q,
    input  wire r_ex_alusrc2_Q,
    input  wire [2:0] r_ex_branchop_Q,
    input  wire r_ex_brnch_sel_Q,
    input  wire [31:0] r_ex_immed_Q,
    input  wire [31:0] r_ex_pc_Q,
    input  wire [31:0] r_ex_reg1_Q,
    input  wire [31:0] r_ex_reg2_Q,
    input  wire [4:0] r_ex_rs1_Q,
    input  wire [4:0] r_ex_rs2_Q,
    input  wire [31:0] r_me_alu_Q,
    input  wire [4:0] r_me_rd_Q,
    input  wire r_me_regwrite_Q,
    input  wire [4:0] r_wb_rd_Q,
    input  wire r_wb_regwrite_Q,
    input  wire [31:0] s_ex_alu_Q,
    input  wire [31:0] s_ex_brimm_Q,
    input  wire [1:0] s_ex_fwdA_sel_Q,
    input  wire [1:0] s_ex_fwdB_sel_Q,
    input  wire [31:0] s_ex_reg1_Q,
    input  wire [31:0] s_ex_reg2_Q,
    input  wire [31:0] s_ex_src1_Q,
    input  wire [31:0] s_ex_src2_Q,
    input  wire s_ex_xor_Q,
    input  wire [31:0] s_wb_result_Q,
    output wire ex_memory_ACT,
    output wire ex_output_ACT,
    output wire [31:0] s_ex_alu_D,
    output wire [31:0] s_ex_bradd_D,
    output wire [31:0] s_ex_brimm_D,
    output wire [1:0] s_ex_fwdA_sel_D,
    output wire [1:0] s_ex_fwdB_sel_D,
    output wire s_ex_pcsrc_D,
    output wire [31:0] s_ex_reg1_D,
    output wire [31:0] s_ex_reg2_D,
    output wire [31:0] s_ex_src1_D,
    output wire [31:0] s_ex_src2_D,
    output wire s_ex_xor_D,
    output wire s_ex_zero_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [1:0] codasip_tmp_var_0;
    // signal/wire
    wire [1:0] codasip_tmp_var_1;
    // signal/wire
    wire [1:0] codasip_tmp_var_2;
    // signal/wire
    wire codasip_tmp_var_3;
    // signal/wire
    wire [3:0] codasip_tmp_var_4;
    // signal/wire
    wire codasip_tmp_var_5;
    // signal/wire
    wire [31:0] s_ex_alu_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_bradd_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_reg1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_reg2_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_src1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_ex_src2_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_reg1_D_ACT_wire_1;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_reg2_D_ACT_wire_2;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6;

    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:55:17
    // codasip_tmp_var_0.write(s_ex_fwdA_sel.read());
    assign codasip_tmp_var_0 = s_ex_fwdA_sel_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:66:17
    always @(*) begin
        case ( codasip_tmp_var_0 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:58:17
            // s_ex_reg1.write(r_ex_reg1.read());
            2'h0: tmp_codasip_conv_mux_s_ex_reg1_D_ACT_wire_1 = r_ex_reg1_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:62:17
            // s_ex_reg1.write(r_me_alu.read());
            2'h1: tmp_codasip_conv_mux_s_ex_reg1_D_ACT_wire_1 = r_me_alu_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:66:17
            // s_ex_reg1.write(s_wb_result.read());
            2'h2: tmp_codasip_conv_mux_s_ex_reg1_D_ACT_wire_1 = s_wb_result_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex_reg1_D_ACT_wire_1 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex_reg1_D_ACT_wire = tmp_codasip_conv_mux_s_ex_reg1_D_ACT_wire_1;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:74:17
    // codasip_tmp_var_1.write(s_ex_fwdB_sel.read());
    assign codasip_tmp_var_1 = s_ex_fwdB_sel_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:90:17
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:77:17
            // s_ex_reg2.write(r_ex_reg2.read());
            2'h0: tmp_codasip_conv_mux_s_ex_reg2_D_ACT_wire_2 = r_ex_reg2_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:81:17
            // s_ex_reg2.write(r_me_alu.read());
            2'h1: tmp_codasip_conv_mux_s_ex_reg2_D_ACT_wire_2 = r_me_alu_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:85:17
            // s_ex_reg2.write(s_wb_result.read());
            2'h2: tmp_codasip_conv_mux_s_ex_reg2_D_ACT_wire_2 = s_wb_result_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:90:17
            // s_ex_reg2.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_ex_reg2_D_ACT_wire_2 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex_reg2_D_ACT_wire_2 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex_reg2_D_ACT_wire = tmp_codasip_conv_mux_s_ex_reg2_D_ACT_wire_2;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:98:17
    // codasip_tmp_var_2.write(r_ex_alusrc1.read());
    assign codasip_tmp_var_2 = r_ex_alusrc1_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:109:17
    always @(*) begin
        case ( codasip_tmp_var_2 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:101:17
            // s_ex_src1.write(s_ex_reg1.read());
            2'h0: tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3 = s_ex_reg1_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:109:17
            // s_ex_src1.write((int32)(0x0));
            2'h1: tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3 = 32'h00000000;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:105:17
            // s_ex_src1.write(r_ex_pc.read());
            2'h2: tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3 = r_ex_pc_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex_src1_D_ACT_wire = tmp_codasip_conv_mux_s_ex_src1_D_ACT_wire_3;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:117:17
    // codasip_tmp_var_3.write(r_ex_alusrc2.read());
    assign codasip_tmp_var_3 = r_ex_alusrc2_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:124:17
    always @(*) begin
        case ( codasip_tmp_var_3 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:120:17
            // s_ex_src2.write(s_ex_reg2.read());
            1'b0: tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4 = s_ex_reg2_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:124:17
            // s_ex_src2.write(r_ex_immed.read());
            1'b1: tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4 = r_ex_immed_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex_src2_D_ACT_wire = tmp_codasip_conv_mux_s_ex_src2_D_ACT_wire_4;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:146:17
    // codasip_tmp_var_4.write(r_ex_aluop.read());
    assign codasip_tmp_var_4 = r_ex_aluop_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:189:17
    always @(*) begin
        case ( codasip_tmp_var_4 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:149:17
            // s_ex_alu.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = 32'h00000000;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:153:17
            // s_ex_alu.write(s_ex_src1.read() + s_ex_src2.read());
            4'h1: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = (s_ex_src1_Q + s_ex_src2_Q);
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:157:17
            // s_ex_alu.write(s_ex_src1.read() - s_ex_src2.read());
            4'h2: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = (s_ex_src1_Q - s_ex_src2_Q);
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:161:17
            // s_ex_alu.write(s_ex_src1.read() & s_ex_src2.read());
            4'h3: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = (s_ex_src1_Q & s_ex_src2_Q);
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:165:17
            // s_ex_alu.write(s_ex_src1.read() | s_ex_src2.read());
            4'h4: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = (s_ex_src1_Q | s_ex_src2_Q);
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:169:17
            // s_ex_alu.write(s_ex_src1.read() ^ s_ex_src2.read());
            4'h5: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = (s_ex_src1_Q ^ s_ex_src2_Q);
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:173:17
            // s_ex_alu.write(s_ex_src1.read() << ((int5)(s_ex_src2.read())));
            4'h6: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = (s_ex_src1_Q << $signed(s_ex_src2_Q[4:0]));
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:177:17
            // s_ex_alu.write(s_ex_src1.read() >> ((int5)(s_ex_src2.read())));
            4'h7: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = (s_ex_src1_Q >> $signed(s_ex_src2_Q[4:0]));
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:181:17
            // s_ex_alu.write(((int32)(s_ex_src1.read())) >> ((int5)(s_ex_src2.read())));
            4'h8: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = $unsigned(($signed(s_ex_src1_Q) >>> $signed(s_ex_src2_Q[4:0])));
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:185:17
            // s_ex_alu.write(((int32)(s_ex_src1.read())) < ((int32)(s_ex_src2.read())));
            4'h9: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = {{31{1'b0}}, ($signed(s_ex_src1_Q) < $signed(s_ex_src2_Q))};
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:189:17
            // s_ex_alu.write((s_ex_src1.read() < s_ex_src2.read()));
            4'ha: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = {{31{1'b0}}, (s_ex_src1_Q < s_ex_src2_Q)};
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex_alu_D_ACT_wire = tmp_codasip_conv_mux_s_ex_alu_D_ACT_wire_5;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:206:17
    // codasip_tmp_var_5.write(r_ex_brnch_sel.read());
    assign codasip_tmp_var_5 = r_ex_brnch_sel_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:213:17
    always @(*) begin
        case ( codasip_tmp_var_5 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:213:17
            // s_ex_bradd.write(s_ex_alu.read());
            1'b0: tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6 = s_ex_alu_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:209:17
            // s_ex_bradd.write(s_ex_brimm.read());
            1'b1: tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6 = s_ex_brimm_Q;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_ex_bradd_D_ACT_wire = tmp_codasip_conv_mux_s_ex_bradd_D_ACT_wire_6;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:200:18
    // ex_memory();
    assign ex_memory_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:233:18
    // ex_output();
    assign ex_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:189:17
    assign s_ex_alu_D = (ACT == 1'b1) ? s_ex_alu_D_ACT_wire : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:213:17
    assign s_ex_bradd_D = (ACT == 1'b1) ? s_ex_bradd_D_ACT_wire : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:198:9
    // s_ex_brimm.write(r_ex_immed.read() + r_ex_pc.read());
    assign s_ex_brimm_D = (ACT == 1'b1) ? (r_ex_immed_Q + r_ex_pc_Q) : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:44:9
    // s_ex_fwdA_sel.write(((((r_me_rd.read() == r_ex_rs1.read()) && (r_me_rd.read() != (uint5)(0))  ...
    assign s_ex_fwdA_sel_D = (ACT == 1'b1) ? (((((r_me_rd_Q == r_ex_rs1_Q) && (r_me_rd_Q != 5'h00)) && r_me_regwrite_Q)) ? 2'h1 : (((((r_wb_rd_Q == r_ex_rs1_Q) && (r_wb_rd_Q != 5'h00)) && r_wb_regwrite_Q)) ? 2'h2 : 2'h0)) : 2'h0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:47:9
    // s_ex_fwdB_sel.write(((((r_me_rd.read() == r_ex_rs2.read()) && (r_me_rd.read() != (uint5)(0))  ...
    assign s_ex_fwdB_sel_D = (ACT == 1'b1) ? (((((r_me_rd_Q == r_ex_rs2_Q) && (r_me_rd_Q != 5'h00)) && r_me_regwrite_Q)) ? 2'h1 : (((((r_wb_rd_Q == r_ex_rs2_Q) && (r_wb_rd_Q != 5'h00)) && r_wb_regwrite_Q)) ? 2'h2 : 2'h0)) : 2'h0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:137:9
    // s_ex_pcsrc.write((r_ex_branchop.read() == (uint3)(0x5)) || (r_ex_branchop.read() == (uint3)(0 ...
    assign s_ex_pcsrc_D = (ACT == 1'b1) ? (((r_ex_branchop_Q == 3'h5) || ((r_ex_branchop_Q == 3'h7) && s_ex_xor_Q)) || ((r_ex_branchop_Q == 3'h6) && (!s_ex_xor_Q))) : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:66:17
    assign s_ex_reg1_D = (ACT == 1'b1) ? s_ex_reg1_D_ACT_wire : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:90:17
    assign s_ex_reg2_D = (ACT == 1'b1) ? s_ex_reg2_D_ACT_wire : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:109:17
    assign s_ex_src1_D = (ACT == 1'b1) ? s_ex_src1_D_ACT_wire : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:124:17
    assign s_ex_src2_D = (ACT == 1'b1) ? s_ex_src2_D_ACT_wire : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:136:9
    // s_ex_xor.write(!((s_ex_reg1.read() ^ s_ex_reg2.read()) != (uint32)(0)));
    assign s_ex_xor_D = (ACT == 1'b1) ? (!((s_ex_reg1_Q ^ s_ex_reg2_Q) != 32'h00000000)) : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:197:9
    // s_ex_zero.write((s_ex_alu.read() == (uint32)(0)));
    assign s_ex_zero_D = (ACT == 1'b1) ? (s_ex_alu_Q == 32'h00000000) : 1'b0;
endmodule // riscv_core_ex_t
