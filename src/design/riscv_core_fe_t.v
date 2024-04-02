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
 *  \brief   Contains module definition of the 'riscv_core_fe_t' functional unit.
 */

module riscv_core_fe_t(
    input  wire ACT,
    input  wire [31:0] r_me_bradd_Q,
    input  wire [31:0] r_pc_Q,
    input  wire [31:0] s_ex_bradd_Q,
    input  wire s_ex_pcsrc_Q,
    input  wire [31:0] s_id_bradd_Q,
    input  wire s_id_pcsrc_Q,
    input  wire s_id_stall_Q,
    input  wire [31:0] s_if_nextpc_Q,
    input  wire s_me_pcsrc_Q,
    output wire [31:0] if_code_HADDR,
    output wire [2:0] if_code_HBURST,
    output wire if_code_HMASTLOCK,
    output wire [3:0] if_code_HPROT,
    output wire [2:0] if_code_HSIZE,
    output wire [1:0] if_code_HTRANS,
    output wire if_code_HWRITE,
    output wire if_output_ACT,
    output wire s_ex_clear_D,
    output wire s_id_clear_D,
    output wire [31:0] s_if_nextpc_D,
    output wire [31:0] s_if_pcin_D,
    output wire s_if_stall_D,
    output wire s_me_clear_D,
    output wire s_wb_clear_D
);
    // data-path code:
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:41:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), r_pc.read(), (uint3)(0x2), 3, 0,  ...
    assign if_code_HADDR = r_pc_Q;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:41:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), r_pc.read(), (uint3)(0x2), 3, 0,  ...
    assign if_code_HBURST = 3'h0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:41:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), r_pc.read(), (uint3)(0x2), 3, 0,  ...
    assign if_code_HMASTLOCK = 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:41:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), r_pc.read(), (uint3)(0x2), 3, 0,  ...
    assign if_code_HPROT = 4'h3;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:41:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), r_pc.read(), (uint3)(0x2), 3, 0,  ...
    assign if_code_HSIZE = 3'h2;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:41:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), r_pc.read(), (uint3)(0x2), 3, 0,  ...
    assign if_code_HTRANS = (ACT == 1'b1) ? 2'h2 : 2'h0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:41:9
    // if_code.transport((uint3)(0x0), (uint2)(0x2), (uint1)(0x0), r_pc.read(), (uint3)(0x2), 3, 0,  ...
    assign if_code_HWRITE = 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:71:18
    // if_output();
    assign if_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:63:9
    // s_ex_clear.write(s_me_pcsrc.read() | s_ex_pcsrc.read() | s_id_stall.read());
    assign s_ex_clear_D = (ACT == 1'b1) ? ((s_me_pcsrc_Q | s_ex_pcsrc_Q) | s_id_stall_Q) : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:62:9
    // s_id_clear.write(s_me_pcsrc.read() | s_ex_pcsrc.read() | s_id_pcsrc.read());
    assign s_id_clear_D = (ACT == 1'b1) ? ((s_me_pcsrc_Q | s_ex_pcsrc_Q) | s_id_pcsrc_Q) : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:44:9
    // s_if_nextpc.write(r_pc.read() + (uint32)(0x4));
    assign s_if_nextpc_D = (ACT == 1'b1) ? (r_pc_Q + 32'h00000004) : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:47:9
    // s_if_pcin.write((((s_id_stall.read())) ? (r_pc.read()) : ((((s_me_pcsrc.read())) ? (r_me_brad ...
    assign s_if_pcin_D = (ACT == 1'b1) ? ((s_id_stall_Q) ? r_pc_Q : ((s_me_pcsrc_Q) ? r_me_bradd_Q : ((s_ex_pcsrc_Q) ? s_ex_bradd_Q : ((s_id_pcsrc_Q) ? s_id_bradd_Q : s_if_nextpc_Q)))) : 32'h00000000;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:68:9
    // s_if_stall.write((int32)(0x0));
    assign s_if_stall_D = 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:64:9
    // s_me_clear.write(s_me_pcsrc.read());
    assign s_me_clear_D = (ACT == 1'b1) ? s_me_pcsrc_Q : 1'b0;
    // /home/project/riscv/model/ca/pipelines/ca_pipe1_if.codal:65:9
    // s_wb_clear.write((int32)(0x0));
    assign s_wb_clear_D = 1'b0;
endmodule // riscv_core_fe_t
