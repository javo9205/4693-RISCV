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
 *  \brief   Contains module definition of the 'riscv_core_wb_t' functional unit.
 */

module riscv_core_wb_t(
    input  wire ACT,
    input  wire [31:0] r_wb_alu_Q,
    input  wire [31:0] r_wb_memdat_Q,
    input  wire [31:0] r_wb_pc_Q,
    input  wire [4:0] r_wb_rd_Q,
    input  wire r_wb_regwrite_Q,
    input  wire [1:0] r_wb_rfwt_sel_Q,
    input  wire [31:0] s_wb_nextpc_Q,
    input  wire [31:0] s_wb_result_Q,
    output wire [31:0] rf_xpr_wrt0_D,
    output wire [4:0] rf_xpr_wrt0_WA,
    output wire rf_xpr_wrt0_WE,
    output wire [31:0] s_wb_nextpc_D,
    output wire [31:0] s_wb_result_D,
    output wire s_wb_stall_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [1:0] codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire [31:0] s_wb_result_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1;
    wire [63:0] tmp_codasip_conv_TERNARY_76_2;

    // conversions for data-path:
    assign tmp_codasip_conv_TERNARY_76_2 = $unsigned((((r_wb_rd_Q != 5'h00)) ? {{32{1'b0}}, s_wb_result_Q} : 64'h0000000000000000));
    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:40:17
    // codasip_tmp_var_0.write(r_wb_rfwt_sel.read());
    assign codasip_tmp_var_0 = r_wb_rfwt_sel_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:55:17
    always @(*) begin
        case ( codasip_tmp_var_0 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:43:17
            // s_wb_result.write(r_wb_alu.read());
            2'h0: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = r_wb_alu_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:47:17
            // s_wb_result.write(s_wb_nextpc.read());
            2'h1: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = s_wb_nextpc_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:51:17
            // s_wb_result.write(r_wb_memdat.read());
            2'h2: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = r_wb_memdat_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:55:17
            // s_wb_result.write((int32)(0x0));
            2'h3: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = 32'h00000000;
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign s_wb_result_D_ACT_wire = tmp_codasip_conv_mux_s_wb_result_D_ACT_wire_1;
    // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:60:13
    // codasip_tmp_var_1.write((uint1)(r_wb_regwrite.read()));
    assign codasip_tmp_var_1 = r_wb_regwrite_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:62:13
    // rf_xpr.write((((r_wb_rd.read() != (uint5)(0))) ? ((uint64)(s_wb_result.read())) : ((uint64)(0 ...
    assign rf_xpr_wrt0_D = tmp_codasip_conv_TERNARY_76_2[31:0];
    // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:62:13
    // rf_xpr.write((((r_wb_rd.read() != (uint5)(0))) ? ((uint64)(s_wb_result.read())) : ((uint64)(0 ...
    assign rf_xpr_wrt0_WA = r_wb_rd_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:62:13
    // rf_xpr.write((((r_wb_rd.read() != (uint5)(0))) ? ((uint64)(s_wb_result.read())) : ((uint64)(0 ...
    assign rf_xpr_wrt0_WE = ((ACT == 1'b1) && codasip_tmp_var_1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:38:9
    // s_wb_nextpc.write(r_wb_pc.read() + (uint32)(0x4));
    assign s_wb_nextpc_D = (ACT == 1'b1) ? (r_wb_pc_Q + 32'h00000004) : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:55:17
    assign s_wb_result_D = (ACT == 1'b1) ? s_wb_result_D_ACT_wire : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe5_wb.codal:67:9
    // s_wb_stall.write((int32)(0x0));
    assign s_wb_stall_D = 1'b0;
endmodule // riscv_core_wb_t
