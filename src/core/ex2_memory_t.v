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
 *  \brief   Contains module definition of the 'ex2_memory_t' functional unit.
 */

module ex2_memory_t(
    input  wire ACT,
    input  wire [3:0] r_ex2_memop_Q,
    input  wire [31:0] s_ex2_alu_Q,
    input  wire [1:0] s_ex2_memsize_Q,
    input  wire [31:0] s_ex2_reg2_Q,
    input  wire s_ex2_stall_Q,
    output wire [31:0] ldst2_ahb_HADDR,
    output wire [2:0] ldst2_ahb_HBURST,
    output wire ldst2_ahb_HMASTLOCK,
    output wire [3:0] ldst2_ahb_HPROT,
    output wire [2:0] ldst2_ahb_HSIZE,
    output wire [1:0] ldst2_ahb_HTRANS,
    output wire ldst2_ahb_HWRITE,
    output wire [31:0] s_ex2_encoded_D,
    output wire [1:0] s_ex2_memsize_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [31:0] codasip_tmp_var_0;
    // signal/wire
    wire [3:0] codasip_tmp_var_1;
    // signal/wire
    wire [1:0] codasip_tmp_var_2;
    // signal/wire
    wire op_rw_B0;
    // signal/wire
    wire [1:0] op_type_B0;
    // signal/wire
    wire [1:0] s_ex2_memsize_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [1:0] tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1;
    // temporary variable for multiplexer, should not be synthesized as register
    reg tmp_codasip_conv_mux_op_rw_B0_D_2;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [1:0] tmp_codasip_conv_mux_op_type_B0_D_3;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_codasip_tmp_var_0_D_4;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:456:29
    // codasip_tmp_var_1.write(((s_ex2_stall.read()) ? ((uint4)(0x0)) : (r_ex2_memop.read())));
    assign codasip_tmp_var_1 = ((s_ex2_stall_Q) ? 4'h0 : r_ex2_memop_Q);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:507:17
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:459:17
            // s_ex2_memsize.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:495:17
            // s_ex2_memsize.write((uint3)(0x0));
            4'h1: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:501:17
            // s_ex2_memsize.write((uint3)(0x1));
            4'h2: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'h1;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:507:17
            // s_ex2_memsize.write((uint3)(0x2));
            4'h3: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'h2;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:465:17
            // s_ex2_memsize.write((uint3)(0x0));
            4'h9: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:471:17
            // s_ex2_memsize.write((uint3)(0x0));
            4'ha: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:477:17
            // s_ex2_memsize.write((uint3)(0x1));
            4'hb: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'h1;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:483:17
            // s_ex2_memsize.write((uint3)(0x1));
            4'hc: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'h1;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:489:17
            // s_ex2_memsize.write((uint3)(0x2));
            4'hd: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'h2;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1 = 2'bxx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex2_memsize_D_ACT_wire = tmp_codasip_conv_mux_s_ex2_memsize_D_ACT_wire_1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:508:17
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:460:17
            // op_rw.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:496:17
            // op_rw.write((uint1)(0x1));
            4'h1: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b1;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:502:17
            // op_rw.write((uint1)(0x1));
            4'h2: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b1;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:508:17
            // op_rw.write((uint1)(0x1));
            4'h3: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b1;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:466:17
            // op_rw.write((uint1)(0x0));
            4'h9: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:472:17
            // op_rw.write((uint1)(0x0));
            4'ha: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:478:17
            // op_rw.write((uint1)(0x0));
            4'hb: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:484:17
            // op_rw.write((uint1)(0x0));
            4'hc: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:490:17
            // op_rw.write((uint1)(0x0));
            4'hd: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'bx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign op_rw_B0 = tmp_codasip_conv_mux_op_rw_B0_D_2;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:509:17
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:461:17
            // op_type.write((uint2)(0x0));
            4'h0: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h0;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:497:17
            // op_type.write((uint2)(0x2));
            4'h1: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:503:17
            // op_type.write((uint2)(0x2));
            4'h2: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:509:17
            // op_type.write((uint2)(0x2));
            4'h3: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:467:17
            // op_type.write((uint2)(0x2));
            4'h9: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:473:17
            // op_type.write((uint2)(0x2));
            4'ha: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:479:17
            // op_type.write((uint2)(0x2));
            4'hb: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:485:17
            // op_type.write((uint2)(0x2));
            4'hc: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:491:17
            // op_type.write((uint2)(0x2));
            4'hd: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'bxx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign op_type_B0 = tmp_codasip_conv_mux_op_type_B0_D_3;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:518:59
    // codasip_tmp_var_2.write(((uint2)(s_ex2_alu.read())));
    assign codasip_tmp_var_2 = s_ex2_alu_Q[1:0];
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:518:47
    always @(*) begin
        case ( codasip_tmp_var_2 )
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:518:47
            // codasip_tmp_var_0.write((s_ex2_reg2.read()));
            2'h0: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = s_ex2_reg2_Q;
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:518:47
            // codasip_tmp_var_0.write((s_ex2_reg2.read())[23 .. 0] :: (uint8)(0));
            2'h1: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = {s_ex2_reg2_Q[23:0], 8'h00};
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:518:47
            // codasip_tmp_var_0.write((s_ex2_reg2.read())[15 .. 0] :: (uint16)(0));
            2'h2: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = {s_ex2_reg2_Q[15:0], 16'h0000};
            // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:518:47
            // codasip_tmp_var_0.write((s_ex2_reg2.read())[7 .. 0] :: (uint24)(0));
            2'h3: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = {s_ex2_reg2_Q[7:0], 24'h000000};
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign codasip_tmp_var_0 = tmp_codasip_conv_mux_codasip_tmp_var_0_D_4;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:517:9
    // ldst2_ahb.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex2_alu.read(), s_ex2_memsi ...
    assign ldst2_ahb_HADDR = s_ex2_alu_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:517:9
    // ldst2_ahb.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex2_alu.read(), s_ex2_memsi ...
    assign ldst2_ahb_HBURST = 3'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:517:9
    // ldst2_ahb.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex2_alu.read(), s_ex2_memsi ...
    assign ldst2_ahb_HMASTLOCK = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:517:9
    // ldst2_ahb.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex2_alu.read(), s_ex2_memsi ...
    assign ldst2_ahb_HPROT = 4'h3;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:517:9
    // ldst2_ahb.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex2_alu.read(), s_ex2_memsi ...
    assign ldst2_ahb_HSIZE = {{1{1'b0}}, s_ex2_memsize_Q};
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:517:9
    // ldst2_ahb.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex2_alu.read(), s_ex2_memsi ...
    assign ldst2_ahb_HTRANS = (ACT == 1'b1) ? op_type_B0 : 2'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:517:9
    // ldst2_ahb.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex2_alu.read(), s_ex2_memsi ...
    assign ldst2_ahb_HWRITE = op_rw_B0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:518:9
    // s_ex2_encoded.write(codasip_tmp_var_0.read());
    assign s_ex2_encoded_D = (ACT == 1'b1) ? codasip_tmp_var_0 : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:507:17
    assign s_ex2_memsize_D = (ACT == 1'b1) ? s_ex2_memsize_D_ACT_wire : 2'h0;
endmodule // ex2_memory_t
