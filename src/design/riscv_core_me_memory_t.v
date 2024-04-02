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
 *  \brief   Contains module definition of the 'riscv_core_me_memory_t' functional unit.
 */

module riscv_core_me_memory_t(
    input  wire ACT,
    input  wire [31:0] ldst_HRDATA,
    input  wire ldst_HREADY,
    input  wire ldst_HRESP,
    input  wire [1:0] r_me_alu_Q,
    input  wire [3:0] r_me_memop_Q,
    input  wire [31:0] r_me_wtdat_Q,
    input  wire [31:0] s_me_decoded_Q,
    output wire [31:0] ldst_HWDATA,
    output wire [31:0] s_me_decoded_D,
    output wire [31:0] s_me_memdat_D,
    output wire s_me_stall_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [31:0] codasip_tmp_var_0;
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire [1:0] codasip_tmp_var_2;
    // signal/wire
    wire [3:0] codasip_tmp_var_3;
    // signal/wire
    wire data_ready_B0;
    // signal/wire
    wire data_response_B0;
    // signal/wire
    wire [31:0] load_data_temp_B0;
    // signal/wire
    wire [31:0] s_me_memdat_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1;
    wire signed [31:0] tmp_codasip_conv_STATICST_127_2;
    wire signed [31:0] tmp_codasip_conv_STATICST_152_3;

    // conversions for data-path:
    assign tmp_codasip_conv_STATICST_127_2 = $signed(s_me_decoded_Q[7:0]);
    assign tmp_codasip_conv_STATICST_152_3 = $signed(s_me_decoded_Q[15:0]);
    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:84:24
    // codasip_tmp_var_1.write((bool)(r_me_memop.read() == (uint4)(0)));
    assign codasip_tmp_var_1 = (r_me_memop_Q == 4'h0);
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:92:13
    assign data_ready_B0 =
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:86:13
        // data_ready.write((bool)(1));
        codasip_tmp_var_1 ? 1'b1 :
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:92:13
        // ldst.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me_wtdat.read() ...
        ldst_HREADY;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:92:13
    assign data_response_B0 =
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:87:13
        // data_response.write((bool)(0));
        codasip_tmp_var_1 ? 1'b0 :
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:92:13
        // ldst.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me_wtdat.read() ...
        ldst_HRESP;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:92:13
    assign load_data_temp_B0 =
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:88:13
        // load_data_temp.write((int32)(0x0));
        codasip_tmp_var_1 ? 32'h00000000 :
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:92:13
        // ldst.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me_wtdat.read() ...
        ldst_HRDATA;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:93:61
    // codasip_tmp_var_2.write(((uint2)(r_me_alu.read())));
    assign codasip_tmp_var_2 = (!codasip_tmp_var_1) ? r_me_alu_Q : 2'h0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:93:45
    assign codasip_tmp_var_0 =
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:93:45
        // codasip_tmp_var_0.write((uint24)(0) :: (load_data_temp.read())[31 .. 24]);
        (codasip_tmp_var_2 == 2'h3) ? {24'h000000, load_data_temp_B0[31:24]} :
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:93:45
        // codasip_tmp_var_0.write((load_data_temp.read()));
        ((codasip_tmp_var_2 == 2'h0) && (!codasip_tmp_var_1)) ? load_data_temp_B0 :
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:93:45
        // codasip_tmp_var_0.write((uint8)(0) :: (load_data_temp.read())[31 .. 8]);
        (codasip_tmp_var_2 == 2'h1) ? {8'h00, load_data_temp_B0[31:8]} :
        // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:93:45
        // codasip_tmp_var_0.write((uint16)(0) :: (load_data_temp.read())[31 .. 16]);
        (codasip_tmp_var_2 == 2'h2) ? {16'h0000, load_data_temp_B0[31:16]} : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:96:17
    // codasip_tmp_var_3.write(r_me_memop.read());
    assign codasip_tmp_var_3 = r_me_memop_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:111:17
    always @(*) begin
        case ( codasip_tmp_var_3 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:99:17
            // s_me_memdat.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = 32'h00000000;
            // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:102:26
            // s_me_memdat.write((int32)(((int8)((s_me_decoded.read())))));
            4'h1: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = $unsigned(tmp_codasip_conv_STATICST_127_2);
            // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:103:27
            // s_me_memdat.write((uint32)(((uint8)((s_me_decoded.read())))));
            4'h2: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = {{24{1'b0}}, s_me_decoded_Q[7:0]};
            // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:104:26
            // s_me_memdat.write((int32)(((int16)((s_me_decoded.read())))));
            4'h3: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = $unsigned(tmp_codasip_conv_STATICST_152_3);
            // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:105:27
            // s_me_memdat.write((uint32)(((uint16)((s_me_decoded.read())))));
            4'h4: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = {{16{1'b0}}, s_me_decoded_Q[15:0]};
            // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:106:26
            // s_me_memdat.write((s_me_decoded.read()));
            4'h5: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = s_me_decoded_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:111:17
            // s_me_memdat.write((int32)(0x0));
            4'h6: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = 32'h00000000;
            // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:111:17
            // s_me_memdat.write((int32)(0x0));
            4'h7: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = 32'h00000000;
            // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:111:17
            // s_me_memdat.write((int32)(0x0));
            4'h8: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = 32'h00000000;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_me_memdat_D_ACT_wire = tmp_codasip_conv_mux_s_me_memdat_D_ACT_wire_1;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:92:13
    // ldst.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me_wtdat.read());
    assign ldst_HWDATA = r_me_wtdat_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:93:13
    // s_me_decoded.write(codasip_tmp_var_0.read());
    assign s_me_decoded_D = ((ACT == 1'b1) && (!codasip_tmp_var_1)) ? codasip_tmp_var_0 : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:111:17
    assign s_me_memdat_D = (ACT == 1'b1) ? s_me_memdat_D_ACT_wire : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe4_me.codal:123:9
    // s_me_stall.write(!(data_ready.read() || data_response.read()));
    assign s_me_stall_D = (ACT == 1'b1) ? (!(data_ready_B0 || data_response_B0)) : 1'b0;
endmodule // riscv_core_me_memory_t
