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
 *  \brief   Contains module definition of the 'if_stage_t' functional unit.
 */

module if_stage_t(
    input  wire ACT,
    input  wire r_id_clear_Q,
    input  wire [31:0] r_pc_Q,
    input  wire [31:0] s_ex_bradd_Q,
    input  wire s_ex_pcsrc_Q,
    input  wire [31:0] s_id_bradd_Q,
    input  wire s_id_fetch_order_Q,
    input  wire s_id_pcsrc_Q,
    input  wire s_id_stallA_Q,
    input  wire s_id_stallB_Q,
    input  wire [31:0] s_if_nextpc_Q,
    input  wire [31:0] s_if_pc1_Q,
    input  wire [31:0] s_if_pc2_Q,
    input  wire [31:0] s_if_pcB_Q,
    input  wire [31:0] s_me_bradd_Q,
    input  wire s_me_pcsrc_Q,
    output wire [31:0] if1_ahb_HADDR,
    output wire [2:0] if1_ahb_HBURST,
    output wire if1_ahb_HMASTLOCK,
    output wire [3:0] if1_ahb_HPROT,
    output wire [2:0] if1_ahb_HSIZE,
    output wire [1:0] if1_ahb_HTRANS,
    output wire if1_ahb_HWRITE,
    output wire [31:0] if2_ahb_HADDR,
    output wire [2:0] if2_ahb_HBURST,
    output wire if2_ahb_HMASTLOCK,
    output wire [3:0] if2_ahb_HPROT,
    output wire [2:0] if2_ahb_HSIZE,
    output wire [1:0] if2_ahb_HTRANS,
    output wire if2_ahb_HWRITE,
    output wire if_output_ACT,
    output wire s_if_jump_D,
    output wire [31:0] s_if_nextpc_D,
    output wire [31:0] s_if_pc1_D,
    output wire [31:0] s_if_pc2_D,
    output wire [31:0] s_if_pcB_D,
    output wire [31:0] s_if_pcin_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire codasip_tmp_var_0;
    // signal/wire
    wire [31:0] s_if_pc1_D_ACT_wire;
    // signal/wire
    wire [31:0] s_if_pc2_D_ACT_wire;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:44:30
    // codasip_tmp_var_0.write((uint1)(s_id_fetch_order.read() & ~r_id_clear.read()));
    assign codasip_tmp_var_0 = (s_id_fetch_order_Q & (~r_id_clear_Q));
    assign s_if_pc1_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:46:13
        // s_if_pc1.write(s_if_pcB.read());
        codasip_tmp_var_0 ? s_if_pcB_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:51:13
        // s_if_pc1.write(r_pc.read());
        r_pc_Q;
    assign s_if_pc2_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:47:13
        // s_if_pc2.write(r_pc.read());
        codasip_tmp_var_0 ? r_pc_Q :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:52:13
        // s_if_pc2.write(s_if_pcB.read());
        s_if_pcB_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:56:9
    // if1_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc1.read(), (uint3)(0x2), 3, ...
    assign if1_ahb_HADDR = s_if_pc1_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:56:9
    // if1_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc1.read(), (uint3)(0x2), 3, ...
    assign if1_ahb_HBURST = 3'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:56:9
    // if1_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc1.read(), (uint3)(0x2), 3, ...
    assign if1_ahb_HMASTLOCK = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:56:9
    // if1_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc1.read(), (uint3)(0x2), 3, ...
    assign if1_ahb_HPROT = 4'h3;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:56:9
    // if1_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc1.read(), (uint3)(0x2), 3, ...
    assign if1_ahb_HSIZE = 3'h2;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:56:9
    // if1_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc1.read(), (uint3)(0x2), 3, ...
    assign if1_ahb_HTRANS = (ACT == 1'b1) ? 2'h2 : 2'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:56:9
    // if1_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc1.read(), (uint3)(0x2), 3, ...
    assign if1_ahb_HWRITE = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:57:9
    // if2_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc2.read(), (uint3)(0x2), 3, ...
    assign if2_ahb_HADDR = s_if_pc2_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:57:9
    // if2_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc2.read(), (uint3)(0x2), 3, ...
    assign if2_ahb_HBURST = 3'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:57:9
    // if2_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc2.read(), (uint3)(0x2), 3, ...
    assign if2_ahb_HMASTLOCK = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:57:9
    // if2_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc2.read(), (uint3)(0x2), 3, ...
    assign if2_ahb_HPROT = 4'h3;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:57:9
    // if2_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc2.read(), (uint3)(0x2), 3, ...
    assign if2_ahb_HSIZE = 3'h2;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:57:9
    // if2_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc2.read(), (uint3)(0x2), 3, ...
    assign if2_ahb_HTRANS = (ACT == 1'b1) ? 2'h2 : 2'h0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:57:9
    // if2_ahb.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), s_if_pc2.read(), (uint3)(0x2), 3, ...
    assign if2_ahb_HWRITE = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:79:18
    // if_output();
    assign if_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:70:9
    // s_if_jump.write(s_me_pcsrc.read() | s_ex_pcsrc.read() | (s_id_pcsrc.read() & ~s_id_stallA.rea ...
    assign s_if_jump_D = (ACT == 1'b1) ? ((s_me_pcsrc_Q | s_ex_pcsrc_Q) | (s_id_pcsrc_Q & (~s_id_stallA_Q))) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:60:9
    // s_if_nextpc.write(r_pc.read() + (uint32)(0x8));
    assign s_if_nextpc_D = (ACT == 1'b1) ? (r_pc_Q + 32'h00000008) : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:51:13
    assign s_if_pc1_D = (ACT == 1'b1) ? s_if_pc1_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:52:13
    assign s_if_pc2_D = (ACT == 1'b1) ? s_if_pc2_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:41:9
    // s_if_pcB.write(r_pc.read() + (uint32)(0x4));
    assign s_if_pcB_D = (ACT == 1'b1) ? (r_pc_Q + 32'h00000004) : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe1_if.codal:63:9
    // s_if_pcin.write((((s_me_pcsrc.read())) ? (s_me_bradd.read()) : ((((s_ex_pcsrc.read())) ? (s_e ...
    assign s_if_pcin_D = (ACT == 1'b1) ? ((s_me_pcsrc_Q) ? s_me_bradd_Q : ((s_ex_pcsrc_Q) ? s_ex_bradd_Q : ((s_id_stallA_Q) ? r_pc_Q : ((s_id_pcsrc_Q) ? s_id_bradd_Q : ((s_id_stallB_Q) ? s_if_pcB_Q : s_if_nextpc_Q))))) : 32'h00000000;
endmodule // if_stage_t
