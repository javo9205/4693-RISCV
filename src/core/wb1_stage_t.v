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
 *  \brief   Contains module definition of the 'wb1_stage_t' functional unit.
 */

module wb1_stage_t(
    input  wire ACT,
    input  wire [31:0] r_wb1_alu_Q,
    input  wire [31:0] r_wb1_memdat_Q,
    input  wire [31:0] r_wb1_pc_Q,
    input  wire [4:0] r_wb1_rd_Q,
    input  wire [1:0] r_wb1_rfwt_sel_Q,
    input  wire [31:0] s_wb1_nextpc_Q,
    input  wire [31:0] s_wb1_result_Q,
    input  wire s_wb1_wten_Q,
    output wire [31:0] rf_xpr_wrt0_D,
    output wire [4:0] rf_xpr_wrt0_WA,
    output wire rf_xpr_wrt0_WE,
    output wire [31:0] s_wb1_nextpc_D,
    output wire [31:0] s_wb1_result_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [1:0] codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire [31:0] s_wb1_result_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_wb1_result_D_ACT_wire_1;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:76:17
    // codasip_tmp_var_0.write(r_wb1_rfwt_sel.read());
    assign codasip_tmp_var_0 = r_wb1_rfwt_sel_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:81:22
    always @(*) begin
        case ( codasip_tmp_var_0 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:78:28
            // s_wb1_result.write(r_wb1_alu.read());
            2'h0: tmp_codasip_conv_mux_s_wb1_result_D_ACT_wire_1 = r_wb1_alu_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:79:27
            // s_wb1_result.write(s_wb1_nextpc.read());
            2'h1: tmp_codasip_conv_mux_s_wb1_result_D_ACT_wire_1 = s_wb1_nextpc_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:80:28
            // s_wb1_result.write(r_wb1_memdat.read());
            2'h2: tmp_codasip_conv_mux_s_wb1_result_D_ACT_wire_1 = r_wb1_memdat_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:81:22
            // s_wb1_result.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_wb1_result_D_ACT_wire_1 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_wb1_result_D_ACT_wire_1 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_wb1_result_D_ACT_wire = tmp_codasip_conv_mux_s_wb1_result_D_ACT_wire_1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:86:13
    // codasip_tmp_var_1.write((uint1)(s_wb1_wten.read()));
    assign codasip_tmp_var_1 = s_wb1_wten_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:88:13
    // rf_xpr.write(s_wb1_result.read(), r_wb1_rd.read(), (uint32)(0));
    assign rf_xpr_wrt0_D = s_wb1_result_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:88:13
    // rf_xpr.write(s_wb1_result.read(), r_wb1_rd.read(), (uint32)(0));
    assign rf_xpr_wrt0_WA = r_wb1_rd_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:88:13
    // rf_xpr.write(s_wb1_result.read(), r_wb1_rd.read(), (uint32)(0));
    assign rf_xpr_wrt0_WE = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:74:9
    // s_wb1_nextpc.write(r_wb1_pc.read() + (uint32)(0x4));
    assign s_wb1_nextpc_D = (ACT == 1'b1) ? (r_wb1_pc_Q + 32'h00000004) : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:81:22
    assign s_wb1_result_D = (ACT == 1'b1) ? s_wb1_result_D_ACT_wire : 32'h00000000;
endmodule // wb1_stage_t
