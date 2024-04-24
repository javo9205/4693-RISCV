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
 *  \brief   Contains module definition of the 'me1_stage_t' functional unit.
 */

module me1_stage_t(
    input  wire ACT,
    input  wire [2:0] r_me1_branchop_Q,
    input  wire r_me1_zero_Q,
    output wire me1_memory_ACT,
    output wire me1_output_ACT,
    output wire s_me1_pcsrc_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [2:0] codasip_tmp_var_0;
    // signal/wire
    wire s_me1_pcsrc_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:104:16
    // codasip_tmp_var_0.write(r_me1_branchop.read());
    assign codasip_tmp_var_0 = r_me1_branchop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:116:17
    always @(*) begin
        case ( codasip_tmp_var_0 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:116:17
            // s_me1_pcsrc.write((bool)(0));
            3'h0: tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:116:17
            // s_me1_pcsrc.write((bool)(0));
            3'h1: tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:107:37
            // s_me1_pcsrc.write(!r_me1_zero.read());
            3'h2: tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1 = (!r_me1_zero_Q);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:106:36
            // s_me1_pcsrc.write(r_me1_zero.read());
            3'h3: tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1 = r_me1_zero_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:116:17
            // s_me1_pcsrc.write((bool)(0));
            3'h4: tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:116:17
            // s_me1_pcsrc.write((bool)(0));
            3'h5: tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:116:17
            // s_me1_pcsrc.write((bool)(0));
            3'h6: tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:116:17
            // s_me1_pcsrc.write((bool)(0));
            3'h7: tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1 = 1'b0;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1 = 1'bx;
            // pragma translate_on
        endcase
    end
    assign s_me1_pcsrc_D_ACT_wire = tmp_codasip_conv_mux_s_me1_pcsrc_D_ACT_wire_1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:123:19
    // me1_memory();
    assign me1_memory_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:124:19
    // me1_output();
    assign me1_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:116:17
    assign s_me1_pcsrc_D = (ACT == 1'b1) ? s_me1_pcsrc_D_ACT_wire : 1'b0;
endmodule // me1_stage_t
