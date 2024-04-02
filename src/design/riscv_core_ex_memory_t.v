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
 *  \brief   Contains module definition of the 'riscv_core_ex_memory_t' functional unit.
 */

module riscv_core_ex_memory_t(
    input  wire ACT,
    input  wire [3:0] r_ex_memop_Q,
    input  wire [31:0] s_ex_alu_Q,
    input  wire [1:0] s_ex_memsize_Q,
    input  wire [31:0] s_ex_reg2_Q,
    input  wire s_me_stall_Q,
    output wire [31:0] ldst_HADDR,
    output wire [2:0] ldst_HBURST,
    output wire ldst_HMASTLOCK,
    output wire [3:0] ldst_HPROT,
    output wire [2:0] ldst_HSIZE,
    output wire [1:0] ldst_HTRANS,
    output wire ldst_HWRITE,
    output wire [31:0] s_ex_encoded_D,
    output wire [1:0] s_ex_memsize_D,
    output wire s_ex_stall_D
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
    wire [1:0] s_ex_memsize_D_ACT_wire;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg [1:0] tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1;
    // temporary variable for multiplexer, should not be synthesized as register
    reg tmp_codasip_conv_mux_op_rw_B0_D_2;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [1:0] tmp_codasip_conv_mux_op_type_B0_D_3;
    // temporary variable for multiplexer, should not be synthesized as register
    reg [31:0] tmp_codasip_conv_mux_codasip_tmp_var_0_D_4;

    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:244:17
    // codasip_tmp_var_1.write(r_ex_memop.read());
    assign codasip_tmp_var_1 = r_ex_memop_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:295:17
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:247:17
            // s_ex_memsize.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:253:17
            // s_ex_memsize.write((uint3)(0x0));
            4'h1: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:259:17
            // s_ex_memsize.write((uint3)(0x0));
            4'h2: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:265:17
            // s_ex_memsize.write((uint3)(0x1));
            4'h3: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h1;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:271:17
            // s_ex_memsize.write((uint3)(0x1));
            4'h4: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h1;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:277:17
            // s_ex_memsize.write((uint3)(0x2));
            4'h5: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h2;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:283:17
            // s_ex_memsize.write((uint3)(0x0));
            4'h6: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:289:17
            // s_ex_memsize.write((uint3)(0x1));
            4'h7: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h1;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:295:17
            // s_ex_memsize.write((uint3)(0x2));
            4'h8: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'h2;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1 = 2'bxx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign s_ex_memsize_D_ACT_wire = tmp_codasip_conv_mux_s_ex_memsize_D_ACT_wire_1;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:296:17
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:248:17
            // op_rw.write((int32)(0x0));
            4'h0: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:254:17
            // op_rw.write((uint1)(0x0));
            4'h1: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:260:17
            // op_rw.write((uint1)(0x0));
            4'h2: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:266:17
            // op_rw.write((uint1)(0x0));
            4'h3: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:272:17
            // op_rw.write((uint1)(0x0));
            4'h4: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:278:17
            // op_rw.write((uint1)(0x0));
            4'h5: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:284:17
            // op_rw.write((uint1)(0x1));
            4'h6: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b1;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:290:17
            // op_rw.write((uint1)(0x1));
            4'h7: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b1;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:296:17
            // op_rw.write((uint1)(0x1));
            4'h8: tmp_codasip_conv_mux_op_rw_B0_D_2 = 1'b1;
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
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:297:17
    always @(*) begin
        case ( codasip_tmp_var_1 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:249:17
            // op_type.write((uint2)(0x0));
            4'h0: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h0;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:255:17
            // op_type.write((uint2)(0x2));
            4'h1: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:261:17
            // op_type.write((uint2)(0x2));
            4'h2: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:267:17
            // op_type.write((uint2)(0x2));
            4'h3: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:273:17
            // op_type.write((uint2)(0x2));
            4'h4: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:279:17
            // op_type.write((uint2)(0x2));
            4'h5: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:285:17
            // op_type.write((uint2)(0x2));
            4'h6: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:291:17
            // op_type.write((uint2)(0x2));
            4'h7: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:297:17
            // op_type.write((uint2)(0x2));
            4'h8: tmp_codasip_conv_mux_op_type_B0_D_3 = 2'h2;
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
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:306:52
    // codasip_tmp_var_2.write(((uint2)(s_ex_alu.read())));
    assign codasip_tmp_var_2 = s_ex_alu_Q[1:0];
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:306:41
    always @(*) begin
        case ( codasip_tmp_var_2 )
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:306:41
            // codasip_tmp_var_0.write((s_ex_reg2.read()));
            2'h0: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = s_ex_reg2_Q;
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:306:41
            // codasip_tmp_var_0.write((s_ex_reg2.read())[23 .. 0] :: (uint8)(0));
            2'h1: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = {s_ex_reg2_Q[23:0], 8'h00};
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:306:41
            // codasip_tmp_var_0.write((s_ex_reg2.read())[15 .. 0] :: (uint16)(0));
            2'h2: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = {s_ex_reg2_Q[15:0], 16'h0000};
            // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:306:41
            // codasip_tmp_var_0.write((s_ex_reg2.read())[7 .. 0] :: (uint24)(0));
            2'h3: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = {s_ex_reg2_Q[7:0], 24'h000000};
            // fully defined multiplexor (all 2-state values are used), default branch defined just for simulation purposes and HDL linter correctness
            // pragma translate_off
            default: tmp_codasip_conv_mux_codasip_tmp_var_0_D_4 = 32'hx;
            // pragma translate_on
        endcase
    end
    assign codasip_tmp_var_0 = tmp_codasip_conv_mux_codasip_tmp_var_0_D_4;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:305:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HADDR = s_ex_alu_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:305:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HBURST = 3'h0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:305:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HMASTLOCK = 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:305:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HPROT = 4'h3;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:305:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HSIZE = {1'b0, s_ex_memsize_Q};
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:305:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HTRANS = (ACT == 1'b1) ? op_type_B0 : 2'h0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:305:9
    // ldst.transport((uint3)(0x0), op_type.read(), op_rw.read(), s_ex_alu.read(), s_ex_memsize.read ...
    assign ldst_HWRITE = op_rw_B0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:306:9
    // s_ex_encoded.write(codasip_tmp_var_0.read());
    assign s_ex_encoded_D = (ACT == 1'b1) ? codasip_tmp_var_0 : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:295:17
    assign s_ex_memsize_D = (ACT == 1'b1) ? s_ex_memsize_D_ACT_wire : 2'h0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe3_ex.codal:307:9
    // s_ex_stall.write(s_me_stall.read());
    assign s_ex_stall_D = (ACT == 1'b1) ? s_me_stall_Q : 1'b0;
endmodule // riscv_core_ex_memory_t
