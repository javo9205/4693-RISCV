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
 *  \brief   Contains module definition of the 'ex_coordination_t' functional unit.
 */

module ex_coordination_t(
    input  wire ACT,
    input  wire [3:0] r_ex1_memop_Q,
    input  wire r_ex1_order_Q,
    input  wire r_ex1_valid_Q,
    input  wire [3:0] r_ex2_memop_Q,
    input  wire r_ex2_order_Q,
    input  wire r_ex2_valid_Q,
    input  wire [29:0] s_ex1_alu_Q,
    input  wire [31:0] s_ex1_bradd_Q,
    input  wire s_ex1_pcsrc_Q,
    input  wire s_ex1_stall_Q,
    input  wire s_ex1_sthaz_Q,
    input  wire [29:0] s_ex2_alu_Q,
    input  wire [31:0] s_ex2_bradd_Q,
    input  wire s_ex2_older_Q,
    input  wire s_ex2_pcsrc_Q,
    input  wire s_ex2_stall_Q,
    input  wire s_ex2_sthaz_Q,
    input  wire s_ex_same_addr_Q,
    input  wire s_me1_stall_Q,
    input  wire s_me2_stall_Q,
    output wire ex1_memory_ACT,
    output wire ex1_output_ACT,
    output wire ex2_memory_ACT,
    output wire ex2_output_ACT,
    output wire r_ex1_stall_D,
    output wire r_ex1_stall_WE,
    output wire r_ex2_stall_D,
    output wire r_ex2_stall_WE,
    output wire s_ex1_stall_D,
    output wire s_ex1_sthaz_D,
    output wire s_ex2_older_D,
    output wire s_ex2_stall_D,
    output wire s_ex2_sthaz_D,
    output wire [31:0] s_ex_bradd_D,
    output wire s_ex_pcsrc_D,
    output wire s_ex_same_addr_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire codasip_tmp_var_1;
    // signal/wire
    wire ex1_stall_B0;
    // signal/wire
    wire ex1_store_B0;
    // signal/wire
    wire ex2_stall_B0;
    // signal/wire
    wire ex2_store_B0;
    // signal/wire
    wire ignore_B0;
    // signal/wire
    wire [31:0] s_ex_bradd_D_ACT_wire;
    // signal/wire
    wire s_ex_pcsrc_D_ACT_wire;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:49:9
    // ex1_store.write((r_ex1_memop.read() == (uint4)(3)) || (r_ex1_memop.read() == (uint4)(2)) || ( ...
    assign ex1_store_B0 = (((r_ex1_memop_Q == 4'h3) || (r_ex1_memop_Q == 4'h2)) || (r_ex1_memop_Q == 4'h1));
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:50:9
    // ex2_store.write((r_ex2_memop.read() == (uint4)(3)) || (r_ex2_memop.read() == (uint4)(2)) || ( ...
    assign ex2_store_B0 = (((r_ex2_memop_Q == 4'h3) || (r_ex2_memop_Q == 4'h2)) || (r_ex2_memop_Q == 4'h1));
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:61:25
    // codasip_tmp_var_1.write((uint1)(s_ex1_pcsrc.read() & s_ex2_pcsrc.read()));
    assign codasip_tmp_var_1 = (s_ex1_pcsrc_Q & s_ex2_pcsrc_Q);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:75:9
    // ignore.write((int32)(0x0));
    assign ignore_B0 = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:76:9
    // ex1_stall.write(s_ex1_sthaz.read() | s_me1_stall.read());
    assign ex1_stall_B0 = (s_ex1_sthaz_Q | s_me1_stall_Q);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:77:9
    // ex2_stall.write(s_ex2_sthaz.read() | s_me2_stall.read());
    assign ex2_stall_B0 = (s_ex2_sthaz_Q | s_me2_stall_Q);
    assign s_ex_bradd_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:64:13
        // s_ex_bradd.write(((s_ex2_older.read()) ? (s_ex2_bradd.read()) : (s_ex1_bradd.read())));
        codasip_tmp_var_1 ? ((s_ex2_older_Q) ? s_ex2_bradd_Q : s_ex1_bradd_Q) :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:69:13
        // s_ex_bradd.write(((s_ex1_pcsrc.read()) ? (s_ex1_bradd.read()) : (s_ex2_bradd.read())));
        ((s_ex1_pcsrc_Q) ? s_ex1_bradd_Q : s_ex2_bradd_Q);
    assign s_ex_pcsrc_D_ACT_wire =
        // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:63:13
        // s_ex_pcsrc.write((bool)(1));
        codasip_tmp_var_1 ? 1'b1 :
        // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:68:13
        // s_ex_pcsrc.write(s_ex1_pcsrc.read() | s_ex2_pcsrc.read());
        (s_ex1_pcsrc_Q | s_ex2_pcsrc_Q);
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:83:19
    // ex1_memory();
    assign ex1_memory_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:85:19
    // ex1_output();
    assign ex1_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:84:19
    // ex2_memory();
    assign ex2_memory_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:86:19
    // ex2_output();
    assign ex2_output_ACT = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:80:9
    // r_ex1_stall.write(s_ex1_stall.read());
    assign r_ex1_stall_D = s_ex1_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:80:9
    // r_ex1_stall.write(s_ex1_stall.read());
    assign r_ex1_stall_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:81:9
    // r_ex2_stall.write(s_ex2_stall.read());
    assign r_ex2_stall_D = s_ex2_stall_Q;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:81:9
    // r_ex2_stall.write(s_ex2_stall.read());
    assign r_ex2_stall_WE = (ACT == 1'b1) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:78:9
    // s_ex1_stall.write(ex1_stall.read() | (((s_ex2_older.read()) ? (ex2_stall.read()) : (ignore.re ...
    assign s_ex1_stall_D = (ACT == 1'b1) ? (ex1_stall_B0 | ((s_ex2_older_Q) ? ex2_stall_B0 : ignore_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:52:9
    // s_ex1_sthaz.write(s_ex_same_addr.read() & s_ex2_older.read() & ex2_store.read() && (r_ex1_mem ...
    assign s_ex1_sthaz_D = (ACT == 1'b1) ? (((s_ex_same_addr_Q & s_ex2_older_Q) & ex2_store_B0) && (r_ex1_memop_Q != 4'h0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:44:9
    // s_ex2_older.write((~r_ex1_valid.read()) | (r_ex2_valid.read() & (r_ex1_order.read() ^ r_ex2_o ...
    assign s_ex2_older_D = (ACT == 1'b1) ? ((~r_ex1_valid_Q) | (r_ex2_valid_Q & (r_ex1_order_Q ^ r_ex2_order_Q))) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:79:9
    // s_ex2_stall.write(ex2_stall.read() | (((s_ex2_older.read()) ? (ignore.read()) : (ex1_stall.re ...
    assign s_ex2_stall_D = (ACT == 1'b1) ? (ex2_stall_B0 | ((s_ex2_older_Q) ? ignore_B0 : ex1_stall_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:53:9
    // s_ex2_sthaz.write(s_ex_same_addr.read() & ~s_ex2_older.read() & ex1_store.read() && (r_ex2_me ...
    assign s_ex2_sthaz_D = (ACT == 1'b1) ? (((s_ex_same_addr_Q & (~s_ex2_older_Q)) & ex1_store_B0) && (r_ex2_memop_Q != 4'h0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:69:13
    assign s_ex_bradd_D = (ACT == 1'b1) ? s_ex_bradd_D_ACT_wire : 32'h00000000;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:68:13
    assign s_ex_pcsrc_D = (ACT == 1'b1) ? s_ex_pcsrc_D_ACT_wire : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe3_ex.codal:51:9
    // s_ex_same_addr.write(!((s_ex1_alu.read()[31 .. 2] ^ s_ex2_alu.read()[31 .. 2]) != (uint30)(0) ...
    assign s_ex_same_addr_D = (ACT == 1'b1) ? (!((s_ex1_alu_Q ^ s_ex2_alu_Q) != 30'h00000000)) : 1'b0;
endmodule // ex_coordination_t
