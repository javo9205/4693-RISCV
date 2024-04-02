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
 *  \brief   Contains module definition of the 'riscv_core_t' ASIP core.
 */

module riscv_core_t(
    input  wire CLK,
    input  wire RST,
    input  wire [31:0] if_code_HRDATA,
    input  wire if_code_HREADY,
    input  wire if_code_HRESP,
    input  wire [31:0] ldst_HRDATA,
    input  wire ldst_HREADY,
    input  wire ldst_HRESP,
    output wire [31:0] if_code_HADDR,
    output wire [2:0] if_code_HBURST,
    output wire if_code_HMASTLOCK,
    output wire [3:0] if_code_HPROT,
    output wire [2:0] if_code_HSIZE,
    output wire [1:0] if_code_HTRANS,
    output wire if_code_HWRITE,
    output wire [31:0] ldst_HADDR,
    output wire [2:0] ldst_HBURST,
    output wire ldst_HMASTLOCK,
    output wire [3:0] ldst_HPROT,
    output wire [2:0] ldst_HSIZE,
    output wire [1:0] ldst_HTRANS,
    output wire [31:0] ldst_HWDATA,
    output wire ldst_HWRITE
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    wire [31:0] s_if_nextpc;
    // CodAL signal/wire
    wire [31:0] s_if_pcin;
    // CodAL signal/wire
    wire [31:0] s_id_instr;
    // CodAL signal/wire
    wire [2:0] s_id_immsel;
    // CodAL signal/wire
    wire [3:0] s_id_aluop;
    // CodAL signal/wire
    wire [1:0] s_id_alusrc1;
    // CodAL signal/wire
    wire s_id_alusrc2;
    // CodAL signal/wire
    wire s_id_regwrite;
    // CodAL signal/wire
    wire [1:0] s_id_rfwt_sel;
    // CodAL signal/wire
    wire [2:0] s_id_branchop;
    // CodAL signal/wire
    wire s_id_brnch_sel;
    // CodAL signal/wire
    wire [3:0] s_id_memop;
    // CodAL signal/wire
    wire s_id_loadhaz;
    // CodAL signal/wire
    wire [16:0] s_id_opc;
    // CodAL signal/wire
    wire [4:0] s_id_rs1;
    // CodAL signal/wire
    wire [4:0] s_id_rs2;
    // CodAL signal/wire
    wire [4:0] s_id_rd;
    // CodAL signal/wire
    wire s_id_rff1_sel;
    // CodAL signal/wire
    wire s_id_rff2_sel;
    // CodAL signal/wire
    wire [31:0] s_id_read1;
    // CodAL signal/wire
    wire [31:0] s_id_read2;
    // CodAL signal/wire
    wire [31:0] s_id_reg1;
    // CodAL signal/wire
    wire [31:0] s_id_reg2;
    // CodAL signal/wire
    wire [31:0] s_id_immed;
    // CodAL signal/wire
    wire [11:0] s_id_immedi;
    // CodAL signal/wire
    wire [11:0] s_id_immedb;
    // CodAL signal/wire
    wire [19:0] s_id_immedu;
    // CodAL signal/wire
    wire [11:0] s_id_immeds;
    // CodAL signal/wire
    wire [19:0] s_id_immedj;
    // CodAL signal/wire
    wire [31:0] s_id_bradd;
    // CodAL signal/wire
    wire s_id_pcsrc;
    // CodAL signal/wire
    wire s_ex_zero;
    // CodAL signal/wire
    wire [31:0] s_ex_src1;
    // CodAL signal/wire
    wire [31:0] s_ex_src2;
    // CodAL signal/wire
    wire [31:0] s_ex_alu;
    // CodAL signal/wire
    wire [31:0] s_ex_reg1;
    // CodAL signal/wire
    wire [31:0] s_ex_reg2;
    // CodAL signal/wire
    wire [1:0] s_ex_fwdA_sel;
    // CodAL signal/wire
    wire [1:0] s_ex_fwdB_sel;
    // CodAL signal/wire
    wire [31:0] s_ex_brimm;
    // CodAL signal/wire
    wire [31:0] s_ex_bradd;
    // CodAL signal/wire
    wire [1:0] s_ex_memsize;
    // CodAL signal/wire
    wire [31:0] s_ex_encoded;
    // CodAL signal/wire
    wire s_ex_xor;
    // CodAL signal/wire
    wire s_ex_pcsrc;
    // CodAL signal/wire
    wire s_me_pcsrc;
    // CodAL signal/wire
    wire [31:0] s_me_decoded;
    // CodAL signal/wire
    wire [31:0] s_me_memdat;
    // CodAL signal/wire
    wire [31:0] s_wb_nextpc;
    // CodAL signal/wire
    wire [31:0] s_wb_result;
    // CodAL signal/wire
    wire s_if_stall;
    // CodAL signal/wire
    wire s_id_stall;
    // CodAL signal/wire
    wire s_id_clear;
    // CodAL signal/wire
    wire s_ex_stall;
    // CodAL signal/wire
    wire s_ex_clear;
    // CodAL signal/wire
    wire s_me_stall;
    // CodAL signal/wire
    wire s_me_clear;
    // CodAL signal/wire
    wire s_wb_stall;
    // CodAL signal/wire
    wire s_wb_clear;

    // additional declarations:
    wire pipe_IF_STALL_Q_wire;
    wire id_output_r_id_pc_preserved_WE_wire;
    wire [31:0] id_output_r_id_pc_preserved_D_wire;
    wire [31:0] r_id_pc_preserved_Q_wire;
    wire id_output_r_id_instr_preserved_WE_wire;
    wire [31:0] id_output_r_id_instr_preserved_D_wire;
    wire [31:0] r_id_instr_preserved_Q_wire;
    wire pipe_ID_CLEAR_Q_wire;
    wire pipe_ID_STALL_Q_wire;
    wire r_id_pc_WE_wire;
    wire if_output_r_id_pc_WE_wire;
    wire id_r_id_pc_WE_wire;
    wire [31:0] r_id_pc_D_wire;
    wire [31:0] if_output_r_id_pc_D_wire;
    wire [31:0] id_r_id_pc_D_wire;
    wire [31:0] r_id_pc_Q_wire;
    wire pipe_EX_CLEAR_Q_wire;
    wire pipe_EX_STALL_Q_wire;
    wire id_output_r_ex_pc_WE_wire;
    wire [31:0] id_output_r_ex_pc_D_wire;
    wire [31:0] r_ex_pc_Q_wire;
    wire id_output_r_ex_aluop_WE_wire;
    wire [3:0] id_output_r_ex_aluop_D_wire;
    wire [3:0] r_ex_aluop_Q_wire;
    wire id_output_r_ex_alusrc1_WE_wire;
    wire [1:0] id_output_r_ex_alusrc1_D_wire;
    wire [1:0] r_ex_alusrc1_Q_wire;
    wire id_output_r_ex_alusrc2_WE_wire;
    wire id_output_r_ex_alusrc2_D_wire;
    wire r_ex_alusrc2_Q_wire;
    wire id_output_r_ex_regwrite_WE_wire;
    wire id_output_r_ex_regwrite_D_wire;
    wire r_ex_regwrite_Q_wire;
    wire id_output_r_ex_rfwt_sel_WE_wire;
    wire [1:0] id_output_r_ex_rfwt_sel_D_wire;
    wire [1:0] r_ex_rfwt_sel_Q_wire;
    wire id_output_r_ex_branchop_WE_wire;
    wire [2:0] id_output_r_ex_branchop_D_wire;
    wire [2:0] r_ex_branchop_Q_wire;
    wire id_output_r_ex_brnch_sel_WE_wire;
    wire id_output_r_ex_brnch_sel_D_wire;
    wire r_ex_brnch_sel_Q_wire;
    wire id_output_r_ex_memop_WE_wire;
    wire [3:0] id_output_r_ex_memop_D_wire;
    wire [3:0] r_ex_memop_Q_wire;
    wire id_output_r_ex_rd_WE_wire;
    wire [4:0] id_output_r_ex_rd_D_wire;
    wire [4:0] r_ex_rd_Q_wire;
    wire id_output_r_ex_rs1_WE_wire;
    wire [4:0] id_output_r_ex_rs1_D_wire;
    wire [4:0] r_ex_rs1_Q_wire;
    wire id_output_r_ex_rs2_WE_wire;
    wire [4:0] id_output_r_ex_rs2_D_wire;
    wire [4:0] r_ex_rs2_Q_wire;
    wire id_output_r_ex_reg1_WE_wire;
    wire [31:0] id_output_r_ex_reg1_D_wire;
    wire [31:0] r_ex_reg1_Q_wire;
    wire id_output_r_ex_reg2_WE_wire;
    wire [31:0] id_output_r_ex_reg2_D_wire;
    wire [31:0] r_ex_reg2_Q_wire;
    wire id_output_r_ex_immed_WE_wire;
    wire [31:0] id_output_r_ex_immed_D_wire;
    wire [31:0] r_ex_immed_Q_wire;
    wire pipe_ME_CLEAR_Q_wire;
    wire pipe_ME_STALL_Q_wire;
    wire ex_output_r_me_pc_WE_wire;
    wire [31:0] ex_output_r_me_pc_D_wire;
    wire [31:0] r_me_pc_Q_wire;
    wire ex_output_r_me_regwrite_WE_wire;
    wire ex_output_r_me_regwrite_D_wire;
    wire r_me_regwrite_Q_wire;
    wire ex_output_r_me_rfwt_sel_WE_wire;
    wire [1:0] ex_output_r_me_rfwt_sel_D_wire;
    wire [1:0] r_me_rfwt_sel_Q_wire;
    wire ex_output_r_me_branchop_WE_wire;
    wire [2:0] ex_output_r_me_branchop_D_wire;
    wire [2:0] r_me_branchop_Q_wire;
    wire ex_output_r_me_memop_WE_wire;
    wire [3:0] ex_output_r_me_memop_D_wire;
    wire [3:0] r_me_memop_Q_wire;
    wire ex_output_r_me_rd_WE_wire;
    wire [4:0] ex_output_r_me_rd_D_wire;
    wire [4:0] r_me_rd_Q_wire;
    wire ex_output_r_me_alu_WE_wire;
    wire [31:0] ex_output_r_me_alu_D_wire;
    wire [31:0] r_me_alu_Q_wire;
    wire ex_output_r_me_bradd_WE_wire;
    wire [31:0] ex_output_r_me_bradd_D_wire;
    wire [31:0] r_me_bradd_Q_wire;
    wire ex_output_r_me_wtdat_WE_wire;
    wire [31:0] ex_output_r_me_wtdat_D_wire;
    wire [31:0] r_me_wtdat_Q_wire;
    wire ex_output_r_me_zero_WE_wire;
    wire ex_output_r_me_zero_D_wire;
    wire r_me_zero_Q_wire;
    wire pipe_WB_CLEAR_Q_wire;
    wire pipe_WB_STALL_Q_wire;
    wire me_output_r_wb_pc_WE_wire;
    wire [31:0] me_output_r_wb_pc_D_wire;
    wire [31:0] r_wb_pc_Q_wire;
    wire me_output_r_wb_regwrite_WE_wire;
    wire me_output_r_wb_regwrite_D_wire;
    wire r_wb_regwrite_Q_wire;
    wire me_output_r_wb_rfwt_sel_WE_wire;
    wire [1:0] me_output_r_wb_rfwt_sel_D_wire;
    wire [1:0] r_wb_rfwt_sel_Q_wire;
    wire me_output_r_wb_rd_WE_wire;
    wire [4:0] me_output_r_wb_rd_D_wire;
    wire [4:0] r_wb_rd_Q_wire;
    wire me_output_r_wb_alu_WE_wire;
    wire [31:0] me_output_r_wb_alu_D_wire;
    wire [31:0] r_wb_alu_Q_wire;
    wire me_output_r_wb_memdat_WE_wire;
    wire [31:0] me_output_r_wb_memdat_D_wire;
    wire [31:0] r_wb_memdat_Q_wire;
    wire if_output_r_id_clear_WE_wire;
    wire if_output_r_id_clear_D_wire;
    wire r_id_clear_Q_wire;
    wire if_output_r_id_stall_WE_wire;
    wire if_output_r_id_stall_D_wire;
    wire r_id_stall_Q_wire;
    wire r_pc_WE_wire;
    wire reset_r_pc_WE_wire;
    wire if_output_r_pc_WE_wire;
    wire [31:0] r_pc_D_wire;
    wire [31:0] reset_r_pc_D_wire;
    wire [31:0] if_output_r_pc_D_wire;
    wire [31:0] r_pc_Q_wire;
    wire id_rf_xpr_src1_RE_wire;
    wire [4:0] id_rf_xpr_src1_RA_wire;
    wire id_rf_xpr_src2_RE_wire;
    wire [4:0] id_rf_xpr_src2_RA_wire;
    wire wb_rf_xpr_wrt0_WE_wire;
    wire [4:0] wb_rf_xpr_wrt0_WA_wire;
    wire [31:0] wb_rf_xpr_wrt0_D_wire;
    wire [31:0] rf_xpr_src1_Q_wire;
    wire [31:0] rf_xpr_src2_Q_wire;
    wire main_pipeline_control_ACT_wire;
    wire pipeline_control_pipe_EX_CLEAR_D_wire;
    wire pipeline_control_pipe_EX_STALL_D_wire;
    wire pipeline_control_pipe_ID_CLEAR_D_wire;
    wire pipeline_control_pipe_ID_STALL_D_wire;
    wire pipeline_control_pipe_IF_STALL_D_wire;
    wire pipeline_control_pipe_ME_CLEAR_D_wire;
    wire pipeline_control_pipe_ME_STALL_D_wire;
    wire pipeline_control_pipe_WB_CLEAR_D_wire;
    wire pipeline_control_pipe_WB_STALL_D_wire;
    wire main_wb_ACT_wire;
    wire codasip_startup_ctrl_reset_ACT_wire;
    wire ex_ex_memory_ACT_wire;
    wire ex_ex_output_ACT_wire;
    wire id_id_output_ACT_wire;
    wire fe_if_output_ACT_wire;
    wire me_me_memory_ACT_wire;
    wire me_me_output_ACT_wire;
    wire main_ex_ACT_wire;
    wire main_fe_ACT_wire;
    wire main_id_ACT_wire;
    wire id_dec_ACT_wire;
    wire [16:0] id_dec_codasip_param_0_wire;
    wire main_me_ACT_wire;
    wire codasip_startup_ctrl_main_ACT_wire;

    // child instances inside ASIP core:
    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id_pc_preserved (
        .CLK(CLK),
        .RST(RST),
        .STALL(pipe_IF_STALL_Q_wire),
        .WE(id_output_r_id_pc_preserved_WE_wire),
        .D(id_output_r_id_pc_preserved_D_wire),
        .Q(r_id_pc_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id_instr_preserved (
        .CLK(CLK),
        .RST(RST),
        .STALL(pipe_IF_STALL_Q_wire),
        .WE(id_output_r_id_instr_preserved_WE_wire),
        .D(id_output_r_id_instr_preserved_D_wire),
        .Q(r_id_instr_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ID_CLEAR_Q_wire),
        .STALL(pipe_ID_STALL_Q_wire),
        .WE(r_id_pc_WE_wire),
        .D(r_id_pc_D_wire),
        .Q(r_id_pc_Q_wire)
    );
    assign r_id_pc_WE_wire = id_r_id_pc_WE_wire |
        if_output_r_id_pc_WE_wire;
    assign r_id_pc_D_wire = id_r_id_pc_D_wire |
        if_output_r_id_pc_D_wire;

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_pc_WE_wire),
        .D(id_output_r_ex_pc_D_wire),
        .Q(r_ex_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_aluop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_aluop_WE_wire),
        .D(id_output_r_ex_aluop_D_wire),
        .Q(r_ex_aluop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_alusrc1 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_alusrc1_WE_wire),
        .D(id_output_r_ex_alusrc1_D_wire),
        .Q(r_ex_alusrc1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_alusrc2 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_alusrc2_WE_wire),
        .D(id_output_r_ex_alusrc2_D_wire),
        .Q(r_ex_alusrc2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_regwrite (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_regwrite_WE_wire),
        .D(id_output_r_ex_regwrite_D_wire),
        .Q(r_ex_regwrite_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_rfwt_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_rfwt_sel_WE_wire),
        .D(id_output_r_ex_rfwt_sel_D_wire),
        .Q(r_ex_rfwt_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_branchop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_branchop_WE_wire),
        .D(id_output_r_ex_branchop_D_wire),
        .Q(r_ex_branchop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_brnch_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_brnch_sel_WE_wire),
        .D(id_output_r_ex_brnch_sel_D_wire),
        .Q(r_ex_brnch_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_memop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_memop_WE_wire),
        .D(id_output_r_ex_memop_D_wire),
        .Q(r_ex_memop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_rd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_rd_WE_wire),
        .D(id_output_r_ex_rd_D_wire),
        .Q(r_ex_rd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_rs1 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_rs1_WE_wire),
        .D(id_output_r_ex_rs1_D_wire),
        .Q(r_ex_rs1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_rs2 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_rs2_WE_wire),
        .D(id_output_r_ex_rs2_D_wire),
        .Q(r_ex_rs2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_reg1 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_reg1_WE_wire),
        .D(id_output_r_ex_reg1_D_wire),
        .Q(r_ex_reg1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_reg2 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_reg2_WE_wire),
        .D(id_output_r_ex_reg2_D_wire),
        .Q(r_ex_reg2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex_immed (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX_CLEAR_Q_wire),
        .STALL(pipe_EX_STALL_Q_wire),
        .WE(id_output_r_ex_immed_WE_wire),
        .D(id_output_r_ex_immed_D_wire),
        .Q(r_ex_immed_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_pc_WE_wire),
        .D(ex_output_r_me_pc_D_wire),
        .Q(r_me_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_regwrite (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_regwrite_WE_wire),
        .D(ex_output_r_me_regwrite_D_wire),
        .Q(r_me_regwrite_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_rfwt_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_rfwt_sel_WE_wire),
        .D(ex_output_r_me_rfwt_sel_D_wire),
        .Q(r_me_rfwt_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_branchop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_branchop_WE_wire),
        .D(ex_output_r_me_branchop_D_wire),
        .Q(r_me_branchop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_memop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_memop_WE_wire),
        .D(ex_output_r_me_memop_D_wire),
        .Q(r_me_memop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_rd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_rd_WE_wire),
        .D(ex_output_r_me_rd_D_wire),
        .Q(r_me_rd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_alu (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_alu_WE_wire),
        .D(ex_output_r_me_alu_D_wire),
        .Q(r_me_alu_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_bradd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_bradd_WE_wire),
        .D(ex_output_r_me_bradd_D_wire),
        .Q(r_me_bradd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_wtdat (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_wtdat_WE_wire),
        .D(ex_output_r_me_wtdat_D_wire),
        .Q(r_me_wtdat_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me_zero (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME_CLEAR_Q_wire),
        .STALL(pipe_ME_STALL_Q_wire),
        .WE(ex_output_r_me_zero_WE_wire),
        .D(ex_output_r_me_zero_D_wire),
        .Q(r_me_zero_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB_CLEAR_Q_wire),
        .STALL(pipe_WB_STALL_Q_wire),
        .WE(me_output_r_wb_pc_WE_wire),
        .D(me_output_r_wb_pc_D_wire),
        .Q(r_wb_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb_regwrite (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB_CLEAR_Q_wire),
        .STALL(pipe_WB_STALL_Q_wire),
        .WE(me_output_r_wb_regwrite_WE_wire),
        .D(me_output_r_wb_regwrite_D_wire),
        .Q(r_wb_regwrite_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb_rfwt_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB_CLEAR_Q_wire),
        .STALL(pipe_WB_STALL_Q_wire),
        .WE(me_output_r_wb_rfwt_sel_WE_wire),
        .D(me_output_r_wb_rfwt_sel_D_wire),
        .Q(r_wb_rfwt_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb_rd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB_CLEAR_Q_wire),
        .STALL(pipe_WB_STALL_Q_wire),
        .WE(me_output_r_wb_rd_WE_wire),
        .D(me_output_r_wb_rd_D_wire),
        .Q(r_wb_rd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb_alu (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB_CLEAR_Q_wire),
        .STALL(pipe_WB_STALL_Q_wire),
        .WE(me_output_r_wb_alu_WE_wire),
        .D(me_output_r_wb_alu_D_wire),
        .Q(r_wb_alu_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb_memdat (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB_CLEAR_Q_wire),
        .STALL(pipe_WB_STALL_Q_wire),
        .WE(me_output_r_wb_memdat_WE_wire),
        .D(me_output_r_wb_memdat_D_wire),
        .Q(r_wb_memdat_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b1),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id_clear (
        .CLK(CLK),
        .RST(RST),
        .WE(if_output_r_id_clear_WE_wire),
        .D(if_output_r_id_clear_D_wire),
        .Q(r_id_clear_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id_stall (
        .CLK(CLK),
        .RST(RST),
        .WE(if_output_r_id_stall_WE_wire),
        .D(if_output_r_id_stall_D_wire),
        .Q(r_id_stall_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00001000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_pc (
        .CLK(CLK),
        .RST(RST),
        .WE(r_pc_WE_wire),
        .D(r_pc_D_wire),
        .Q(r_pc_Q_wire)
    );
    assign r_pc_WE_wire = if_output_r_pc_WE_wire |
        reset_r_pc_WE_wire;
    assign r_pc_D_wire = if_output_r_pc_D_wire |
        reset_r_pc_D_wire;

    // CodAL register file instance:
    riscv_core_rf_xpr_t rf_xpr (
        .CLK(CLK),
        .RST(RST),
        .src1_RE(id_rf_xpr_src1_RE_wire),
        .src1_RA(id_rf_xpr_src1_RA_wire),
        .src2_RE(id_rf_xpr_src2_RE_wire),
        .src2_RA(id_rf_xpr_src2_RA_wire),
        .wrt0_WE(wb_rf_xpr_wrt0_WE_wire),
        .wrt0_WA(wb_rf_xpr_wrt0_WA_wire),
        .wrt0_D(wb_rf_xpr_wrt0_D_wire),
        .src1_Q(rf_xpr_src1_Q_wire),
        .src2_Q(rf_xpr_src2_Q_wire)
    );

    // functional unit instance:
    riscv_core_pipeline_control_t pipeline_control (
        .ACT(main_pipeline_control_ACT_wire),
        .s_ex_clear_Q(s_ex_clear),
        .s_ex_stall_Q(s_ex_stall),
        .s_id_clear_Q(s_id_clear),
        .s_id_stall_Q(s_id_stall),
        .s_if_stall_Q(s_if_stall),
        .s_me_clear_Q(s_me_clear),
        .s_me_stall_Q(s_me_stall),
        .s_wb_clear_Q(s_wb_clear),
        .s_wb_stall_Q(s_wb_stall),
        .pipe_EX_CLEAR_D(pipeline_control_pipe_EX_CLEAR_D_wire),
        .pipe_EX_STALL_D(pipeline_control_pipe_EX_STALL_D_wire),
        .pipe_ID_CLEAR_D(pipeline_control_pipe_ID_CLEAR_D_wire),
        .pipe_ID_STALL_D(pipeline_control_pipe_ID_STALL_D_wire),
        .pipe_IF_STALL_D(pipeline_control_pipe_IF_STALL_D_wire),
        .pipe_ME_CLEAR_D(pipeline_control_pipe_ME_CLEAR_D_wire),
        .pipe_ME_STALL_D(pipeline_control_pipe_ME_STALL_D_wire),
        .pipe_WB_CLEAR_D(pipeline_control_pipe_WB_CLEAR_D_wire),
        .pipe_WB_STALL_D(pipeline_control_pipe_WB_STALL_D_wire)
    );

    // functional unit instance:
    riscv_core_wb_t wb (
        .ACT(main_wb_ACT_wire),
        .r_wb_alu_Q(r_wb_alu_Q_wire),
        .r_wb_memdat_Q(r_wb_memdat_Q_wire),
        .r_wb_pc_Q(r_wb_pc_Q_wire),
        .r_wb_rd_Q(r_wb_rd_Q_wire),
        .r_wb_regwrite_Q(r_wb_regwrite_Q_wire),
        .r_wb_rfwt_sel_Q(r_wb_rfwt_sel_Q_wire),
        .s_wb_nextpc_Q(s_wb_nextpc),
        .s_wb_result_Q(s_wb_result),
        .rf_xpr_wrt0_D(wb_rf_xpr_wrt0_D_wire),
        .rf_xpr_wrt0_WA(wb_rf_xpr_wrt0_WA_wire),
        .rf_xpr_wrt0_WE(wb_rf_xpr_wrt0_WE_wire),
        .s_wb_nextpc_D(s_wb_nextpc),
        .s_wb_result_D(s_wb_result),
        .s_wb_stall_D(s_wb_stall)
    );

    // functional unit instance:
    riscv_core_reset_t reset (
        .ACT(codasip_startup_ctrl_reset_ACT_wire),
        .r_pc_D(reset_r_pc_D_wire),
        .r_pc_WE(reset_r_pc_WE_wire)
    );

    // functional unit instance:
    riscv_core_ex_memory_t ex_memory (
        .ACT(ex_ex_memory_ACT_wire),
        .r_ex_memop_Q(r_ex_memop_Q_wire),
        .s_ex_alu_Q(s_ex_alu),
        .s_ex_memsize_Q(s_ex_memsize),
        .s_ex_reg2_Q(s_ex_reg2),
        .s_me_stall_Q(s_me_stall),
        .ldst_HADDR(ldst_HADDR),
        .ldst_HBURST(ldst_HBURST),
        .ldst_HMASTLOCK(ldst_HMASTLOCK),
        .ldst_HPROT(ldst_HPROT),
        .ldst_HSIZE(ldst_HSIZE),
        .ldst_HTRANS(ldst_HTRANS),
        .ldst_HWRITE(ldst_HWRITE),
        .s_ex_encoded_D(s_ex_encoded),
        .s_ex_memsize_D(s_ex_memsize),
        .s_ex_stall_D(s_ex_stall)
    );

    // functional unit instance:
    riscv_core_ex_output_t ex_output (
        .ACT(ex_ex_output_ACT_wire),
        .r_ex_branchop_Q(r_ex_branchop_Q_wire),
        .r_ex_memop_Q(r_ex_memop_Q_wire),
        .r_ex_pc_Q(r_ex_pc_Q_wire),
        .r_ex_rd_Q(r_ex_rd_Q_wire),
        .r_ex_regwrite_Q(r_ex_regwrite_Q_wire),
        .r_ex_rfwt_sel_Q(r_ex_rfwt_sel_Q_wire),
        .s_ex_alu_Q(s_ex_alu),
        .s_ex_bradd_Q(s_ex_bradd),
        .s_ex_encoded_Q(s_ex_encoded),
        .s_ex_zero_Q(s_ex_zero),
        .r_me_alu_D(ex_output_r_me_alu_D_wire),
        .r_me_alu_WE(ex_output_r_me_alu_WE_wire),
        .r_me_bradd_D(ex_output_r_me_bradd_D_wire),
        .r_me_bradd_WE(ex_output_r_me_bradd_WE_wire),
        .r_me_branchop_D(ex_output_r_me_branchop_D_wire),
        .r_me_branchop_WE(ex_output_r_me_branchop_WE_wire),
        .r_me_memop_D(ex_output_r_me_memop_D_wire),
        .r_me_memop_WE(ex_output_r_me_memop_WE_wire),
        .r_me_pc_D(ex_output_r_me_pc_D_wire),
        .r_me_pc_WE(ex_output_r_me_pc_WE_wire),
        .r_me_rd_D(ex_output_r_me_rd_D_wire),
        .r_me_rd_WE(ex_output_r_me_rd_WE_wire),
        .r_me_regwrite_D(ex_output_r_me_regwrite_D_wire),
        .r_me_regwrite_WE(ex_output_r_me_regwrite_WE_wire),
        .r_me_rfwt_sel_D(ex_output_r_me_rfwt_sel_D_wire),
        .r_me_rfwt_sel_WE(ex_output_r_me_rfwt_sel_WE_wire),
        .r_me_wtdat_D(ex_output_r_me_wtdat_D_wire),
        .r_me_wtdat_WE(ex_output_r_me_wtdat_WE_wire),
        .r_me_zero_D(ex_output_r_me_zero_D_wire),
        .r_me_zero_WE(ex_output_r_me_zero_WE_wire)
    );

    // functional unit instance:
    riscv_core_id_output_t id_output (
        .ACT(id_id_output_ACT_wire),
        .r_id_pc_Q(r_id_pc_Q_wire),
        .s_id_aluop_Q(s_id_aluop),
        .s_id_alusrc1_Q(s_id_alusrc1),
        .s_id_alusrc2_Q(s_id_alusrc2),
        .s_id_branchop_Q(s_id_branchop),
        .s_id_brnch_sel_Q(s_id_brnch_sel),
        .s_id_immed_Q(s_id_immed),
        .s_id_instr_Q(s_id_instr),
        .s_id_memop_Q(s_id_memop),
        .s_id_rd_Q(s_id_rd),
        .s_id_reg1_Q(s_id_reg1),
        .s_id_reg2_Q(s_id_reg2),
        .s_id_regwrite_Q(s_id_regwrite),
        .s_id_rfwt_sel_Q(s_id_rfwt_sel),
        .s_id_rs1_Q(s_id_rs1),
        .s_id_rs2_Q(s_id_rs2),
        .r_ex_aluop_D(id_output_r_ex_aluop_D_wire),
        .r_ex_aluop_WE(id_output_r_ex_aluop_WE_wire),
        .r_ex_alusrc1_D(id_output_r_ex_alusrc1_D_wire),
        .r_ex_alusrc1_WE(id_output_r_ex_alusrc1_WE_wire),
        .r_ex_alusrc2_D(id_output_r_ex_alusrc2_D_wire),
        .r_ex_alusrc2_WE(id_output_r_ex_alusrc2_WE_wire),
        .r_ex_branchop_D(id_output_r_ex_branchop_D_wire),
        .r_ex_branchop_WE(id_output_r_ex_branchop_WE_wire),
        .r_ex_brnch_sel_D(id_output_r_ex_brnch_sel_D_wire),
        .r_ex_brnch_sel_WE(id_output_r_ex_brnch_sel_WE_wire),
        .r_ex_immed_D(id_output_r_ex_immed_D_wire),
        .r_ex_immed_WE(id_output_r_ex_immed_WE_wire),
        .r_ex_memop_D(id_output_r_ex_memop_D_wire),
        .r_ex_memop_WE(id_output_r_ex_memop_WE_wire),
        .r_ex_pc_D(id_output_r_ex_pc_D_wire),
        .r_ex_pc_WE(id_output_r_ex_pc_WE_wire),
        .r_ex_rd_D(id_output_r_ex_rd_D_wire),
        .r_ex_rd_WE(id_output_r_ex_rd_WE_wire),
        .r_ex_reg1_D(id_output_r_ex_reg1_D_wire),
        .r_ex_reg1_WE(id_output_r_ex_reg1_WE_wire),
        .r_ex_reg2_D(id_output_r_ex_reg2_D_wire),
        .r_ex_reg2_WE(id_output_r_ex_reg2_WE_wire),
        .r_ex_regwrite_D(id_output_r_ex_regwrite_D_wire),
        .r_ex_regwrite_WE(id_output_r_ex_regwrite_WE_wire),
        .r_ex_rfwt_sel_D(id_output_r_ex_rfwt_sel_D_wire),
        .r_ex_rfwt_sel_WE(id_output_r_ex_rfwt_sel_WE_wire),
        .r_ex_rs1_D(id_output_r_ex_rs1_D_wire),
        .r_ex_rs1_WE(id_output_r_ex_rs1_WE_wire),
        .r_ex_rs2_D(id_output_r_ex_rs2_D_wire),
        .r_ex_rs2_WE(id_output_r_ex_rs2_WE_wire),
        .r_id_instr_preserved_D(id_output_r_id_instr_preserved_D_wire),
        .r_id_instr_preserved_WE(id_output_r_id_instr_preserved_WE_wire),
        .r_id_pc_preserved_D(id_output_r_id_pc_preserved_D_wire),
        .r_id_pc_preserved_WE(id_output_r_id_pc_preserved_WE_wire)
    );

    // functional unit instance:
    riscv_core_if_output_t if_output (
        .ACT(fe_if_output_ACT_wire),
        .r_pc_Q(r_pc_Q_wire),
        .s_id_clear_Q(s_id_clear),
        .s_id_stall_Q(s_id_stall),
        .s_if_pcin_Q(s_if_pcin),
        .r_id_clear_D(if_output_r_id_clear_D_wire),
        .r_id_clear_WE(if_output_r_id_clear_WE_wire),
        .r_id_pc_D(if_output_r_id_pc_D_wire),
        .r_id_pc_WE(if_output_r_id_pc_WE_wire),
        .r_id_stall_D(if_output_r_id_stall_D_wire),
        .r_id_stall_WE(if_output_r_id_stall_WE_wire),
        .r_pc_D(if_output_r_pc_D_wire),
        .r_pc_WE(if_output_r_pc_WE_wire)
    );

    // functional unit instance:
    riscv_core_me_memory_t me_memory (
        .ACT(me_me_memory_ACT_wire),
        .ldst_HRDATA(ldst_HRDATA),
        .ldst_HREADY(ldst_HREADY),
        .ldst_HRESP(ldst_HRESP),
        .r_me_alu_Q(r_me_alu_Q_wire[1:0]),
        .r_me_memop_Q(r_me_memop_Q_wire),
        .r_me_wtdat_Q(r_me_wtdat_Q_wire),
        .s_me_decoded_Q(s_me_decoded),
        .ldst_HWDATA(ldst_HWDATA),
        .s_me_decoded_D(s_me_decoded),
        .s_me_memdat_D(s_me_memdat),
        .s_me_stall_D(s_me_stall)
    );

    // functional unit instance:
    riscv_core_me_output_t me_output (
        .ACT(me_me_output_ACT_wire),
        .r_me_alu_Q(r_me_alu_Q_wire),
        .r_me_pc_Q(r_me_pc_Q_wire),
        .r_me_rd_Q(r_me_rd_Q_wire),
        .r_me_regwrite_Q(r_me_regwrite_Q_wire),
        .r_me_rfwt_sel_Q(r_me_rfwt_sel_Q_wire),
        .s_me_memdat_Q(s_me_memdat),
        .r_wb_alu_D(me_output_r_wb_alu_D_wire),
        .r_wb_alu_WE(me_output_r_wb_alu_WE_wire),
        .r_wb_memdat_D(me_output_r_wb_memdat_D_wire),
        .r_wb_memdat_WE(me_output_r_wb_memdat_WE_wire),
        .r_wb_pc_D(me_output_r_wb_pc_D_wire),
        .r_wb_pc_WE(me_output_r_wb_pc_WE_wire),
        .r_wb_rd_D(me_output_r_wb_rd_D_wire),
        .r_wb_rd_WE(me_output_r_wb_rd_WE_wire),
        .r_wb_regwrite_D(me_output_r_wb_regwrite_D_wire),
        .r_wb_regwrite_WE(me_output_r_wb_regwrite_WE_wire),
        .r_wb_rfwt_sel_D(me_output_r_wb_rfwt_sel_D_wire),
        .r_wb_rfwt_sel_WE(me_output_r_wb_rfwt_sel_WE_wire)
    );

    // functional unit instance:
    riscv_core_ex_t ex (
        .ACT(main_ex_ACT_wire),
        .r_ex_aluop_Q(r_ex_aluop_Q_wire),
        .r_ex_alusrc1_Q(r_ex_alusrc1_Q_wire),
        .r_ex_alusrc2_Q(r_ex_alusrc2_Q_wire),
        .r_ex_branchop_Q(r_ex_branchop_Q_wire),
        .r_ex_brnch_sel_Q(r_ex_brnch_sel_Q_wire),
        .r_ex_immed_Q(r_ex_immed_Q_wire),
        .r_ex_pc_Q(r_ex_pc_Q_wire),
        .r_ex_reg1_Q(r_ex_reg1_Q_wire),
        .r_ex_reg2_Q(r_ex_reg2_Q_wire),
        .r_ex_rs1_Q(r_ex_rs1_Q_wire),
        .r_ex_rs2_Q(r_ex_rs2_Q_wire),
        .r_me_alu_Q(r_me_alu_Q_wire),
        .r_me_rd_Q(r_me_rd_Q_wire),
        .r_me_regwrite_Q(r_me_regwrite_Q_wire),
        .r_wb_rd_Q(r_wb_rd_Q_wire),
        .r_wb_regwrite_Q(r_wb_regwrite_Q_wire),
        .s_ex_alu_Q(s_ex_alu),
        .s_ex_brimm_Q(s_ex_brimm),
        .s_ex_fwdA_sel_Q(s_ex_fwdA_sel),
        .s_ex_fwdB_sel_Q(s_ex_fwdB_sel),
        .s_ex_reg1_Q(s_ex_reg1),
        .s_ex_reg2_Q(s_ex_reg2),
        .s_ex_src1_Q(s_ex_src1),
        .s_ex_src2_Q(s_ex_src2),
        .s_ex_xor_Q(s_ex_xor),
        .s_wb_result_Q(s_wb_result),
        .ex_memory_ACT(ex_ex_memory_ACT_wire),
        .ex_output_ACT(ex_ex_output_ACT_wire),
        .s_ex_alu_D(s_ex_alu),
        .s_ex_bradd_D(s_ex_bradd),
        .s_ex_brimm_D(s_ex_brimm),
        .s_ex_fwdA_sel_D(s_ex_fwdA_sel),
        .s_ex_fwdB_sel_D(s_ex_fwdB_sel),
        .s_ex_pcsrc_D(s_ex_pcsrc),
        .s_ex_reg1_D(s_ex_reg1),
        .s_ex_reg2_D(s_ex_reg2),
        .s_ex_src1_D(s_ex_src1),
        .s_ex_src2_D(s_ex_src2),
        .s_ex_xor_D(s_ex_xor),
        .s_ex_zero_D(s_ex_zero)
    );

    // functional unit instance:
    riscv_core_fe_t fe (
        .ACT(main_fe_ACT_wire),
        .r_me_bradd_Q(r_me_bradd_Q_wire),
        .r_pc_Q(r_pc_Q_wire),
        .s_ex_bradd_Q(s_ex_bradd),
        .s_ex_pcsrc_Q(s_ex_pcsrc),
        .s_id_bradd_Q(s_id_bradd),
        .s_id_pcsrc_Q(s_id_pcsrc),
        .s_id_stall_Q(s_id_stall),
        .s_if_nextpc_Q(s_if_nextpc),
        .s_me_pcsrc_Q(s_me_pcsrc),
        .if_code_HADDR(if_code_HADDR),
        .if_code_HBURST(if_code_HBURST),
        .if_code_HMASTLOCK(if_code_HMASTLOCK),
        .if_code_HPROT(if_code_HPROT),
        .if_code_HSIZE(if_code_HSIZE),
        .if_code_HTRANS(if_code_HTRANS),
        .if_code_HWRITE(if_code_HWRITE),
        .if_output_ACT(fe_if_output_ACT_wire),
        .s_ex_clear_D(s_ex_clear),
        .s_id_clear_D(s_id_clear),
        .s_if_nextpc_D(s_if_nextpc),
        .s_if_pcin_D(s_if_pcin),
        .s_if_stall_D(s_if_stall),
        .s_me_clear_D(s_me_clear),
        .s_wb_clear_D(s_wb_clear)
    );

    // functional unit instance:
    riscv_core_id_t id (
        .ACT(main_id_ACT_wire),
        .if_code_HRDATA(if_code_HRDATA),
        .if_code_HREADY(if_code_HREADY),
        .if_code_HRESP(if_code_HRESP),
        .r_ex_memop_Q(r_ex_memop_Q_wire),
        .r_ex_rd_Q(r_ex_rd_Q_wire),
        .r_id_clear_Q(r_id_clear_Q_wire),
        .r_id_instr_preserved_Q(r_id_instr_preserved_Q_wire),
        .r_id_pc_preserved_Q(r_id_pc_preserved_Q_wire),
        .r_id_pc_Q(r_id_pc_Q_wire),
        .r_id_stall_Q(r_id_stall_Q_wire),
        .r_wb_rd_Q(r_wb_rd_Q_wire),
        .r_wb_regwrite_Q(r_wb_regwrite_Q_wire),
        .rf_xpr_src1_Q(rf_xpr_src1_Q_wire),
        .rf_xpr_src2_Q(rf_xpr_src2_Q_wire),
        .s_ex_stall_Q(s_ex_stall),
        .s_id_branchop_Q(s_id_branchop),
        .s_id_immed_Q(s_id_immed),
        .s_id_immedb_Q(s_id_immedb),
        .s_id_immedi_Q(s_id_immedi),
        .s_id_immedj_Q(s_id_immedj),
        .s_id_immeds_Q(s_id_immeds),
        .s_id_immedu_Q(s_id_immedu),
        .s_id_immsel_Q(s_id_immsel),
        .s_id_instr_Q(s_id_instr),
        .s_id_loadhaz_Q(s_id_loadhaz),
        .s_id_opc_Q(s_id_opc),
        .s_id_read1_Q(s_id_read1),
        .s_id_read2_Q(s_id_read2),
        .s_id_rff1_sel_Q(s_id_rff1_sel),
        .s_id_rff2_sel_Q(s_id_rff2_sel),
        .s_id_rs1_Q(s_id_rs1),
        .s_id_rs2_Q(s_id_rs2),
        .s_wb_result_Q(s_wb_result),
        .dec_ACT(id_dec_ACT_wire),
        .dec_codasip_param_0(id_dec_codasip_param_0_wire),
        .id_output_ACT(id_id_output_ACT_wire),
        .r_id_pc_D(id_r_id_pc_D_wire),
        .r_id_pc_WE(id_r_id_pc_WE_wire),
        .rf_xpr_src1_RA(id_rf_xpr_src1_RA_wire),
        .rf_xpr_src1_RE(id_rf_xpr_src1_RE_wire),
        .rf_xpr_src2_RA(id_rf_xpr_src2_RA_wire),
        .rf_xpr_src2_RE(id_rf_xpr_src2_RE_wire),
        .s_id_bradd_D(s_id_bradd),
        .s_id_immed_D(s_id_immed),
        .s_id_immedb_D(s_id_immedb),
        .s_id_immedi_D(s_id_immedi),
        .s_id_immedj_D(s_id_immedj),
        .s_id_immeds_D(s_id_immeds),
        .s_id_immedu_D(s_id_immedu),
        .s_id_instr_D(s_id_instr),
        .s_id_loadhaz_D(s_id_loadhaz),
        .s_id_opc_D(s_id_opc),
        .s_id_pcsrc_D(s_id_pcsrc),
        .s_id_rd_D(s_id_rd),
        .s_id_read1_D(s_id_read1),
        .s_id_read2_D(s_id_read2),
        .s_id_reg1_D(s_id_reg1),
        .s_id_reg2_D(s_id_reg2),
        .s_id_rff1_sel_D(s_id_rff1_sel),
        .s_id_rff2_sel_D(s_id_rff2_sel),
        .s_id_rs1_D(s_id_rs1),
        .s_id_rs2_D(s_id_rs2),
        .s_id_stall_D(s_id_stall)
    );

    // functional unit instance:
    riscv_core_me_t me (
        .ACT(main_me_ACT_wire),
        .r_me_branchop_Q(r_me_branchop_Q_wire),
        .r_me_zero_Q(r_me_zero_Q_wire),
        .me_memory_ACT(me_me_memory_ACT_wire),
        .me_output_ACT(me_me_output_ACT_wire),
        .s_me_pcsrc_D(s_me_pcsrc)
    );

    // functional unit instance:
    riscv_core_main_t main (
        .ACT(codasip_startup_ctrl_main_ACT_wire),
        .ex_ACT(main_ex_ACT_wire),
        .fe_ACT(main_fe_ACT_wire),
        .id_ACT(main_id_ACT_wire),
        .me_ACT(main_me_ACT_wire),
        .pipeline_control_ACT(main_pipeline_control_ACT_wire),
        .wb_ACT(main_wb_ACT_wire)
    );

    // instruction decoder instance:
    riscv_core_dec_t dec (
        .ACT(id_dec_ACT_wire),
        .codasip_param_0(id_dec_codasip_param_0_wire),
        .s_id_aluop_D(s_id_aluop),
        .s_id_alusrc1_D(s_id_alusrc1),
        .s_id_alusrc2_D(s_id_alusrc2),
        .s_id_branchop_D(s_id_branchop),
        .s_id_brnch_sel_D(s_id_brnch_sel),
        .s_id_immsel_D(s_id_immsel),
        .s_id_memop_D(s_id_memop),
        .s_id_regwrite_D(s_id_regwrite),
        .s_id_rfwt_sel_D(s_id_rfwt_sel)
    );

    // pipeline controller instance:
    riscv_core_pipe_t pipe (
        .EX_CLEAR_D(pipeline_control_pipe_EX_CLEAR_D_wire),
        .EX_STALL_D(pipeline_control_pipe_EX_STALL_D_wire),
        .ID_CLEAR_D(pipeline_control_pipe_ID_CLEAR_D_wire),
        .ID_STALL_D(pipeline_control_pipe_ID_STALL_D_wire),
        .IF_STALL_D(pipeline_control_pipe_IF_STALL_D_wire),
        .ME_CLEAR_D(pipeline_control_pipe_ME_CLEAR_D_wire),
        .ME_STALL_D(pipeline_control_pipe_ME_STALL_D_wire),
        .WB_CLEAR_D(pipeline_control_pipe_WB_CLEAR_D_wire),
        .WB_STALL_D(pipeline_control_pipe_WB_STALL_D_wire),
        .EX_CLEAR_Q(pipe_EX_CLEAR_Q_wire),
        .EX_STALL_Q(pipe_EX_STALL_Q_wire),
        .ID_CLEAR_Q(pipe_ID_CLEAR_Q_wire),
        .ID_STALL_Q(pipe_ID_STALL_Q_wire),
        .IF_STALL_Q(pipe_IF_STALL_Q_wire),
        .ME_CLEAR_Q(pipe_ME_CLEAR_Q_wire),
        .ME_STALL_Q(pipe_ME_STALL_Q_wire),
        .WB_CLEAR_Q(pipe_WB_CLEAR_Q_wire),
        .WB_STALL_Q(pipe_WB_STALL_Q_wire)
    );

    // startup controller instance:
    riscv_core_codasip_startup_ctrl_t codasip_startup_ctrl (
        .CLK(CLK),
        .RST(RST),
        .main_ACT(codasip_startup_ctrl_main_ACT_wire),
        .reset_ACT(codasip_startup_ctrl_reset_ACT_wire)
    );

endmodule // riscv_core_t
