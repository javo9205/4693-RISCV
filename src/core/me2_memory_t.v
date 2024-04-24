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
 *  \brief   Contains module definition of the 'me2_memory_t' functional unit.
 */

module me2_memory_t(
    input  wire ACT,
    input  wire [31:0] ldst2_ahb_HRDATA,
    input  wire ldst2_ahb_HREADY,
    input  wire ldst2_ahb_HRESP,
    input  wire [1:0] r_me2_alu_Q,
    input  wire [3:0] r_me2_memop_Q,
    input  wire [31:0] r_me2_wtdat_Q,
    input  wire [31:0] s_me2_decoded_Q,
    output wire [31:0] ldst2_ahb_HWDATA,
    output wire [31:0] s_me2_decoded_D,
    output wire [31:0] s_me2_memdat_D,
    output wire s_me2_memhaz_D
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
    wire [31:0] s_me2_memdat_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_127_2;
    wire signed [31:0] tmp_codasip_conv_STATIC_CAST_152_3;

    // conversions for data-path:
    assign tmp_codasip_conv_STATIC_CAST_127_2 = $signed(s_me2_decoded_Q[7:0]);
    assign tmp_codasip_conv_STATIC_CAST_152_3 = $signed(s_me2_decoded_Q[15:0]);
    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:240:25
    // codasip_tmp_var_1.write((bool)(r_me2_memop.read() == (uint4)(0)));
    assign codasip_tmp_var_1 = (r_me2_memop_Q == 4'h0);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:248:13
    assign data_ready_B0 =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:242:13
        // data_ready.write((bool)(1));
        codasip_tmp_var_1 ? 1'b1 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:248:13
        // ldst2_ahb.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me2_wtdat. ...
        ldst2_ahb_HREADY;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:248:13
    assign data_response_B0 =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:243:13
        // data_response.write((bool)(0));
        codasip_tmp_var_1 ? 1'b0 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:248:13
        // ldst2_ahb.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me2_wtdat. ...
        ldst2_ahb_HRESP;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:248:13
    assign load_data_temp_B0 =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:244:13
        // load_data_temp.write((int32)(0x0));
        codasip_tmp_var_1 ? 32'h00000000 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:248:13
        // ldst2_ahb.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me2_wtdat. ...
        ldst2_ahb_HRDATA;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:249:67
    // codasip_tmp_var_2.write(((uint2)(r_me2_alu.read())));
    assign codasip_tmp_var_2 = (!codasip_tmp_var_1) ? r_me2_alu_Q : 2'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:249:51
    assign codasip_tmp_var_0 =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:249:51
        // codasip_tmp_var_0.write((uint24)(0) :: (load_data_temp.read())[31 .. 24]);
        (codasip_tmp_var_2 == 2'h3) ? {24'h000000, load_data_temp_B0[31:24]} :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:249:51
        // codasip_tmp_var_0.write((load_data_temp.read()));
        ((codasip_tmp_var_2 == 2'h0) && (!codasip_tmp_var_1)) ? load_data_temp_B0 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:249:51
        // codasip_tmp_var_0.write((uint8)(0) :: (load_data_temp.read())[31 .. 8]);
        (codasip_tmp_var_2 == 2'h1) ? {8'h00, load_data_temp_B0[31:8]} :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:249:51
        // codasip_tmp_var_0.write((uint16)(0) :: (load_data_temp.read())[31 .. 16]);
        (codasip_tmp_var_2 == 2'h2) ? {16'h0000, load_data_temp_B0[31:16]} : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:252:17
    // codasip_tmp_var_3.write(r_me2_memop.read());
    assign codasip_tmp_var_3 = r_me2_memop_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:267:17
    always @(*) begin
        case ( codasip_tmp_var_3 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:255:17
            // s_me2_memdat.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = 32'h00000000;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:267:17
            // s_me2_memdat.write((int32)(0x0));
            4'h1: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = 32'h00000000;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:267:17
            // s_me2_memdat.write((int32)(0x0));
            4'h2: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = 32'h00000000;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:267:17
            // s_me2_memdat.write((int32)(0x0));
            4'h3: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = 32'h00000000;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:258:26
            // s_me2_memdat.write((int32)(((int8)((s_me2_decoded.read())))));
            4'h9: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = $unsigned(tmp_codasip_conv_STATIC_CAST_127_2);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:259:27
            // s_me2_memdat.write((uint32)(((uint8)((s_me2_decoded.read())))));
            4'ha: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = {{24{1'b0}}, s_me2_decoded_Q[7:0]};
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:260:26
            // s_me2_memdat.write((int32)(((int16)((s_me2_decoded.read())))));
            4'hb: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = $unsigned(tmp_codasip_conv_STATIC_CAST_152_3);
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:261:27
            // s_me2_memdat.write((uint32)(((uint16)((s_me2_decoded.read())))));
            4'hc: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = {{16{1'b0}}, s_me2_decoded_Q[15:0]};
            // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:262:26
            // s_me2_memdat.write((s_me2_decoded.read()));
            4'hd: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = s_me2_decoded_Q;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1 = 32'hx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_me2_memdat_D_ACT_wire = tmp_codasip_conv_mux_s_me2_memdat_D_ACT_wire_1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:248:13
    // ldst2_ahb.transport((uint3)(0x1), data_ready, data_response, load_data_temp, r_me2_wtdat.read ...
    assign ldst2_ahb_HWDATA = r_me2_wtdat_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:249:13
    // s_me2_decoded.write(codasip_tmp_var_0.read());
    assign s_me2_decoded_D = ((ACT == 1'b1) && (!codasip_tmp_var_1)) ? codasip_tmp_var_0 : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:267:17
    assign s_me2_memdat_D = (ACT == 1'b1) ? s_me2_memdat_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe4_me.codal:279:9
    // s_me2_memhaz.write(!(data_ready.read() || data_response.read()));
    assign s_me2_memhaz_D = (ACT == 1'b1) ? (!(data_ready_B0 || data_response_B0)) : 1'b0;
endmodule // me2_memory_t
