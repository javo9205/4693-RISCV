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
 *  \brief   Contains module definition of the 't' ASIP core.
 */

`include "Control_Signals.svh"

module superscalar_core_t(
    input  wire CLK,
    input  wire RST,
    input  wire [31:0] if1_ahb_HRDATA,
    input  wire if1_ahb_HREADY,
    input  wire if1_ahb_HRESP,
    input  wire [31:0] if2_ahb_HRDATA,
    input  wire if2_ahb_HREADY,
    input  wire if2_ahb_HRESP,
    input  wire [31:0] ldst1_ahb_HRDATA,
    input  wire ldst1_ahb_HREADY,
    input  wire ldst1_ahb_HRESP,
    input  wire [31:0] ldst2_ahb_HRDATA,
    input  wire ldst2_ahb_HREADY,
    input  wire ldst2_ahb_HRESP,
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
    output wire [31:0] ldst1_ahb_HADDR,
    output wire [2:0] ldst1_ahb_HBURST,
    output wire ldst1_ahb_HMASTLOCK,
    output wire [3:0] ldst1_ahb_HPROT,
    output wire [2:0] ldst1_ahb_HSIZE,
    output wire [1:0] ldst1_ahb_HTRANS,
    output wire [31:0] ldst1_ahb_HWDATA,
    output wire ldst1_ahb_HWRITE,
    output wire [31:0] ldst2_ahb_HADDR,
    output wire [2:0] ldst2_ahb_HBURST,
    output wire ldst2_ahb_HMASTLOCK,
    output wire [3:0] ldst2_ahb_HPROT,
    output wire [2:0] ldst2_ahb_HSIZE,
    output wire [1:0] ldst2_ahb_HTRANS,
    output wire [31:0] ldst2_ahb_HWDATA,
    output wire ldst2_ahb_HWRITE
);
    // type, wire and constant declarations:
    // CodAL signal/wire
    wire [31:0] s_if_nextpc;
    // CodAL signal/wire
    wire [31:0] s_if_pcin;
    // CodAL signal/wire
    wire [31:0] s_id_bradd;
    // CodAL signal/wire
    wire s_id_pcsrc;
    // CodAL signal/wire
    wire [31:0] s_id1_instr;
    // CodAL signal/wire
    wire [2:0] s_id1_immsel;
    // CodAL signal/wire
    aluop_t s_id1_aluop;
    // CodAL signal/wire
    src1_t s_id1_alusrc1;
    // CodAL signal/wire
    src2_t s_id1_alusrc2;
    // CodAL signal/wire
    regwrite_t s_id1_regwrite;
    // CodAL signal/wire
    rfwt_sel_t s_id1_rfwt_sel;
    // CodAL signal/wire
    branchop_t s_id1_branchop;
    // CodAL signal/wire
    brnch_sel_t s_id1_brnch_sel;
    // CodAL signal/wire
    mem_op_t s_id1_memop;
    // CodAL signal/wire
    wire s_id1_datahaz;
    // CodAL signal/wire
    wire [16:0] s_id1_opc;
    // CodAL signal/wire
    xpr_t s_id1_rs1;
    // CodAL signal/wire
    xpr_t s_id1_rs2;
    // CodAL signal/wire
    xpr_t s_id1_rd;
    // CodAL signal/wire
    rff_sel_t s_id1_rff1_sel;
    // CodAL signal/wire
    rff_sel_t s_id1_rff2_sel;
    // CodAL signal/wire
    wire [31:0] s_id1_read1;
    // CodAL signal/wire
    wire [31:0] s_id1_read2;
    // CodAL signal/wire
    wire [31:0] s_id1_reg1;
    // CodAL signal/wire
    wire [31:0] s_id1_reg2;
    // CodAL signal/wire
    wire [31:0] s_id1_immed;
    // CodAL signal/wire
    wire [11:0] s_id1_immedi;
    // CodAL signal/wire
    wire [11:0] s_id1_immedb;
    // CodAL signal/wire
    wire [19:0] s_id1_immedu;
    // CodAL signal/wire
    wire [11:0] s_id1_immeds;
    // CodAL signal/wire
    wire [19:0] s_id1_immedj;
    // CodAL signal/wire
    wire [31:0] s_id1_bradd;
    // CodAL signal/wire
    wire s_id1_pcsrc;
    // CodAL signal/wire
    wire [31:0] s_id2_instr;
    // CodAL signal/wire
    wire [2:0] s_id2_immsel;
    // CodAL signal/wire
    aluop_t s_id2_aluop;
    // CodAL signal/wire
    wire s_id2_alusrc1;
    // CodAL signal/wire
    src2_t s_id2_alusrc2;
    // CodAL signal/wire
    regwrite_t s_id2_regwrite;
    // CodAL signal/wire
    rfwt_sel_t s_id2_rfwt_sel;
    // CodAL signal/wire
    branchop_t s_id2_branchop;
    // CodAL signal/wire
    brnch_sel_t s_id2_brnch_sel;
    // CodAL signal/wire
    mem_op_t s_id2_memop;
    // CodAL signal/wire
    wire s_id2_datahaz;
    // CodAL signal/wire
    wire [16:0] s_id2_opc;
    // CodAL signal/wire
    xpr_t s_id2_rs1;
    // CodAL signal/wire
    xpr_t s_id2_rs2;
    // CodAL signal/wire
    xpr_t s_id2_rd;
    // CodAL signal/wire
    rff_sel_t s_id2_rff1_sel;
    // CodAL signal/wire
    rff_sel_t s_id2_rff2_sel;
    // CodAL signal/wire
    wire [31:0] s_id2_read1;
    // CodAL signal/wire
    wire [31:0] s_id2_read2;
    // CodAL signal/wire
    wire [31:0] s_id2_reg1;
    // CodAL signal/wire
    wire [31:0] s_id2_reg2;
    // CodAL signal/wire
    wire [31:0] s_id2_immed;
    // CodAL signal/wire
    wire [11:0] s_id2_immedi;
    // CodAL signal/wire
    wire [11:0] s_id2_immedb;
    // CodAL signal/wire
    wire [19:0] s_id2_immedu;
    // CodAL signal/wire
    wire [11:0] s_id2_immeds;
    // CodAL signal/wire
    wire [19:0] s_id2_immedj;
    // CodAL signal/wire
    wire [31:0] s_id2_bradd;
    // CodAL signal/wire
    wire s_id2_pcsrc;
    // CodAL signal/wire
    wire [31:0] s_ex_bradd;
    // CodAL signal/wire
    wire s_ex_pcsrc;
    // CodAL signal/wire
    wire s_ex1_zero;
    // CodAL signal/wire
    wire [31:0] s_ex1_src1;
    // CodAL signal/wire
    wire [31:0] s_ex1_src2;
    // CodAL signal/wire
    wire [31:0] s_ex1_alu;
    // CodAL signal/wire
    wire [31:0] s_ex1_reg1;
    // CodAL signal/wire
    wire [31:0] s_ex1_reg2;
    // CodAL signal/wire
    fwd_sel_t s_ex1_fwdA_sel;
    // CodAL signal/wire
    fwd_sel_t s_ex1_fwdB_sel;
    // CodAL signal/wire
    wire [1:0] s_ex1_memsize;
    // CodAL signal/wire
    wire [31:0] s_ex1_encoded;
    // CodAL signal/wire
    wire s_ex1_xor;
    // CodAL signal/wire
    wire s_ex1_pcsrc;
    // CodAL signal/wire
    wire [31:0] s_ex1_brimm;
    // CodAL signal/wire
    wire [31:0] s_ex1_bradd;
    // CodAL signal/wire
    wire s_ex2_zero;
    // CodAL signal/wire
    wire [31:0] s_ex2_src1;
    // CodAL signal/wire
    wire [31:0] s_ex2_src2;
    // CodAL signal/wire
    wire [31:0] s_ex2_alu;
    // CodAL signal/wire
    wire [31:0] s_ex2_reg1;
    // CodAL signal/wire
    wire [31:0] s_ex2_reg2;
    // CodAL signal/wire
    fwd_sel_t s_ex2_fwdA_sel;
    // CodAL signal/wire
    fwd_sel_t s_ex2_fwdB_sel;
    // CodAL signal/wire
    wire [1:0] s_ex2_memsize;
    // CodAL signal/wire
    wire [31:0] s_ex2_encoded;
    // CodAL signal/wire
    wire s_ex2_xor;
    // CodAL signal/wire
    wire s_ex2_pcsrc;
    // CodAL signal/wire
    wire [31:0] s_ex2_brimm;
    // CodAL signal/wire
    wire [31:0] s_ex2_bradd;
    // CodAL signal/wire
    wire [31:0] s_me_bradd;
    // CodAL signal/wire
    wire s_me_pcsrc;
    // CodAL signal/wire
    wire s_me1_pcsrc;
    // CodAL signal/wire
    wire [31:0] s_me1_decoded;
    // CodAL signal/wire
    wire [31:0] s_me1_memdat;
    // CodAL signal/wire
    wire s_me2_pcsrc;
    // CodAL signal/wire
    wire [31:0] s_me2_decoded;
    // CodAL signal/wire
    wire [31:0] s_me2_memdat;
    // CodAL signal/wire
    wire [31:0] s_wb1_nextpc;
    // CodAL signal/wire
    wire [31:0] s_wb1_result;
    // CodAL signal/wire
    wire [31:0] s_wb2_nextpc;
    // CodAL signal/wire
    wire [31:0] s_wb2_result;
    // CodAL signal/wire
    wire s_if_stall;
    // CodAL signal/wire
    wire s_id_clear;
    // CodAL signal/wire
    wire s_id1_stall;
    // CodAL signal/wire
    wire s_ex1_stall;
    // CodAL signal/wire
    wire s_ex1_clear;
    // CodAL signal/wire
    wire s_me1_stall;
    // CodAL signal/wire
    wire s_me1_clear;
    // CodAL signal/wire
    wire s_wb1_stall;
    // CodAL signal/wire
    wire s_wb1_clear;
    // CodAL signal/wire
    wire s_id2_stall;
    // CodAL signal/wire
    wire s_ex2_stall;
    // CodAL signal/wire
    wire s_ex2_clear;
    // CodAL signal/wire
    wire s_me2_stall;
    // CodAL signal/wire
    wire s_me2_clear;
    // CodAL signal/wire
    wire s_wb2_stall;
    // CodAL signal/wire
    wire s_wb2_clear;
    // CodAL signal/wire
    wire s_id2_older;
    // CodAL signal/wire
    wire s_ex2_older;
    // CodAL signal/wire
    wire s_me2_older;
    // CodAL signal/wire
    wire s_wb2_older;
    // CodAL signal/wire
    wire s_id1_order;
    // CodAL signal/wire
    wire s_id2_order;
    // CodAL signal/wire
    wire [31:0] s_if_pcB;
    // CodAL signal/wire
    wire [31:0] s_if_pc1;
    // CodAL signal/wire
    wire [31:0] s_if_pc2;
    // CodAL signal/wire
    wire s_if_jump;
    // CodAL signal/wire
    wire [31:0] s_id1_pc;
    // CodAL signal/wire
    wire [31:0] s_id2_pc;
    // CodAL signal/wire
    wire s_id_stallA;
    // CodAL signal/wire
    wire s_id_stallB;
    // CodAL signal/wire
    wire s_id_fetch_order;
    // CodAL signal/wire
    wire s_ex_same_addr;
    // CodAL signal/wire
    wire s_ex1_sthaz;
    // CodAL signal/wire
    wire s_ex2_sthaz;
    // CodAL signal/wire
    wire s_me1_memhaz;
    // CodAL signal/wire
    wire s_me2_memhaz;
    // CodAL signal/wire
    wire s_wb_wthaz;
    // CodAL signal/wire
    wire s_wb1_wten;
    // CodAL signal/wire
    wire s_wb2_wten;
    // CodAL signal/wire
    wire s_me_wtenA;
    // CodAL signal/wire
    wire s_me_wtenB;
    // CodAL signal/wire
    wire [31:0] s_me_fwdA;
    // CodAL signal/wire
    wire [31:0] s_me_fwdB;
    // CodAL signal/wire
    wire [4:0] s_me_rdA;
    // CodAL signal/wire
    wire [4:0] s_me_rdB;
    // CodAL signal/wire
    wire s_wb_wtenA;
    // CodAL signal/wire
    wire s_wb_wtenB;
    // CodAL signal/wire
    wire [31:0] s_wb_fwdA;
    // CodAL signal/wire
    wire [31:0] s_wb_fwdB;
    // CodAL signal/wire
    wire [4:0] s_wb_rdA;
    // CodAL signal/wire
    wire [4:0] s_wb_rdB;

    // additional declarations:
    wire pipe_IF_STALL_Q_wire;
    wire id1_output_r_id1_pc_preserved_WE_wire;
    wire [31:0] id1_output_r_id1_pc_preserved_D_wire;
    wire [31:0] r_id1_pc_preserved_Q_wire;
    wire id1_output_r_id1_instr_preserved_WE_wire;
    wire [31:0] id1_output_r_id1_instr_preserved_D_wire;
    wire [31:0] r_id1_instr_preserved_Q_wire;
    wire id2_output_r_id2_pc_preserved_WE_wire;
    wire [31:0] id2_output_r_id2_pc_preserved_D_wire;
    wire [31:0] r_id2_pc_preserved_Q_wire;
    wire id2_output_r_id2_instr_preserved_WE_wire;
    wire [31:0] id2_output_r_id2_instr_preserved_D_wire;
    wire [31:0] r_id2_instr_preserved_Q_wire;
    wire pipe_ID1_CLEAR_Q_wire;
    wire pipe_ID1_STALL_Q_wire;
    wire if_output_r_id1_pc_WE_wire;
    wire [31:0] if_output_r_id1_pc_D_wire;
    wire [31:0] r_id1_pc_Q_wire;
    wire pipe_ID2_CLEAR_Q_wire;
    wire pipe_ID2_STALL_Q_wire;
    wire if_output_r_id2_pc_WE_wire;
    wire [31:0] if_output_r_id2_pc_D_wire;
    wire [31:0] r_id2_pc_Q_wire;
    wire pipe_EX1_CLEAR_Q_wire;
    wire pipe_EX1_STALL_Q_wire;
    wire id1_output_r_ex1_pc_WE_wire;
    wire [31:0] id1_output_r_ex1_pc_D_wire;
    wire [31:0] r_ex1_pc_Q_wire;
    wire id1_output_r_ex1_aluop_WE_wire;
    wire [3:0] id1_output_r_ex1_aluop_D_wire;
    wire [3:0] r_ex1_aluop_Q_wire;
    wire id1_output_r_ex1_alusrc1_WE_wire;
    wire [1:0] id1_output_r_ex1_alusrc1_D_wire;
    wire [1:0] r_ex1_alusrc1_Q_wire;
    wire id1_output_r_ex1_alusrc2_WE_wire;
    wire id1_output_r_ex1_alusrc2_D_wire;
    wire r_ex1_alusrc2_Q_wire;
    wire id1_output_r_ex1_regwrite_WE_wire;
    wire id1_output_r_ex1_regwrite_D_wire;
    wire r_ex1_regwrite_Q_wire;
    wire id1_output_r_ex1_rfwt_sel_WE_wire;
    wire [1:0] id1_output_r_ex1_rfwt_sel_D_wire;
    wire [1:0] r_ex1_rfwt_sel_Q_wire;
    wire id1_output_r_ex1_branchop_WE_wire;
    wire [2:0] id1_output_r_ex1_branchop_D_wire;
    wire [2:0] r_ex1_branchop_Q_wire;
    wire id1_output_r_ex1_brnch_sel_WE_wire;
    wire id1_output_r_ex1_brnch_sel_D_wire;
    wire r_ex1_brnch_sel_Q_wire;
    wire id1_output_r_ex1_memop_WE_wire;
    wire [3:0] id1_output_r_ex1_memop_D_wire;
    wire [3:0] r_ex1_memop_Q_wire;
    wire id1_output_r_ex1_rd_WE_wire;
    wire [4:0] id1_output_r_ex1_rd_D_wire;
    wire [4:0] r_ex1_rd_Q_wire;
    wire id1_output_r_ex1_rs1_WE_wire;
    wire [4:0] id1_output_r_ex1_rs1_D_wire;
    wire [4:0] r_ex1_rs1_Q_wire;
    wire id1_output_r_ex1_rs2_WE_wire;
    wire [4:0] id1_output_r_ex1_rs2_D_wire;
    wire [4:0] r_ex1_rs2_Q_wire;
    wire id1_output_r_ex1_reg1_WE_wire;
    wire [31:0] id1_output_r_ex1_reg1_D_wire;
    wire [31:0] r_ex1_reg1_Q_wire;
    wire id1_output_r_ex1_reg2_WE_wire;
    wire [31:0] id1_output_r_ex1_reg2_D_wire;
    wire [31:0] r_ex1_reg2_Q_wire;
    wire id1_output_r_ex1_immed_WE_wire;
    wire [31:0] id1_output_r_ex1_immed_D_wire;
    wire [31:0] r_ex1_immed_Q_wire;
    wire pipe_EX2_CLEAR_Q_wire;
    wire pipe_EX2_STALL_Q_wire;
    wire id2_output_r_ex2_pc_WE_wire;
    wire [31:0] id2_output_r_ex2_pc_D_wire;
    wire [31:0] r_ex2_pc_Q_wire;
    wire id2_output_r_ex2_aluop_WE_wire;
    wire [3:0] id2_output_r_ex2_aluop_D_wire;
    wire [3:0] r_ex2_aluop_Q_wire;
    wire id2_output_r_ex2_alusrc1_WE_wire;
    wire [1:0] id2_output_r_ex2_alusrc1_D_wire;
    wire [1:0] r_ex2_alusrc1_Q_wire;
    wire id2_output_r_ex2_alusrc2_WE_wire;
    wire id2_output_r_ex2_alusrc2_D_wire;
    wire r_ex2_alusrc2_Q_wire;
    wire id2_output_r_ex2_regwrite_WE_wire;
    wire id2_output_r_ex2_regwrite_D_wire;
    wire r_ex2_regwrite_Q_wire;
    wire id2_output_r_ex2_rfwt_sel_WE_wire;
    wire [1:0] id2_output_r_ex2_rfwt_sel_D_wire;
    wire [1:0] r_ex2_rfwt_sel_Q_wire;
    wire id2_output_r_ex2_branchop_WE_wire;
    wire [2:0] id2_output_r_ex2_branchop_D_wire;
    wire [2:0] r_ex2_branchop_Q_wire;
    wire id2_output_r_ex2_brnch_sel_WE_wire;
    wire id2_output_r_ex2_brnch_sel_D_wire;
    wire r_ex2_brnch_sel_Q_wire;
    wire id2_output_r_ex2_memop_WE_wire;
    wire [3:0] id2_output_r_ex2_memop_D_wire;
    wire [3:0] r_ex2_memop_Q_wire;
    wire id2_output_r_ex2_rd_WE_wire;
    wire [4:0] id2_output_r_ex2_rd_D_wire;
    wire [4:0] r_ex2_rd_Q_wire;
    wire id2_output_r_ex2_rs1_WE_wire;
    wire [4:0] id2_output_r_ex2_rs1_D_wire;
    wire [4:0] r_ex2_rs1_Q_wire;
    wire id2_output_r_ex2_rs2_WE_wire;
    wire [4:0] id2_output_r_ex2_rs2_D_wire;
    wire [4:0] r_ex2_rs2_Q_wire;
    wire id2_output_r_ex2_reg1_WE_wire;
    wire [31:0] id2_output_r_ex2_reg1_D_wire;
    wire [31:0] r_ex2_reg1_Q_wire;
    wire id2_output_r_ex2_reg2_WE_wire;
    wire [31:0] id2_output_r_ex2_reg2_D_wire;
    wire [31:0] r_ex2_reg2_Q_wire;
    wire id2_output_r_ex2_immed_WE_wire;
    wire [31:0] id2_output_r_ex2_immed_D_wire;
    wire [31:0] r_ex2_immed_Q_wire;
    wire pipe_ME1_CLEAR_Q_wire;
    wire pipe_ME1_STALL_Q_wire;
    wire ex1_output_r_me1_pc_WE_wire;
    wire [31:0] ex1_output_r_me1_pc_D_wire;
    wire [31:0] r_me1_pc_Q_wire;
    wire ex1_output_r_me1_regwrite_WE_wire;
    wire ex1_output_r_me1_regwrite_D_wire;
    wire r_me1_regwrite_Q_wire;
    wire ex1_output_r_me1_rfwt_sel_WE_wire;
    wire [1:0] ex1_output_r_me1_rfwt_sel_D_wire;
    wire [1:0] r_me1_rfwt_sel_Q_wire;
    wire ex1_output_r_me1_branchop_WE_wire;
    wire [2:0] ex1_output_r_me1_branchop_D_wire;
    wire [2:0] r_me1_branchop_Q_wire;
    wire ex1_output_r_me1_memop_WE_wire;
    wire [3:0] ex1_output_r_me1_memop_D_wire;
    wire [3:0] r_me1_memop_Q_wire;
    wire ex1_output_r_me1_rd_WE_wire;
    wire [4:0] ex1_output_r_me1_rd_D_wire;
    wire [4:0] r_me1_rd_Q_wire;
    wire ex1_output_r_me1_alu_WE_wire;
    wire [31:0] ex1_output_r_me1_alu_D_wire;
    wire [31:0] r_me1_alu_Q_wire;
    wire ex1_output_r_me1_bradd_WE_wire;
    wire [31:0] ex1_output_r_me1_bradd_D_wire;
    wire [31:0] r_me1_bradd_Q_wire;
    wire ex1_output_r_me1_wtdat_WE_wire;
    wire [31:0] ex1_output_r_me1_wtdat_D_wire;
    wire [31:0] r_me1_wtdat_Q_wire;
    wire ex1_output_r_me1_zero_WE_wire;
    wire ex1_output_r_me1_zero_D_wire;
    wire r_me1_zero_Q_wire;
    wire pipe_ME2_CLEAR_Q_wire;
    wire pipe_ME2_STALL_Q_wire;
    wire ex2_output_r_me2_pc_WE_wire;
    wire [31:0] ex2_output_r_me2_pc_D_wire;
    wire [31:0] r_me2_pc_Q_wire;
    wire ex2_output_r_me2_regwrite_WE_wire;
    wire ex2_output_r_me2_regwrite_D_wire;
    wire r_me2_regwrite_Q_wire;
    wire ex2_output_r_me2_rfwt_sel_WE_wire;
    wire [1:0] ex2_output_r_me2_rfwt_sel_D_wire;
    wire [1:0] r_me2_rfwt_sel_Q_wire;
    wire ex2_output_r_me2_branchop_WE_wire;
    wire [2:0] ex2_output_r_me2_branchop_D_wire;
    wire [2:0] r_me2_branchop_Q_wire;
    wire ex2_output_r_me2_memop_WE_wire;
    wire [3:0] ex2_output_r_me2_memop_D_wire;
    wire [3:0] r_me2_memop_Q_wire;
    wire ex2_output_r_me2_rd_WE_wire;
    wire [4:0] ex2_output_r_me2_rd_D_wire;
    wire [4:0] r_me2_rd_Q_wire;
    wire ex2_output_r_me2_alu_WE_wire;
    wire [31:0] ex2_output_r_me2_alu_D_wire;
    wire [31:0] r_me2_alu_Q_wire;
    wire ex2_output_r_me2_bradd_WE_wire;
    wire [31:0] ex2_output_r_me2_bradd_D_wire;
    wire [31:0] r_me2_bradd_Q_wire;
    wire ex2_output_r_me2_wtdat_WE_wire;
    wire [31:0] ex2_output_r_me2_wtdat_D_wire;
    wire [31:0] r_me2_wtdat_Q_wire;
    wire ex2_output_r_me2_zero_WE_wire;
    wire ex2_output_r_me2_zero_D_wire;
    wire r_me2_zero_Q_wire;
    wire pipe_WB1_CLEAR_Q_wire;
    wire pipe_WB1_STALL_Q_wire;
    wire me1_output_r_wb1_pc_WE_wire;
    wire [31:0] me1_output_r_wb1_pc_D_wire;
    wire [31:0] r_wb1_pc_Q_wire;
    wire me1_output_r_wb1_regwrite_WE_wire;
    wire me1_output_r_wb1_regwrite_D_wire;
    wire r_wb1_regwrite_Q_wire;
    wire me1_output_r_wb1_rfwt_sel_WE_wire;
    wire [1:0] me1_output_r_wb1_rfwt_sel_D_wire;
    wire [1:0] r_wb1_rfwt_sel_Q_wire;
    wire me1_output_r_wb1_rd_WE_wire;
    wire [4:0] me1_output_r_wb1_rd_D_wire;
    wire [4:0] r_wb1_rd_Q_wire;
    wire me1_output_r_wb1_alu_WE_wire;
    wire [31:0] me1_output_r_wb1_alu_D_wire;
    wire [31:0] r_wb1_alu_Q_wire;
    wire me1_output_r_wb1_memdat_WE_wire;
    wire [31:0] me1_output_r_wb1_memdat_D_wire;
    wire [31:0] r_wb1_memdat_Q_wire;
    wire pipe_WB2_CLEAR_Q_wire;
    wire pipe_WB2_STALL_Q_wire;
    wire me2_output_r_wb2_pc_WE_wire;
    wire [31:0] me2_output_r_wb2_pc_D_wire;
    wire [31:0] r_wb2_pc_Q_wire;
    wire me2_output_r_wb2_regwrite_WE_wire;
    wire me2_output_r_wb2_regwrite_D_wire;
    wire r_wb2_regwrite_Q_wire;
    wire me2_output_r_wb2_rfwt_sel_WE_wire;
    wire [1:0] me2_output_r_wb2_rfwt_sel_D_wire;
    wire [1:0] r_wb2_rfwt_sel_Q_wire;
    wire me2_output_r_wb2_rd_WE_wire;
    wire [4:0] me2_output_r_wb2_rd_D_wire;
    wire [4:0] r_wb2_rd_Q_wire;
    wire me2_output_r_wb2_alu_WE_wire;
    wire [31:0] me2_output_r_wb2_alu_D_wire;
    wire [31:0] r_wb2_alu_Q_wire;
    wire me2_output_r_wb2_memdat_WE_wire;
    wire [31:0] me2_output_r_wb2_memdat_D_wire;
    wire [31:0] r_wb2_memdat_Q_wire;
    wire flush_control_r_id1_stall_WE_wire;
    wire flush_control_r_id1_stall_D_wire;
    wire r_id1_stall_Q_wire;
    wire flush_control_r_id2_stall_WE_wire;
    wire flush_control_r_id2_stall_D_wire;
    wire r_id2_stall_Q_wire;
    wire flush_control_r_id_clear_WE_wire;
    wire flush_control_r_id_clear_D_wire;
    wire r_id_clear_Q_wire;
    wire if_output_r_order1_WE_wire;
    wire if_output_r_order1_D_wire;
    wire r_order1_Q_wire;
    wire if_output_r_order2_WE_wire;
    wire if_output_r_order2_D_wire;
    wire r_order2_Q_wire;
    wire if_output_r_id1_order_WE_wire;
    wire if_output_r_id1_order_D_wire;
    wire r_id1_order_Q_wire;
    wire if_output_r_id2_order_WE_wire;
    wire if_output_r_id2_order_D_wire;
    wire r_id2_order_Q_wire;
    wire id1_output_r_ex1_order_WE_wire;
    wire id1_output_r_ex1_order_D_wire;
    wire r_ex1_order_Q_wire;
    wire id2_output_r_ex2_order_WE_wire;
    wire id2_output_r_ex2_order_D_wire;
    wire r_ex2_order_Q_wire;
    wire ex1_output_r_me1_order_WE_wire;
    wire ex1_output_r_me1_order_D_wire;
    wire r_me1_order_Q_wire;
    wire ex2_output_r_me2_order_WE_wire;
    wire ex2_output_r_me2_order_D_wire;
    wire r_me2_order_Q_wire;
    wire me1_output_r_wb1_order_WE_wire;
    wire me1_output_r_wb1_order_D_wire;
    wire r_wb1_order_Q_wire;
    wire me2_output_r_wb2_order_WE_wire;
    wire me2_output_r_wb2_order_D_wire;
    wire r_wb2_order_Q_wire;
    wire id1_output_r_id1_order_preserved_WE_wire;
    wire id1_output_r_id1_order_preserved_D_wire;
    wire r_id1_order_preserved_Q_wire;
    wire id2_output_r_id2_order_preserved_WE_wire;
    wire id2_output_r_id2_order_preserved_D_wire;
    wire r_id2_order_preserved_Q_wire;
    wire if_output_r_id1_valid_WE_wire;
    wire if_output_r_id1_valid_D_wire;
    wire r_id1_valid_Q_wire;
    wire if_output_r_id2_valid_WE_wire;
    wire if_output_r_id2_valid_D_wire;
    wire r_id2_valid_Q_wire;
    wire id1_output_r_ex1_valid_WE_wire;
    wire id1_output_r_ex1_valid_D_wire;
    wire r_ex1_valid_Q_wire;
    wire id2_output_r_ex2_valid_WE_wire;
    wire id2_output_r_ex2_valid_D_wire;
    wire r_ex2_valid_Q_wire;
    wire ex1_output_r_me1_valid_WE_wire;
    wire ex1_output_r_me1_valid_D_wire;
    wire r_me1_valid_Q_wire;
    wire ex2_output_r_me2_valid_WE_wire;
    wire ex2_output_r_me2_valid_D_wire;
    wire r_me2_valid_Q_wire;
    wire me1_output_r_wb1_valid_WE_wire;
    wire me1_output_r_wb1_valid_D_wire;
    wire r_wb1_valid_Q_wire;
    wire me2_output_r_wb2_valid_WE_wire;
    wire me2_output_r_wb2_valid_D_wire;
    wire r_wb2_valid_Q_wire;
    wire ex_coordination_r_ex1_stall_WE_wire;
    wire ex_coordination_r_ex1_stall_D_wire;
    wire r_ex1_stall_Q_wire;
    wire ex1_output_r_ex1_reg1_preserved_WE_wire;
    wire [31:0] ex1_output_r_ex1_reg1_preserved_D_wire;
    wire [31:0] r_ex1_reg1_preserved_Q_wire;
    wire ex1_output_r_ex1_reg2_preserved_WE_wire;
    wire [31:0] ex1_output_r_ex1_reg2_preserved_D_wire;
    wire [31:0] r_ex1_reg2_preserved_Q_wire;
    wire ex_coordination_r_ex2_stall_WE_wire;
    wire ex_coordination_r_ex2_stall_D_wire;
    wire r_ex2_stall_Q_wire;
    wire ex2_output_r_ex2_reg1_preserved_WE_wire;
    wire [31:0] ex2_output_r_ex2_reg1_preserved_D_wire;
    wire [31:0] r_ex2_reg1_preserved_Q_wire;
    wire ex2_output_r_ex2_reg2_preserved_WE_wire;
    wire [31:0] ex2_output_r_ex2_reg2_preserved_D_wire;
    wire [31:0] r_ex2_reg2_preserved_Q_wire;
    wire r_pc_WE_wire;
    wire reset_r_pc_WE_wire;
    wire if_output_r_pc_WE_wire;
    wire [31:0] r_pc_D_wire;
    wire [31:0] reset_r_pc_D_wire;
    wire [31:0] if_output_r_pc_D_wire;
    wire [31:0] r_pc_Q_wire;
    wire id1_stage_rf_xpr_read0_RE_wire;
    wire [4:0] id1_stage_rf_xpr_read0_RA_wire;
    wire id1_stage_rf_xpr_read1_RE_wire;
    wire [4:0] id1_stage_rf_xpr_read1_RA_wire;
    wire id2_stage_rf_xpr_read2_RE_wire;
    wire [4:0] id2_stage_rf_xpr_read2_RA_wire;
    wire id2_stage_rf_xpr_read3_RE_wire;
    wire [4:0] id2_stage_rf_xpr_read3_RA_wire;
    wire wb1_stage_rf_xpr_wrt0_WE_wire;
    wire [4:0] wb1_stage_rf_xpr_wrt0_WA_wire;
    wire [31:0] wb1_stage_rf_xpr_wrt0_D_wire;
    wire wb2_stage_rf_xpr_wrt1_WE_wire;
    wire [4:0] wb2_stage_rf_xpr_wrt1_WA_wire;
    wire [31:0] wb2_stage_rf_xpr_wrt1_D_wire;
    wire [31:0] rf_xpr_read0_Q_wire;
    wire [31:0] rf_xpr_read1_Q_wire;
    wire [31:0] rf_xpr_read2_Q_wire;
    wire [31:0] rf_xpr_read3_Q_wire;
    wire ex_coordination_ex1_memory_ACT_wire;
    wire ex_coordination_ex1_output_ACT_wire;
    wire ex_coordination_ex2_memory_ACT_wire;
    wire ex_coordination_ex2_output_ACT_wire;
    wire id1_stage_id1_output_ACT_wire;
    wire id2_stage_id2_output_ACT_wire;
    wire me1_stage_me1_memory_ACT_wire;
    wire me1_stage_me1_output_ACT_wire;
    wire me2_stage_me2_memory_ACT_wire;
    wire me2_stage_me2_output_ACT_wire;
    wire main_flush_control_ACT_wire;
    wire main_ex_coordination_ACT_wire;
    wire main_id_coordination_ACT_wire;
    wire main_me_coordination_ACT_wire;
    wire main_wb_coordination_ACT_wire;
    wire main_pipeline_control_ACT_wire;
    wire pipeline_control_pipe_EX1_CLEAR_D_wire;
    wire pipeline_control_pipe_EX1_STALL_D_wire;
    wire pipeline_control_pipe_EX2_CLEAR_D_wire;
    wire pipeline_control_pipe_EX2_STALL_D_wire;
    wire pipeline_control_pipe_ID1_CLEAR_D_wire;
    wire pipeline_control_pipe_ID1_STALL_D_wire;
    wire pipeline_control_pipe_ID2_CLEAR_D_wire;
    wire pipeline_control_pipe_ID2_STALL_D_wire;
    wire pipeline_control_pipe_IF_STALL_D_wire;
    wire pipeline_control_pipe_ME1_CLEAR_D_wire;
    wire pipeline_control_pipe_ME1_STALL_D_wire;
    wire pipeline_control_pipe_ME2_CLEAR_D_wire;
    wire pipeline_control_pipe_ME2_STALL_D_wire;
    wire pipeline_control_pipe_WB1_CLEAR_D_wire;
    wire pipeline_control_pipe_WB1_STALL_D_wire;
    wire pipeline_control_pipe_WB2_CLEAR_D_wire;
    wire pipeline_control_pipe_WB2_STALL_D_wire;
    wire codasip_startup_ctrl_reset_ACT_wire;
    wire main_ex1_stage_ACT_wire;
    wire main_ex2_stage_ACT_wire;
    wire main_id1_stage_ACT_wire;
    wire id1_stage_decoder1_ACT_wire;
    wire [16:0] id1_stage_decoder1_codasip_param_0_wire;
    wire main_id2_stage_ACT_wire;
    wire id2_stage_decoder2_ACT_wire;
    wire [16:0] id2_stage_decoder2_codasip_param_0_wire;
    wire if_stage_if_output_ACT_wire;
    wire main_me1_stage_ACT_wire;
    wire main_me2_stage_ACT_wire;
    wire main_wb1_stage_ACT_wire;
    wire main_wb2_stage_ACT_wire;
    wire main_if_stage_ACT_wire;
    wire codasip_startup_ctrl_main_ACT_wire;

    // child instances inside ASIP core:
    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id1_pc_preserved (
        .CLK(CLK),
        .RST(RST),
        .STALL(pipe_IF_STALL_Q_wire),
        .WE(id1_output_r_id1_pc_preserved_WE_wire),
        .D(id1_output_r_id1_pc_preserved_D_wire),
        .Q(r_id1_pc_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id1_instr_preserved (
        .CLK(CLK),
        .RST(RST),
        .STALL(pipe_IF_STALL_Q_wire),
        .WE(id1_output_r_id1_instr_preserved_WE_wire),
        .D(id1_output_r_id1_instr_preserved_D_wire),
        .Q(r_id1_instr_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id2_pc_preserved (
        .CLK(CLK),
        .RST(RST),
        .STALL(pipe_IF_STALL_Q_wire),
        .WE(id2_output_r_id2_pc_preserved_WE_wire),
        .D(id2_output_r_id2_pc_preserved_D_wire),
        .Q(r_id2_pc_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id2_instr_preserved (
        .CLK(CLK),
        .RST(RST),
        .STALL(pipe_IF_STALL_Q_wire),
        .WE(id2_output_r_id2_instr_preserved_WE_wire),
        .D(id2_output_r_id2_instr_preserved_D_wire),
        .Q(r_id2_instr_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id1_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ID1_CLEAR_Q_wire),
        .STALL(pipe_ID1_STALL_Q_wire),
        .WE(if_output_r_id1_pc_WE_wire),
        .D(if_output_r_id1_pc_D_wire),
        .Q(r_id1_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id2_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ID2_CLEAR_Q_wire),
        .STALL(pipe_ID2_STALL_Q_wire),
        .WE(if_output_r_id2_pc_WE_wire),
        .D(if_output_r_id2_pc_D_wire),
        .Q(r_id2_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_pc_WE_wire),
        .D(id1_output_r_ex1_pc_D_wire),
        .Q(r_ex1_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(ALUOP)
    ) r_ex1_aluop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_aluop_WE_wire),
        .D(id1_output_r_ex1_aluop_D_wire),
        .Q(r_ex1_aluop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(ALUSRC1)
    ) r_ex1_alusrc1 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_alusrc1_WE_wire),
        .D(id1_output_r_ex1_alusrc1_D_wire),
        .Q(r_ex1_alusrc1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        , .CS(ALUSRC2)
    ) r_ex1_alusrc2 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_alusrc2_WE_wire),
        .D(id1_output_r_ex1_alusrc2_D_wire),
        .Q(r_ex1_alusrc2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(REGWRITE)
    ) r_ex1_regwrite (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_regwrite_WE_wire),
        .D(id1_output_r_ex1_regwrite_D_wire),
        .Q(r_ex1_regwrite_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(RFWT_SEL)
    ) r_ex1_rfwt_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_rfwt_sel_WE_wire),
        .D(id1_output_r_ex1_rfwt_sel_D_wire),
        .Q(r_ex1_rfwt_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(BRANCHOP)
    ) r_ex1_branchop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_branchop_WE_wire),
        .D(id1_output_r_ex1_branchop_D_wire),
        .Q(r_ex1_branchop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(BRNCH_SEL)
    ) r_ex1_brnch_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_brnch_sel_WE_wire),
        .D(id1_output_r_ex1_brnch_sel_D_wire),
        .Q(r_ex1_brnch_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(MEM_OP)
    ) r_ex1_memop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_memop_WE_wire),
        .D(id1_output_r_ex1_memop_D_wire),
        .Q(r_ex1_memop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_ex1_rd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_rd_WE_wire),
        .D(id1_output_r_ex1_rd_D_wire),
        .Q(r_ex1_rd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_ex1_rs1 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_rs1_WE_wire),
        .D(id1_output_r_ex1_rs1_D_wire),
        .Q(r_ex1_rs1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_ex1_rs2 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_rs2_WE_wire),
        .D(id1_output_r_ex1_rs2_D_wire),
        .Q(r_ex1_rs2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_reg1 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_reg1_WE_wire),
        .D(id1_output_r_ex1_reg1_D_wire),
        .Q(r_ex1_reg1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_reg2 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_reg2_WE_wire),
        .D(id1_output_r_ex1_reg2_D_wire),
        .Q(r_ex1_reg2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_immed (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_immed_WE_wire),
        .D(id1_output_r_ex1_immed_D_wire),
        .Q(r_ex1_immed_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex2_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_pc_WE_wire),
        .D(id2_output_r_ex2_pc_D_wire),
        .Q(r_ex2_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(ALUOP)
    ) r_ex2_aluop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_aluop_WE_wire),
        .D(id2_output_r_ex2_aluop_D_wire),
        .Q(r_ex2_aluop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(ALUSRC1)
    ) r_ex2_alusrc1 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_alusrc1_WE_wire),
        .D(id2_output_r_ex2_alusrc1_D_wire),
        .Q(r_ex2_alusrc1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        , .CS(ALUSRC2)
    ) r_ex2_alusrc2 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_alusrc2_WE_wire),
        .D(id2_output_r_ex2_alusrc2_D_wire),
        .Q(r_ex2_alusrc2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(REGWRITE)
    ) r_ex2_regwrite (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_regwrite_WE_wire),
        .D(id2_output_r_ex2_regwrite_D_wire),
        .Q(r_ex2_regwrite_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(RFWT_SEL)
    ) r_ex2_rfwt_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_rfwt_sel_WE_wire),
        .D(id2_output_r_ex2_rfwt_sel_D_wire),
        .Q(r_ex2_rfwt_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(BRANCHOP)
    ) r_ex2_branchop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_branchop_WE_wire),
        .D(id2_output_r_ex2_branchop_D_wire),
        .Q(r_ex2_branchop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(BRNCH_SEL)
    ) r_ex2_brnch_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_brnch_sel_WE_wire),
        .D(id2_output_r_ex2_brnch_sel_D_wire),
        .Q(r_ex2_brnch_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(MEM_OP)
    ) r_ex2_memop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_memop_WE_wire),
        .D(id2_output_r_ex2_memop_D_wire),
        .Q(r_ex2_memop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_ex2_rd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_rd_WE_wire),
        .D(id2_output_r_ex2_rd_D_wire),
        .Q(r_ex2_rd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_ex2_rs1 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_rs1_WE_wire),
        .D(id2_output_r_ex2_rs1_D_wire),
        .Q(r_ex2_rs1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_ex2_rs2 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_rs2_WE_wire),
        .D(id2_output_r_ex2_rs2_D_wire),
        .Q(r_ex2_rs2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex2_reg1 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_reg1_WE_wire),
        .D(id2_output_r_ex2_reg1_D_wire),
        .Q(r_ex2_reg1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex2_reg2 (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_reg2_WE_wire),
        .D(id2_output_r_ex2_reg2_D_wire),
        .Q(r_ex2_reg2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex2_immed (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_immed_WE_wire),
        .D(id2_output_r_ex2_immed_D_wire),
        .Q(r_ex2_immed_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me1_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_pc_WE_wire),
        .D(ex1_output_r_me1_pc_D_wire),
        .Q(r_me1_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(REGWRITE)
    ) r_me1_regwrite (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_regwrite_WE_wire),
        .D(ex1_output_r_me1_regwrite_D_wire),
        .Q(r_me1_regwrite_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(RFWT_SEL)
    ) r_me1_rfwt_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_rfwt_sel_WE_wire),
        .D(ex1_output_r_me1_rfwt_sel_D_wire),
        .Q(r_me1_rfwt_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(BRANCHOP)
    ) r_me1_branchop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_branchop_WE_wire),
        .D(ex1_output_r_me1_branchop_D_wire),
        .Q(r_me1_branchop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(MEM_OP)
    ) r_me1_memop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_memop_WE_wire),
        .D(ex1_output_r_me1_memop_D_wire),
        .Q(r_me1_memop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_me1_rd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_rd_WE_wire),
        .D(ex1_output_r_me1_rd_D_wire),
        .Q(r_me1_rd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me1_alu (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_alu_WE_wire),
        .D(ex1_output_r_me1_alu_D_wire),
        .Q(r_me1_alu_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me1_bradd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_bradd_WE_wire),
        .D(ex1_output_r_me1_bradd_D_wire),
        .Q(r_me1_bradd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me1_wtdat (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_wtdat_WE_wire),
        .D(ex1_output_r_me1_wtdat_D_wire),
        .Q(r_me1_wtdat_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me1_zero (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_zero_WE_wire),
        .D(ex1_output_r_me1_zero_D_wire),
        .Q(r_me1_zero_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me2_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_pc_WE_wire),
        .D(ex2_output_r_me2_pc_D_wire),
        .Q(r_me2_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(REGWRITE)
    ) r_me2_regwrite (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_regwrite_WE_wire),
        .D(ex2_output_r_me2_regwrite_D_wire),
        .Q(r_me2_regwrite_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(RFWT_SEL)
    ) r_me2_rfwt_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_rfwt_sel_WE_wire),
        .D(ex2_output_r_me2_rfwt_sel_D_wire),
        .Q(r_me2_rfwt_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd3),
        .DEFAULT_VALUE(3'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(BRANCHOP)
    ) r_me2_branchop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_branchop_WE_wire),
        .D(ex2_output_r_me2_branchop_D_wire),
        .Q(r_me2_branchop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd4),
        .DEFAULT_VALUE(4'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(MEM_OP)
    ) r_me2_memop (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_memop_WE_wire),
        .D(ex2_output_r_me2_memop_D_wire),
        .Q(r_me2_memop_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_me2_rd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_rd_WE_wire),
        .D(ex2_output_r_me2_rd_D_wire),
        .Q(r_me2_rd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me2_alu (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_alu_WE_wire),
        .D(ex2_output_r_me2_alu_D_wire),
        .Q(r_me2_alu_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me2_bradd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_bradd_WE_wire),
        .D(ex2_output_r_me2_bradd_D_wire),
        .Q(r_me2_bradd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me2_wtdat (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_wtdat_WE_wire),
        .D(ex2_output_r_me2_wtdat_D_wire),
        .Q(r_me2_wtdat_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me2_zero (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_zero_WE_wire),
        .D(ex2_output_r_me2_zero_D_wire),
        .Q(r_me2_zero_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb1_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB1_CLEAR_Q_wire),
        .STALL(pipe_WB1_STALL_Q_wire),
        .WE(me1_output_r_wb1_pc_WE_wire),
        .D(me1_output_r_wb1_pc_D_wire),
        .Q(r_wb1_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(REGWRITE)
    ) r_wb1_regwrite (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB1_CLEAR_Q_wire),
        .STALL(pipe_WB1_STALL_Q_wire),
        .WE(me1_output_r_wb1_regwrite_WE_wire),
        .D(me1_output_r_wb1_regwrite_D_wire),
        .Q(r_wb1_regwrite_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(RFWT_SEL)
    ) r_wb1_rfwt_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB1_CLEAR_Q_wire),
        .STALL(pipe_WB1_STALL_Q_wire),
        .WE(me1_output_r_wb1_rfwt_sel_WE_wire),
        .D(me1_output_r_wb1_rfwt_sel_D_wire),
        .Q(r_wb1_rfwt_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_wb1_rd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB1_CLEAR_Q_wire),
        .STALL(pipe_WB1_STALL_Q_wire),
        .WE(me1_output_r_wb1_rd_WE_wire),
        .D(me1_output_r_wb1_rd_D_wire),
        .Q(r_wb1_rd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb1_alu (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB1_CLEAR_Q_wire),
        .STALL(pipe_WB1_STALL_Q_wire),
        .WE(me1_output_r_wb1_alu_WE_wire),
        .D(me1_output_r_wb1_alu_D_wire),
        .Q(r_wb1_alu_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb1_memdat (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB1_CLEAR_Q_wire),
        .STALL(pipe_WB1_STALL_Q_wire),
        .WE(me1_output_r_wb1_memdat_WE_wire),
        .D(me1_output_r_wb1_memdat_D_wire),
        .Q(r_wb1_memdat_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb2_pc (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB2_CLEAR_Q_wire),
        .STALL(pipe_WB2_STALL_Q_wire),
        .WE(me2_output_r_wb2_pc_WE_wire),
        .D(me2_output_r_wb2_pc_D_wire),
        .Q(r_wb2_pc_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(REGWRITE)
    ) r_wb2_regwrite (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB2_CLEAR_Q_wire),
        .STALL(pipe_WB2_STALL_Q_wire),
        .WE(me2_output_r_wb2_regwrite_WE_wire),
        .D(me2_output_r_wb2_regwrite_D_wire),
        .Q(r_wb2_regwrite_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd2),
        .DEFAULT_VALUE(2'h0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(RFWT_SEL)
    ) r_wb2_rfwt_sel (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB2_CLEAR_Q_wire),
        .STALL(pipe_WB2_STALL_Q_wire),
        .WE(me2_output_r_wb2_rfwt_sel_WE_wire),
        .D(me2_output_r_wb2_rfwt_sel_D_wire),
        .Q(r_wb2_rfwt_sel_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd5),
        .DEFAULT_VALUE(5'h00),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
        ,.CS(XPR)
    ) r_wb2_rd (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB2_CLEAR_Q_wire),
        .STALL(pipe_WB2_STALL_Q_wire),
        .WE(me2_output_r_wb2_rd_WE_wire),
        .D(me2_output_r_wb2_rd_D_wire),
        .Q(r_wb2_rd_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb2_alu (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB2_CLEAR_Q_wire),
        .STALL(pipe_WB2_STALL_Q_wire),
        .WE(me2_output_r_wb2_alu_WE_wire),
        .D(me2_output_r_wb2_alu_D_wire),
        .Q(r_wb2_alu_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb2_memdat (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB2_CLEAR_Q_wire),
        .STALL(pipe_WB2_STALL_Q_wire),
        .WE(me2_output_r_wb2_memdat_WE_wire),
        .D(me2_output_r_wb2_memdat_D_wire),
        .Q(r_wb2_memdat_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id1_stall (
        .CLK(CLK),
        .RST(RST),
        .WE(flush_control_r_id1_stall_WE_wire),
        .D(flush_control_r_id1_stall_D_wire),
        .Q(r_id1_stall_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id2_stall (
        .CLK(CLK),
        .RST(RST),
        .WE(flush_control_r_id2_stall_WE_wire),
        .D(flush_control_r_id2_stall_D_wire),
        .Q(r_id2_stall_Q_wire)
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
        .WE(flush_control_r_id_clear_WE_wire),
        .D(flush_control_r_id_clear_D_wire),
        .Q(r_id_clear_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_order1 (
        .CLK(CLK),
        .RST(RST),
        .WE(if_output_r_order1_WE_wire),
        .D(if_output_r_order1_D_wire),
        .Q(r_order1_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_order2 (
        .CLK(CLK),
        .RST(RST),
        .WE(if_output_r_order2_WE_wire),
        .D(if_output_r_order2_D_wire),
        .Q(r_order2_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id1_order (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ID1_CLEAR_Q_wire),
        .STALL(pipe_ID1_STALL_Q_wire),
        .WE(if_output_r_id1_order_WE_wire),
        .D(if_output_r_id1_order_D_wire),
        .Q(r_id1_order_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id2_order (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ID2_CLEAR_Q_wire),
        .STALL(pipe_ID2_STALL_Q_wire),
        .WE(if_output_r_id2_order_WE_wire),
        .D(if_output_r_id2_order_D_wire),
        .Q(r_id2_order_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_order (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_order_WE_wire),
        .D(id1_output_r_ex1_order_D_wire),
        .Q(r_ex1_order_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex2_order (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_order_WE_wire),
        .D(id2_output_r_ex2_order_D_wire),
        .Q(r_ex2_order_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me1_order (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_order_WE_wire),
        .D(ex1_output_r_me1_order_D_wire),
        .Q(r_me1_order_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me2_order (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_order_WE_wire),
        .D(ex2_output_r_me2_order_D_wire),
        .Q(r_me2_order_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb1_order (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB1_CLEAR_Q_wire),
        .STALL(pipe_WB1_STALL_Q_wire),
        .WE(me1_output_r_wb1_order_WE_wire),
        .D(me1_output_r_wb1_order_D_wire),
        .Q(r_wb1_order_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb2_order (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB2_CLEAR_Q_wire),
        .STALL(pipe_WB2_STALL_Q_wire),
        .WE(me2_output_r_wb2_order_WE_wire),
        .D(me2_output_r_wb2_order_D_wire),
        .Q(r_wb2_order_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id1_order_preserved (
        .CLK(CLK),
        .RST(RST),
        .STALL(pipe_IF_STALL_Q_wire),
        .WE(id1_output_r_id1_order_preserved_WE_wire),
        .D(id1_output_r_id1_order_preserved_D_wire),
        .Q(r_id1_order_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id2_order_preserved (
        .CLK(CLK),
        .RST(RST),
        .STALL(pipe_IF_STALL_Q_wire),
        .WE(id2_output_r_id2_order_preserved_WE_wire),
        .D(id2_output_r_id2_order_preserved_D_wire),
        .Q(r_id2_order_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id1_valid (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ID1_CLEAR_Q_wire),
        .STALL(pipe_ID1_STALL_Q_wire),
        .WE(if_output_r_id1_valid_WE_wire),
        .D(if_output_r_id1_valid_D_wire),
        .Q(r_id1_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_id2_valid (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ID2_CLEAR_Q_wire),
        .STALL(pipe_ID2_STALL_Q_wire),
        .WE(if_output_r_id2_valid_WE_wire),
        .D(if_output_r_id2_valid_D_wire),
        .Q(r_id2_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_valid (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX1_CLEAR_Q_wire),
        .STALL(pipe_EX1_STALL_Q_wire),
        .WE(id1_output_r_ex1_valid_WE_wire),
        .D(id1_output_r_ex1_valid_D_wire),
        .Q(r_ex1_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex2_valid (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_EX2_CLEAR_Q_wire),
        .STALL(pipe_EX2_STALL_Q_wire),
        .WE(id2_output_r_ex2_valid_WE_wire),
        .D(id2_output_r_ex2_valid_D_wire),
        .Q(r_ex2_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me1_valid (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME1_CLEAR_Q_wire),
        .STALL(pipe_ME1_STALL_Q_wire),
        .WE(ex1_output_r_me1_valid_WE_wire),
        .D(ex1_output_r_me1_valid_D_wire),
        .Q(r_me1_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_me2_valid (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_ME2_CLEAR_Q_wire),
        .STALL(pipe_ME2_STALL_Q_wire),
        .WE(ex2_output_r_me2_valid_WE_wire),
        .D(ex2_output_r_me2_valid_D_wire),
        .Q(r_me2_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb1_valid (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB1_CLEAR_Q_wire),
        .STALL(pipe_WB1_STALL_Q_wire),
        .WE(me1_output_r_wb1_valid_WE_wire),
        .D(me1_output_r_wb1_valid_D_wire),
        .Q(r_wb1_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_stall_clr_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_wb2_valid (
        .CLK(CLK),
        .RST(RST),
        .CLEAR(pipe_WB2_CLEAR_Q_wire),
        .STALL(pipe_WB2_STALL_Q_wire),
        .WE(me2_output_r_wb2_valid_WE_wire),
        .D(me2_output_r_wb2_valid_D_wire),
        .Q(r_wb2_valid_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_stall (
        .CLK(CLK),
        .RST(RST),
        .WE(ex_coordination_r_ex1_stall_WE_wire),
        .D(ex_coordination_r_ex1_stall_D_wire),
        .Q(r_ex1_stall_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_reg1_preserved (
        .CLK(CLK),
        .RST(RST),
        .WE(ex1_output_r_ex1_reg1_preserved_WE_wire),
        .D(ex1_output_r_ex1_reg1_preserved_D_wire),
        .Q(r_ex1_reg1_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex1_reg2_preserved (
        .CLK(CLK),
        .RST(RST),
        .WE(ex1_output_r_ex1_reg2_preserved_WE_wire),
        .D(ex1_output_r_ex1_reg2_preserved_D_wire),
        .Q(r_ex1_reg2_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex2_stall (
        .CLK(CLK),
        .RST(RST),
        .WE(ex_coordination_r_ex2_stall_WE_wire),
        .D(ex_coordination_r_ex2_stall_D_wire),
        .Q(r_ex2_stall_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex2_reg1_preserved (
        .CLK(CLK),
        .RST(RST),
        .WE(ex2_output_r_ex2_reg1_preserved_WE_wire),
        .D(ex2_output_r_ex2_reg1_preserved_D_wire),
        .Q(r_ex2_reg1_preserved_Q_wire)
    );

    // register instance:
    d_ff_rst_we_t #(
        .BIT_WIDTH(32'sd32),
        .DEFAULT_VALUE(32'h00000000),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) r_ex2_reg2_preserved (
        .CLK(CLK),
        .RST(RST),
        .WE(ex2_output_r_ex2_reg2_preserved_WE_wire),
        .D(ex2_output_r_ex2_reg2_preserved_D_wire),
        .Q(r_ex2_reg2_preserved_Q_wire)
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
    rf_xpr_t rf_xpr (
        .CLK(CLK),
        .RST(RST),
        .read0_RE(id1_stage_rf_xpr_read0_RE_wire),
        .read0_RA(id1_stage_rf_xpr_read0_RA_wire),
        .read1_RE(id1_stage_rf_xpr_read1_RE_wire),
        .read1_RA(id1_stage_rf_xpr_read1_RA_wire),
        .read2_RE(id2_stage_rf_xpr_read2_RE_wire),
        .read2_RA(id2_stage_rf_xpr_read2_RA_wire),
        .read3_RE(id2_stage_rf_xpr_read3_RE_wire),
        .read3_RA(id2_stage_rf_xpr_read3_RA_wire),
        .wrt0_WE(wb1_stage_rf_xpr_wrt0_WE_wire),
        .wrt0_WA(wb1_stage_rf_xpr_wrt0_WA_wire),
        .wrt0_D(wb1_stage_rf_xpr_wrt0_D_wire),
        .wrt1_WE(wb2_stage_rf_xpr_wrt1_WE_wire),
        .wrt1_WA(wb2_stage_rf_xpr_wrt1_WA_wire),
        .wrt1_D(wb2_stage_rf_xpr_wrt1_D_wire),
        .read0_Q(rf_xpr_read0_Q_wire),
        .read1_Q(rf_xpr_read1_Q_wire),
        .read2_Q(rf_xpr_read2_Q_wire),
        .read3_Q(rf_xpr_read3_Q_wire)
    );

    // functional unit instance:
    ex1_memory_t ex1_memory (
        .ACT(ex_coordination_ex1_memory_ACT_wire),
        .r_ex1_memop_Q(r_ex1_memop_Q_wire),
        .s_ex1_alu_Q(s_ex1_alu),
        .s_ex1_memsize_Q(s_ex1_memsize),
        .s_ex1_reg2_Q(s_ex1_reg2),
        .s_ex1_stall_Q(s_ex1_stall),
        .ldst1_ahb_HADDR(ldst1_ahb_HADDR),
        .ldst1_ahb_HBURST(ldst1_ahb_HBURST),
        .ldst1_ahb_HMASTLOCK(ldst1_ahb_HMASTLOCK),
        .ldst1_ahb_HPROT(ldst1_ahb_HPROT),
        .ldst1_ahb_HSIZE(ldst1_ahb_HSIZE),
        .ldst1_ahb_HTRANS(ldst1_ahb_HTRANS),
        .ldst1_ahb_HWRITE(ldst1_ahb_HWRITE),
        .s_ex1_encoded_D(s_ex1_encoded),
        .s_ex1_memsize_D(s_ex1_memsize)
    );

    // functional unit instance:
    ex1_output_t ex1_output (
        .ACT(ex_coordination_ex1_output_ACT_wire),
        .r_ex1_branchop_Q(r_ex1_branchop_Q_wire),
        .r_ex1_memop_Q(r_ex1_memop_Q_wire),
        .r_ex1_order_Q(r_ex1_order_Q_wire),
        .r_ex1_pc_Q(r_ex1_pc_Q_wire),
        .r_ex1_rd_Q(r_ex1_rd_Q_wire),
        .r_ex1_regwrite_Q(r_ex1_regwrite_Q_wire),
        .r_ex1_rfwt_sel_Q(r_ex1_rfwt_sel_Q_wire),
        .r_ex1_valid_Q(r_ex1_valid_Q_wire),
        .s_ex1_alu_Q(s_ex1_alu),
        .s_ex1_bradd_Q(s_ex1_bradd),
        .s_ex1_encoded_Q(s_ex1_encoded),
        .s_ex1_reg1_Q(s_ex1_reg1),
        .s_ex1_reg2_Q(s_ex1_reg2),
        .s_ex1_zero_Q(s_ex1_zero),
        .r_ex1_reg1_preserved_D(ex1_output_r_ex1_reg1_preserved_D_wire),
        .r_ex1_reg1_preserved_WE(ex1_output_r_ex1_reg1_preserved_WE_wire),
        .r_ex1_reg2_preserved_D(ex1_output_r_ex1_reg2_preserved_D_wire),
        .r_ex1_reg2_preserved_WE(ex1_output_r_ex1_reg2_preserved_WE_wire),
        .r_me1_alu_D(ex1_output_r_me1_alu_D_wire),
        .r_me1_alu_WE(ex1_output_r_me1_alu_WE_wire),
        .r_me1_bradd_D(ex1_output_r_me1_bradd_D_wire),
        .r_me1_bradd_WE(ex1_output_r_me1_bradd_WE_wire),
        .r_me1_branchop_D(ex1_output_r_me1_branchop_D_wire),
        .r_me1_branchop_WE(ex1_output_r_me1_branchop_WE_wire),
        .r_me1_memop_D(ex1_output_r_me1_memop_D_wire),
        .r_me1_memop_WE(ex1_output_r_me1_memop_WE_wire),
        .r_me1_order_D(ex1_output_r_me1_order_D_wire),
        .r_me1_order_WE(ex1_output_r_me1_order_WE_wire),
        .r_me1_pc_D(ex1_output_r_me1_pc_D_wire),
        .r_me1_pc_WE(ex1_output_r_me1_pc_WE_wire),
        .r_me1_rd_D(ex1_output_r_me1_rd_D_wire),
        .r_me1_rd_WE(ex1_output_r_me1_rd_WE_wire),
        .r_me1_regwrite_D(ex1_output_r_me1_regwrite_D_wire),
        .r_me1_regwrite_WE(ex1_output_r_me1_regwrite_WE_wire),
        .r_me1_rfwt_sel_D(ex1_output_r_me1_rfwt_sel_D_wire),
        .r_me1_rfwt_sel_WE(ex1_output_r_me1_rfwt_sel_WE_wire),
        .r_me1_valid_D(ex1_output_r_me1_valid_D_wire),
        .r_me1_valid_WE(ex1_output_r_me1_valid_WE_wire),
        .r_me1_wtdat_D(ex1_output_r_me1_wtdat_D_wire),
        .r_me1_wtdat_WE(ex1_output_r_me1_wtdat_WE_wire),
        .r_me1_zero_D(ex1_output_r_me1_zero_D_wire),
        .r_me1_zero_WE(ex1_output_r_me1_zero_WE_wire)
    );

    // functional unit instance:
    ex2_memory_t ex2_memory (
        .ACT(ex_coordination_ex2_memory_ACT_wire),
        .r_ex2_memop_Q(r_ex2_memop_Q_wire),
        .s_ex2_alu_Q(s_ex2_alu),
        .s_ex2_memsize_Q(s_ex2_memsize),
        .s_ex2_reg2_Q(s_ex2_reg2),
        .s_ex2_stall_Q(s_ex2_stall),
        .ldst2_ahb_HADDR(ldst2_ahb_HADDR),
        .ldst2_ahb_HBURST(ldst2_ahb_HBURST),
        .ldst2_ahb_HMASTLOCK(ldst2_ahb_HMASTLOCK),
        .ldst2_ahb_HPROT(ldst2_ahb_HPROT),
        .ldst2_ahb_HSIZE(ldst2_ahb_HSIZE),
        .ldst2_ahb_HTRANS(ldst2_ahb_HTRANS),
        .ldst2_ahb_HWRITE(ldst2_ahb_HWRITE),
        .s_ex2_encoded_D(s_ex2_encoded),
        .s_ex2_memsize_D(s_ex2_memsize)
    );

    // functional unit instance:
    ex2_output_t ex2_output (
        .ACT(ex_coordination_ex2_output_ACT_wire),
        .r_ex2_branchop_Q(r_ex2_branchop_Q_wire),
        .r_ex2_memop_Q(r_ex2_memop_Q_wire),
        .r_ex2_order_Q(r_ex2_order_Q_wire),
        .r_ex2_pc_Q(r_ex2_pc_Q_wire),
        .r_ex2_rd_Q(r_ex2_rd_Q_wire),
        .r_ex2_regwrite_Q(r_ex2_regwrite_Q_wire),
        .r_ex2_rfwt_sel_Q(r_ex2_rfwt_sel_Q_wire),
        .r_ex2_valid_Q(r_ex2_valid_Q_wire),
        .s_ex2_alu_Q(s_ex2_alu),
        .s_ex2_bradd_Q(s_ex2_bradd),
        .s_ex2_encoded_Q(s_ex2_encoded),
        .s_ex2_reg1_Q(s_ex2_reg1),
        .s_ex2_reg2_Q(s_ex2_reg2),
        .s_ex2_zero_Q(s_ex2_zero),
        .r_ex2_reg1_preserved_D(ex2_output_r_ex2_reg1_preserved_D_wire),
        .r_ex2_reg1_preserved_WE(ex2_output_r_ex2_reg1_preserved_WE_wire),
        .r_ex2_reg2_preserved_D(ex2_output_r_ex2_reg2_preserved_D_wire),
        .r_ex2_reg2_preserved_WE(ex2_output_r_ex2_reg2_preserved_WE_wire),
        .r_me2_alu_D(ex2_output_r_me2_alu_D_wire),
        .r_me2_alu_WE(ex2_output_r_me2_alu_WE_wire),
        .r_me2_bradd_D(ex2_output_r_me2_bradd_D_wire),
        .r_me2_bradd_WE(ex2_output_r_me2_bradd_WE_wire),
        .r_me2_branchop_D(ex2_output_r_me2_branchop_D_wire),
        .r_me2_branchop_WE(ex2_output_r_me2_branchop_WE_wire),
        .r_me2_memop_D(ex2_output_r_me2_memop_D_wire),
        .r_me2_memop_WE(ex2_output_r_me2_memop_WE_wire),
        .r_me2_order_D(ex2_output_r_me2_order_D_wire),
        .r_me2_order_WE(ex2_output_r_me2_order_WE_wire),
        .r_me2_pc_D(ex2_output_r_me2_pc_D_wire),
        .r_me2_pc_WE(ex2_output_r_me2_pc_WE_wire),
        .r_me2_rd_D(ex2_output_r_me2_rd_D_wire),
        .r_me2_rd_WE(ex2_output_r_me2_rd_WE_wire),
        .r_me2_regwrite_D(ex2_output_r_me2_regwrite_D_wire),
        .r_me2_regwrite_WE(ex2_output_r_me2_regwrite_WE_wire),
        .r_me2_rfwt_sel_D(ex2_output_r_me2_rfwt_sel_D_wire),
        .r_me2_rfwt_sel_WE(ex2_output_r_me2_rfwt_sel_WE_wire),
        .r_me2_valid_D(ex2_output_r_me2_valid_D_wire),
        .r_me2_valid_WE(ex2_output_r_me2_valid_WE_wire),
        .r_me2_wtdat_D(ex2_output_r_me2_wtdat_D_wire),
        .r_me2_wtdat_WE(ex2_output_r_me2_wtdat_WE_wire),
        .r_me2_zero_D(ex2_output_r_me2_zero_D_wire),
        .r_me2_zero_WE(ex2_output_r_me2_zero_WE_wire)
    );

    // functional unit instance:
    id1_output_t id1_output (
        .ACT(id1_stage_id1_output_ACT_wire),
        .r_id1_valid_Q(r_id1_valid_Q_wire),
        .s_id1_aluop_Q(s_id1_aluop),
        .s_id1_alusrc1_Q(s_id1_alusrc1),
        .s_id1_alusrc2_Q(s_id1_alusrc2),
        .s_id1_branchop_Q(s_id1_branchop),
        .s_id1_brnch_sel_Q(s_id1_brnch_sel),
        .s_id1_immed_Q(s_id1_immed),
        .s_id1_instr_Q(s_id1_instr),
        .s_id1_memop_Q(s_id1_memop),
        .s_id1_order_Q(s_id1_order),
        .s_id1_pc_Q(s_id1_pc),
        .s_id1_rd_Q(s_id1_rd),
        .s_id1_reg1_Q(s_id1_reg1),
        .s_id1_reg2_Q(s_id1_reg2),
        .s_id1_regwrite_Q(s_id1_regwrite),
        .s_id1_rfwt_sel_Q(s_id1_rfwt_sel),
        .s_id1_rs1_Q(s_id1_rs1),
        .s_id1_rs2_Q(s_id1_rs2),
        .r_ex1_aluop_D(id1_output_r_ex1_aluop_D_wire),
        .r_ex1_aluop_WE(id1_output_r_ex1_aluop_WE_wire),
        .r_ex1_alusrc1_D(id1_output_r_ex1_alusrc1_D_wire),
        .r_ex1_alusrc1_WE(id1_output_r_ex1_alusrc1_WE_wire),
        .r_ex1_alusrc2_D(id1_output_r_ex1_alusrc2_D_wire),
        .r_ex1_alusrc2_WE(id1_output_r_ex1_alusrc2_WE_wire),
        .r_ex1_branchop_D(id1_output_r_ex1_branchop_D_wire),
        .r_ex1_branchop_WE(id1_output_r_ex1_branchop_WE_wire),
        .r_ex1_brnch_sel_D(id1_output_r_ex1_brnch_sel_D_wire),
        .r_ex1_brnch_sel_WE(id1_output_r_ex1_brnch_sel_WE_wire),
        .r_ex1_immed_D(id1_output_r_ex1_immed_D_wire),
        .r_ex1_immed_WE(id1_output_r_ex1_immed_WE_wire),
        .r_ex1_memop_D(id1_output_r_ex1_memop_D_wire),
        .r_ex1_memop_WE(id1_output_r_ex1_memop_WE_wire),
        .r_ex1_order_D(id1_output_r_ex1_order_D_wire),
        .r_ex1_order_WE(id1_output_r_ex1_order_WE_wire),
        .r_ex1_pc_D(id1_output_r_ex1_pc_D_wire),
        .r_ex1_pc_WE(id1_output_r_ex1_pc_WE_wire),
        .r_ex1_rd_D(id1_output_r_ex1_rd_D_wire),
        .r_ex1_rd_WE(id1_output_r_ex1_rd_WE_wire),
        .r_ex1_reg1_D(id1_output_r_ex1_reg1_D_wire),
        .r_ex1_reg1_WE(id1_output_r_ex1_reg1_WE_wire),
        .r_ex1_reg2_D(id1_output_r_ex1_reg2_D_wire),
        .r_ex1_reg2_WE(id1_output_r_ex1_reg2_WE_wire),
        .r_ex1_regwrite_D(id1_output_r_ex1_regwrite_D_wire),
        .r_ex1_regwrite_WE(id1_output_r_ex1_regwrite_WE_wire),
        .r_ex1_rfwt_sel_D(id1_output_r_ex1_rfwt_sel_D_wire),
        .r_ex1_rfwt_sel_WE(id1_output_r_ex1_rfwt_sel_WE_wire),
        .r_ex1_rs1_D(id1_output_r_ex1_rs1_D_wire),
        .r_ex1_rs1_WE(id1_output_r_ex1_rs1_WE_wire),
        .r_ex1_rs2_D(id1_output_r_ex1_rs2_D_wire),
        .r_ex1_rs2_WE(id1_output_r_ex1_rs2_WE_wire),
        .r_ex1_valid_D(id1_output_r_ex1_valid_D_wire),
        .r_ex1_valid_WE(id1_output_r_ex1_valid_WE_wire),
        .r_id1_instr_preserved_D(id1_output_r_id1_instr_preserved_D_wire),
        .r_id1_instr_preserved_WE(id1_output_r_id1_instr_preserved_WE_wire),
        .r_id1_order_preserved_D(id1_output_r_id1_order_preserved_D_wire),
        .r_id1_order_preserved_WE(id1_output_r_id1_order_preserved_WE_wire),
        .r_id1_pc_preserved_D(id1_output_r_id1_pc_preserved_D_wire),
        .r_id1_pc_preserved_WE(id1_output_r_id1_pc_preserved_WE_wire)
    );

    // functional unit instance:
    id2_output_t id2_output (
        .ACT(id2_stage_id2_output_ACT_wire),
        .r_id2_valid_Q(r_id2_valid_Q_wire),
        .s_id2_aluop_Q(s_id2_aluop),
        .s_id2_alusrc1_Q(s_id2_alusrc1),
        .s_id2_alusrc2_Q(s_id2_alusrc2),
        .s_id2_branchop_Q(s_id2_branchop),
        .s_id2_brnch_sel_Q(s_id2_brnch_sel),
        .s_id2_immed_Q(s_id2_immed),
        .s_id2_instr_Q(s_id2_instr),
        .s_id2_memop_Q(s_id2_memop),
        .s_id2_order_Q(s_id2_order),
        .s_id2_pc_Q(s_id2_pc),
        .s_id2_rd_Q(s_id2_rd),
        .s_id2_reg1_Q(s_id2_reg1),
        .s_id2_reg2_Q(s_id2_reg2),
        .s_id2_regwrite_Q(s_id2_regwrite),
        .s_id2_rfwt_sel_Q(s_id2_rfwt_sel),
        .s_id2_rs1_Q(s_id2_rs1),
        .s_id2_rs2_Q(s_id2_rs2),
        .r_ex2_aluop_D(id2_output_r_ex2_aluop_D_wire),
        .r_ex2_aluop_WE(id2_output_r_ex2_aluop_WE_wire),
        .r_ex2_alusrc1_D(id2_output_r_ex2_alusrc1_D_wire),
        .r_ex2_alusrc1_WE(id2_output_r_ex2_alusrc1_WE_wire),
        .r_ex2_alusrc2_D(id2_output_r_ex2_alusrc2_D_wire),
        .r_ex2_alusrc2_WE(id2_output_r_ex2_alusrc2_WE_wire),
        .r_ex2_branchop_D(id2_output_r_ex2_branchop_D_wire),
        .r_ex2_branchop_WE(id2_output_r_ex2_branchop_WE_wire),
        .r_ex2_brnch_sel_D(id2_output_r_ex2_brnch_sel_D_wire),
        .r_ex2_brnch_sel_WE(id2_output_r_ex2_brnch_sel_WE_wire),
        .r_ex2_immed_D(id2_output_r_ex2_immed_D_wire),
        .r_ex2_immed_WE(id2_output_r_ex2_immed_WE_wire),
        .r_ex2_memop_D(id2_output_r_ex2_memop_D_wire),
        .r_ex2_memop_WE(id2_output_r_ex2_memop_WE_wire),
        .r_ex2_order_D(id2_output_r_ex2_order_D_wire),
        .r_ex2_order_WE(id2_output_r_ex2_order_WE_wire),
        .r_ex2_pc_D(id2_output_r_ex2_pc_D_wire),
        .r_ex2_pc_WE(id2_output_r_ex2_pc_WE_wire),
        .r_ex2_rd_D(id2_output_r_ex2_rd_D_wire),
        .r_ex2_rd_WE(id2_output_r_ex2_rd_WE_wire),
        .r_ex2_reg1_D(id2_output_r_ex2_reg1_D_wire),
        .r_ex2_reg1_WE(id2_output_r_ex2_reg1_WE_wire),
        .r_ex2_reg2_D(id2_output_r_ex2_reg2_D_wire),
        .r_ex2_reg2_WE(id2_output_r_ex2_reg2_WE_wire),
        .r_ex2_regwrite_D(id2_output_r_ex2_regwrite_D_wire),
        .r_ex2_regwrite_WE(id2_output_r_ex2_regwrite_WE_wire),
        .r_ex2_rfwt_sel_D(id2_output_r_ex2_rfwt_sel_D_wire),
        .r_ex2_rfwt_sel_WE(id2_output_r_ex2_rfwt_sel_WE_wire),
        .r_ex2_rs1_D(id2_output_r_ex2_rs1_D_wire),
        .r_ex2_rs1_WE(id2_output_r_ex2_rs1_WE_wire),
        .r_ex2_rs2_D(id2_output_r_ex2_rs2_D_wire),
        .r_ex2_rs2_WE(id2_output_r_ex2_rs2_WE_wire),
        .r_ex2_valid_D(id2_output_r_ex2_valid_D_wire),
        .r_ex2_valid_WE(id2_output_r_ex2_valid_WE_wire),
        .r_id2_instr_preserved_D(id2_output_r_id2_instr_preserved_D_wire),
        .r_id2_instr_preserved_WE(id2_output_r_id2_instr_preserved_WE_wire),
        .r_id2_order_preserved_D(id2_output_r_id2_order_preserved_D_wire),
        .r_id2_order_preserved_WE(id2_output_r_id2_order_preserved_WE_wire),
        .r_id2_pc_preserved_D(id2_output_r_id2_pc_preserved_D_wire),
        .r_id2_pc_preserved_WE(id2_output_r_id2_pc_preserved_WE_wire)
    );

    // functional unit instance:
    me1_memory_t me1_memory (
        .ACT(me1_stage_me1_memory_ACT_wire),
        .ldst1_ahb_HRDATA(ldst1_ahb_HRDATA),
        .ldst1_ahb_HREADY(ldst1_ahb_HREADY),
        .ldst1_ahb_HRESP(ldst1_ahb_HRESP),
        .r_me1_alu_Q(r_me1_alu_Q_wire[1:0]),
        .r_me1_memop_Q(r_me1_memop_Q_wire),
        .r_me1_wtdat_Q(r_me1_wtdat_Q_wire),
        .s_me1_decoded_Q(s_me1_decoded),
        .ldst1_ahb_HWDATA(ldst1_ahb_HWDATA),
        .s_me1_decoded_D(s_me1_decoded),
        .s_me1_memdat_D(s_me1_memdat),
        .s_me1_memhaz_D(s_me1_memhaz)
    );

    // functional unit instance:
    me1_output_t me1_output (
        .ACT(me1_stage_me1_output_ACT_wire),
        .r_me1_alu_Q(r_me1_alu_Q_wire),
        .r_me1_order_Q(r_me1_order_Q_wire),
        .r_me1_pc_Q(r_me1_pc_Q_wire),
        .r_me1_rd_Q(r_me1_rd_Q_wire),
        .r_me1_regwrite_Q(r_me1_regwrite_Q_wire),
        .r_me1_rfwt_sel_Q(r_me1_rfwt_sel_Q_wire),
        .r_me1_valid_Q(r_me1_valid_Q_wire),
        .s_me1_memdat_Q(s_me1_memdat),
        .r_wb1_alu_D(me1_output_r_wb1_alu_D_wire),
        .r_wb1_alu_WE(me1_output_r_wb1_alu_WE_wire),
        .r_wb1_memdat_D(me1_output_r_wb1_memdat_D_wire),
        .r_wb1_memdat_WE(me1_output_r_wb1_memdat_WE_wire),
        .r_wb1_order_D(me1_output_r_wb1_order_D_wire),
        .r_wb1_order_WE(me1_output_r_wb1_order_WE_wire),
        .r_wb1_pc_D(me1_output_r_wb1_pc_D_wire),
        .r_wb1_pc_WE(me1_output_r_wb1_pc_WE_wire),
        .r_wb1_rd_D(me1_output_r_wb1_rd_D_wire),
        .r_wb1_rd_WE(me1_output_r_wb1_rd_WE_wire),
        .r_wb1_regwrite_D(me1_output_r_wb1_regwrite_D_wire),
        .r_wb1_regwrite_WE(me1_output_r_wb1_regwrite_WE_wire),
        .r_wb1_rfwt_sel_D(me1_output_r_wb1_rfwt_sel_D_wire),
        .r_wb1_rfwt_sel_WE(me1_output_r_wb1_rfwt_sel_WE_wire),
        .r_wb1_valid_D(me1_output_r_wb1_valid_D_wire),
        .r_wb1_valid_WE(me1_output_r_wb1_valid_WE_wire)
    );

    // functional unit instance:
    me2_memory_t me2_memory (
        .ACT(me2_stage_me2_memory_ACT_wire),
        .ldst2_ahb_HRDATA(ldst2_ahb_HRDATA),
        .ldst2_ahb_HREADY(ldst2_ahb_HREADY),
        .ldst2_ahb_HRESP(ldst2_ahb_HRESP),
        .r_me2_alu_Q(r_me2_alu_Q_wire[1:0]),
        .r_me2_memop_Q(r_me2_memop_Q_wire),
        .r_me2_wtdat_Q(r_me2_wtdat_Q_wire),
        .s_me2_decoded_Q(s_me2_decoded),
        .ldst2_ahb_HWDATA(ldst2_ahb_HWDATA),
        .s_me2_decoded_D(s_me2_decoded),
        .s_me2_memdat_D(s_me2_memdat),
        .s_me2_memhaz_D(s_me2_memhaz)
    );

    // functional unit instance:
    me2_output_t me2_output (
        .ACT(me2_stage_me2_output_ACT_wire),
        .r_me2_alu_Q(r_me2_alu_Q_wire),
        .r_me2_order_Q(r_me2_order_Q_wire),
        .r_me2_pc_Q(r_me2_pc_Q_wire),
        .r_me2_rd_Q(r_me2_rd_Q_wire),
        .r_me2_regwrite_Q(r_me2_regwrite_Q_wire),
        .r_me2_rfwt_sel_Q(r_me2_rfwt_sel_Q_wire),
        .r_me2_valid_Q(r_me2_valid_Q_wire),
        .s_me2_memdat_Q(s_me2_memdat),
        .r_wb2_alu_D(me2_output_r_wb2_alu_D_wire),
        .r_wb2_alu_WE(me2_output_r_wb2_alu_WE_wire),
        .r_wb2_memdat_D(me2_output_r_wb2_memdat_D_wire),
        .r_wb2_memdat_WE(me2_output_r_wb2_memdat_WE_wire),
        .r_wb2_order_D(me2_output_r_wb2_order_D_wire),
        .r_wb2_order_WE(me2_output_r_wb2_order_WE_wire),
        .r_wb2_pc_D(me2_output_r_wb2_pc_D_wire),
        .r_wb2_pc_WE(me2_output_r_wb2_pc_WE_wire),
        .r_wb2_rd_D(me2_output_r_wb2_rd_D_wire),
        .r_wb2_rd_WE(me2_output_r_wb2_rd_WE_wire),
        .r_wb2_regwrite_D(me2_output_r_wb2_regwrite_D_wire),
        .r_wb2_regwrite_WE(me2_output_r_wb2_regwrite_WE_wire),
        .r_wb2_rfwt_sel_D(me2_output_r_wb2_rfwt_sel_D_wire),
        .r_wb2_rfwt_sel_WE(me2_output_r_wb2_rfwt_sel_WE_wire),
        .r_wb2_valid_D(me2_output_r_wb2_valid_D_wire),
        .r_wb2_valid_WE(me2_output_r_wb2_valid_WE_wire)
    );

    // functional unit instance:
    flush_control_t flush_control (
        .ACT(main_flush_control_ACT_wire),
        .s_ex1_pcsrc_Q(s_ex1_pcsrc),
        .s_ex1_stall_Q(s_ex1_stall),
        .s_ex2_older_Q(s_ex2_older),
        .s_ex2_pcsrc_Q(s_ex2_pcsrc),
        .s_ex2_stall_Q(s_ex2_stall),
        .s_ex_pcsrc_Q(s_ex_pcsrc),
        .s_id1_pcsrc_Q(s_id1_pcsrc),
        .s_id1_stall_Q(s_id1_stall),
        .s_id2_older_Q(s_id2_older),
        .s_id2_pcsrc_Q(s_id2_pcsrc),
        .s_id2_stall_Q(s_id2_stall),
        .s_id_clear_Q(s_id_clear),
        .s_if_jump_Q(s_if_jump),
        .s_me1_pcsrc_Q(s_me1_pcsrc),
        .s_me1_stall_Q(s_me1_stall),
        .s_me2_older_Q(s_me2_older),
        .s_me2_pcsrc_Q(s_me2_pcsrc),
        .s_me2_stall_Q(s_me2_stall),
        .s_me_pcsrc_Q(s_me_pcsrc),
        .r_id1_stall_D(flush_control_r_id1_stall_D_wire),
        .r_id1_stall_WE(flush_control_r_id1_stall_WE_wire),
        .r_id2_stall_D(flush_control_r_id2_stall_D_wire),
        .r_id2_stall_WE(flush_control_r_id2_stall_WE_wire),
        .r_id_clear_D(flush_control_r_id_clear_D_wire),
        .r_id_clear_WE(flush_control_r_id_clear_WE_wire),
        .s_ex1_clear_D(s_ex1_clear),
        .s_ex2_clear_D(s_ex2_clear),
        .s_id_clear_D(s_id_clear),
        .s_if_stall_D(s_if_stall),
        .s_me1_clear_D(s_me1_clear),
        .s_me2_clear_D(s_me2_clear),
        .s_wb1_clear_D(s_wb1_clear),
        .s_wb2_clear_D(s_wb2_clear)
    );

    // functional unit instance:
    ex_coordination_t ex_coordination (
        .ACT(main_ex_coordination_ACT_wire),
        .r_ex1_memop_Q(r_ex1_memop_Q_wire),
        .r_ex1_order_Q(r_ex1_order_Q_wire),
        .r_ex1_valid_Q(r_ex1_valid_Q_wire),
        .r_ex2_memop_Q(r_ex2_memop_Q_wire),
        .r_ex2_order_Q(r_ex2_order_Q_wire),
        .r_ex2_valid_Q(r_ex2_valid_Q_wire),
        .s_ex1_alu_Q(s_ex1_alu[31:2]),
        .s_ex1_bradd_Q(s_ex1_bradd),
        .s_ex1_pcsrc_Q(s_ex1_pcsrc),
        .s_ex1_stall_Q(s_ex1_stall),
        .s_ex1_sthaz_Q(s_ex1_sthaz),
        .s_ex2_alu_Q(s_ex2_alu[31:2]),
        .s_ex2_bradd_Q(s_ex2_bradd),
        .s_ex2_older_Q(s_ex2_older),
        .s_ex2_pcsrc_Q(s_ex2_pcsrc),
        .s_ex2_stall_Q(s_ex2_stall),
        .s_ex2_sthaz_Q(s_ex2_sthaz),
        .s_ex_same_addr_Q(s_ex_same_addr),
        .s_me1_stall_Q(s_me1_stall),
        .s_me2_stall_Q(s_me2_stall),
        .ex1_memory_ACT(ex_coordination_ex1_memory_ACT_wire),
        .ex1_output_ACT(ex_coordination_ex1_output_ACT_wire),
        .ex2_memory_ACT(ex_coordination_ex2_memory_ACT_wire),
        .ex2_output_ACT(ex_coordination_ex2_output_ACT_wire),
        .r_ex1_stall_D(ex_coordination_r_ex1_stall_D_wire),
        .r_ex1_stall_WE(ex_coordination_r_ex1_stall_WE_wire),
        .r_ex2_stall_D(ex_coordination_r_ex2_stall_D_wire),
        .r_ex2_stall_WE(ex_coordination_r_ex2_stall_WE_wire),
        .s_ex1_stall_D(s_ex1_stall),
        .s_ex1_sthaz_D(s_ex1_sthaz),
        .s_ex2_older_D(s_ex2_older),
        .s_ex2_stall_D(s_ex2_stall),
        .s_ex2_sthaz_D(s_ex2_sthaz),
        .s_ex_bradd_D(s_ex_bradd),
        .s_ex_pcsrc_D(s_ex_pcsrc),
        .s_ex_same_addr_D(s_ex_same_addr)
    );

    // functional unit instance:
    id_coordination_t id_coordination (
        .ACT(main_id_coordination_ACT_wire),
        .r_ex1_memop_Q(r_ex1_memop_Q_wire),
        .r_ex1_rd_Q(r_ex1_rd_Q_wire),
        .r_ex2_memop_Q(r_ex2_memop_Q_wire),
        .r_ex2_rd_Q(r_ex2_rd_Q_wire),
        .r_me1_memop_Q(r_me1_memop_Q_wire),
        .r_me1_rd_Q(r_me1_rd_Q_wire),
        .r_me2_memop_Q(r_me2_memop_Q_wire),
        .r_me2_rd_Q(r_me2_rd_Q_wire),
        .s_ex1_stall_Q(s_ex1_stall),
        .s_ex2_stall_Q(s_ex2_stall),
        .s_id1_bradd_Q(s_id1_bradd),
        .s_id1_datahaz_Q(s_id1_datahaz),
        .s_id1_order_Q(s_id1_order),
        .s_id1_pcsrc_Q(s_id1_pcsrc),
        .s_id1_rd_Q(s_id1_rd),
        .s_id1_regwrite_Q(s_id1_regwrite),
        .s_id1_rs1_Q(s_id1_rs1),
        .s_id1_rs2_Q(s_id1_rs2),
        .s_id2_bradd_Q(s_id2_bradd),
        .s_id2_datahaz_Q(s_id2_datahaz),
        .s_id2_older_Q(s_id2_older),
        .s_id2_order_Q(s_id2_order),
        .s_id2_pcsrc_Q(s_id2_pcsrc),
        .s_id2_rd_Q(s_id2_rd),
        .s_id2_regwrite_Q(s_id2_regwrite),
        .s_id2_rs1_Q(s_id2_rs1),
        .s_id2_rs2_Q(s_id2_rs2),
        .s_me1_memhaz_Q(s_me1_memhaz),
        .s_me2_memhaz_Q(s_me2_memhaz),
        .s_id1_datahaz_D(s_id1_datahaz),
        .s_id1_stall_D(s_id1_stall),
        .s_id2_datahaz_D(s_id2_datahaz),
        .s_id2_older_D(s_id2_older),
        .s_id2_stall_D(s_id2_stall),
        .s_id_bradd_D(s_id_bradd),
        .s_id_fetch_order_D(s_id_fetch_order),
        .s_id_pcsrc_D(s_id_pcsrc),
        .s_id_stallA_D(s_id_stallA),
        .s_id_stallB_D(s_id_stallB)
    );

    // functional unit instance:
    me_coordination_t me_coordination (
        .ACT(main_me_coordination_ACT_wire),
        .r_me1_alu_Q(r_me1_alu_Q_wire),
        .r_me1_bradd_Q(r_me1_bradd_Q_wire),
        .r_me1_order_Q(r_me1_order_Q_wire),
        .r_me1_rd_Q(r_me1_rd_Q_wire),
        .r_me1_regwrite_Q(r_me1_regwrite_Q_wire),
        .r_me1_valid_Q(r_me1_valid_Q_wire),
        .r_me2_alu_Q(r_me2_alu_Q_wire),
        .r_me2_bradd_Q(r_me2_bradd_Q_wire),
        .r_me2_order_Q(r_me2_order_Q_wire),
        .r_me2_rd_Q(r_me2_rd_Q_wire),
        .r_me2_regwrite_Q(r_me2_regwrite_Q_wire),
        .r_me2_valid_Q(r_me2_valid_Q_wire),
        .s_me1_memhaz_Q(s_me1_memhaz),
        .s_me1_pcsrc_Q(s_me1_pcsrc),
        .s_me2_memhaz_Q(s_me2_memhaz),
        .s_me2_older_Q(s_me2_older),
        .s_me2_pcsrc_Q(s_me2_pcsrc),
        .s_wb1_stall_Q(s_wb1_stall),
        .s_wb2_stall_Q(s_wb2_stall),
        .s_me1_stall_D(s_me1_stall),
        .s_me2_older_D(s_me2_older),
        .s_me2_stall_D(s_me2_stall),
        .s_me_bradd_D(s_me_bradd),
        .s_me_fwdA_D(s_me_fwdA),
        .s_me_fwdB_D(s_me_fwdB),
        .s_me_pcsrc_D(s_me_pcsrc),
        .s_me_rdA_D(s_me_rdA),
        .s_me_rdB_D(s_me_rdB),
        .s_me_wtenA_D(s_me_wtenA),
        .s_me_wtenB_D(s_me_wtenB)
    );

    // functional unit instance:
    wb_coordination_t wb_coordination (
        .ACT(main_wb_coordination_ACT_wire),
        .r_wb1_order_Q(r_wb1_order_Q_wire),
        .r_wb1_rd_Q(r_wb1_rd_Q_wire),
        .r_wb1_regwrite_Q(r_wb1_regwrite_Q_wire),
        .r_wb1_valid_Q(r_wb1_valid_Q_wire),
        .r_wb2_order_Q(r_wb2_order_Q_wire),
        .r_wb2_rd_Q(r_wb2_rd_Q_wire),
        .r_wb2_regwrite_Q(r_wb2_regwrite_Q_wire),
        .r_wb2_valid_Q(r_wb2_valid_Q_wire),
        .s_wb2_older_Q(s_wb2_older),
        .s_wb_wthaz_Q(s_wb_wthaz),
        .s_wb1_stall_D(s_wb1_stall),
        .s_wb1_wten_D(s_wb1_wten),
        .s_wb2_older_D(s_wb2_older),
        .s_wb2_stall_D(s_wb2_stall),
        .s_wb2_wten_D(s_wb2_wten),
        .s_wb_wthaz_D(s_wb_wthaz)
    );

    // functional unit instance:
    pipeline_control_t pipeline_control (
        .ACT(main_pipeline_control_ACT_wire),
        .s_ex1_clear_Q(s_ex1_clear),
        .s_ex1_stall_Q(s_ex1_stall),
        .s_ex2_clear_Q(s_ex2_clear),
        .s_ex2_stall_Q(s_ex2_stall),
        .s_id1_stall_Q(s_id1_stall),
        .s_id2_stall_Q(s_id2_stall),
        .s_id_clear_Q(s_id_clear),
        .s_if_stall_Q(s_if_stall),
        .s_me1_clear_Q(s_me1_clear),
        .s_me1_stall_Q(s_me1_stall),
        .s_me2_clear_Q(s_me2_clear),
        .s_me2_stall_Q(s_me2_stall),
        .s_wb1_clear_Q(s_wb1_clear),
        .s_wb1_stall_Q(s_wb1_stall),
        .s_wb2_clear_Q(s_wb2_clear),
        .s_wb2_stall_Q(s_wb2_stall),
        .pipe_EX1_CLEAR_D(pipeline_control_pipe_EX1_CLEAR_D_wire),
        .pipe_EX1_STALL_D(pipeline_control_pipe_EX1_STALL_D_wire),
        .pipe_EX2_CLEAR_D(pipeline_control_pipe_EX2_CLEAR_D_wire),
        .pipe_EX2_STALL_D(pipeline_control_pipe_EX2_STALL_D_wire),
        .pipe_ID1_CLEAR_D(pipeline_control_pipe_ID1_CLEAR_D_wire),
        .pipe_ID1_STALL_D(pipeline_control_pipe_ID1_STALL_D_wire),
        .pipe_ID2_CLEAR_D(pipeline_control_pipe_ID2_CLEAR_D_wire),
        .pipe_ID2_STALL_D(pipeline_control_pipe_ID2_STALL_D_wire),
        .pipe_IF_STALL_D(pipeline_control_pipe_IF_STALL_D_wire),
        .pipe_ME1_CLEAR_D(pipeline_control_pipe_ME1_CLEAR_D_wire),
        .pipe_ME1_STALL_D(pipeline_control_pipe_ME1_STALL_D_wire),
        .pipe_ME2_CLEAR_D(pipeline_control_pipe_ME2_CLEAR_D_wire),
        .pipe_ME2_STALL_D(pipeline_control_pipe_ME2_STALL_D_wire),
        .pipe_WB1_CLEAR_D(pipeline_control_pipe_WB1_CLEAR_D_wire),
        .pipe_WB1_STALL_D(pipeline_control_pipe_WB1_STALL_D_wire),
        .pipe_WB2_CLEAR_D(pipeline_control_pipe_WB2_CLEAR_D_wire),
        .pipe_WB2_STALL_D(pipeline_control_pipe_WB2_STALL_D_wire)
    );

    // functional unit instance:
    reset_t reset (
        .ACT(codasip_startup_ctrl_reset_ACT_wire),
        .r_pc_D(reset_r_pc_D_wire),
        .r_pc_WE(reset_r_pc_WE_wire)
    );

    // functional unit instance:
    ex1_stage_t ex1_stage (
        .ACT(main_ex1_stage_ACT_wire),
        .r_ex1_aluop_Q(r_ex1_aluop_Q_wire),
        .r_ex1_alusrc1_Q(r_ex1_alusrc1_Q_wire),
        .r_ex1_alusrc2_Q(r_ex1_alusrc2_Q_wire),
        .r_ex1_branchop_Q(r_ex1_branchop_Q_wire),
        .r_ex1_brnch_sel_Q(r_ex1_brnch_sel_Q_wire),
        .r_ex1_immed_Q(r_ex1_immed_Q_wire),
        .r_ex1_pc_Q(r_ex1_pc_Q_wire),
        .r_ex1_reg1_preserved_Q(r_ex1_reg1_preserved_Q_wire),
        .r_ex1_reg1_Q(r_ex1_reg1_Q_wire),
        .r_ex1_reg2_preserved_Q(r_ex1_reg2_preserved_Q_wire),
        .r_ex1_reg2_Q(r_ex1_reg2_Q_wire),
        .r_ex1_rs1_Q(r_ex1_rs1_Q_wire),
        .r_ex1_rs2_Q(r_ex1_rs2_Q_wire),
        .r_ex1_stall_Q(r_ex1_stall_Q_wire),
        .s_ex1_alu_Q(s_ex1_alu),
        .s_ex1_brimm_Q(s_ex1_brimm),
        .s_ex1_fwdA_sel_Q(s_ex1_fwdA_sel),
        .s_ex1_fwdB_sel_Q(s_ex1_fwdB_sel),
        .s_ex1_reg1_Q(s_ex1_reg1),
        .s_ex1_reg2_Q(s_ex1_reg2),
        .s_ex1_src1_Q(s_ex1_src1),
        .s_ex1_src2_Q(s_ex1_src2),
        .s_ex1_xor_Q(s_ex1_xor),
        .s_me_fwdA_Q(s_me_fwdA),
        .s_me_fwdB_Q(s_me_fwdB),
        .s_me_rdA_Q(s_me_rdA),
        .s_me_rdB_Q(s_me_rdB),
        .s_me_wtenA_Q(s_me_wtenA),
        .s_me_wtenB_Q(s_me_wtenB),
        .s_wb_fwdA_Q(s_wb_fwdA),
        .s_wb_fwdB_Q(s_wb_fwdB),
        .s_wb_rdA_Q(s_wb_rdA),
        .s_wb_rdB_Q(s_wb_rdB),
        .s_wb_wtenA_Q(s_wb_wtenA),
        .s_wb_wtenB_Q(s_wb_wtenB),
        .s_ex1_alu_D(s_ex1_alu),
        .s_ex1_bradd_D(s_ex1_bradd),
        .s_ex1_brimm_D(s_ex1_brimm),
        .s_ex1_fwdA_sel_D(s_ex1_fwdA_sel),
        .s_ex1_fwdB_sel_D(s_ex1_fwdB_sel),
        .s_ex1_pcsrc_D(s_ex1_pcsrc),
        .s_ex1_reg1_D(s_ex1_reg1),
        .s_ex1_reg2_D(s_ex1_reg2),
        .s_ex1_src1_D(s_ex1_src1),
        .s_ex1_src2_D(s_ex1_src2),
        .s_ex1_xor_D(s_ex1_xor),
        .s_ex1_zero_D(s_ex1_zero)
    );

    // functional unit instance:
    ex2_stage_t ex2_stage (
        .ACT(main_ex2_stage_ACT_wire),
        .r_ex2_aluop_Q(r_ex2_aluop_Q_wire),
        .r_ex2_alusrc1_Q(r_ex2_alusrc1_Q_wire),
        .r_ex2_alusrc2_Q(r_ex2_alusrc2_Q_wire),
        .r_ex2_branchop_Q(r_ex2_branchop_Q_wire),
        .r_ex2_brnch_sel_Q(r_ex2_brnch_sel_Q_wire),
        .r_ex2_immed_Q(r_ex2_immed_Q_wire),
        .r_ex2_pc_Q(r_ex2_pc_Q_wire),
        .r_ex2_reg1_preserved_Q(r_ex2_reg1_preserved_Q_wire),
        .r_ex2_reg1_Q(r_ex2_reg1_Q_wire),
        .r_ex2_reg2_preserved_Q(r_ex2_reg2_preserved_Q_wire),
        .r_ex2_reg2_Q(r_ex2_reg2_Q_wire),
        .r_ex2_rs1_Q(r_ex2_rs1_Q_wire),
        .r_ex2_rs2_Q(r_ex2_rs2_Q_wire),
        .r_ex2_stall_Q(r_ex2_stall_Q_wire),
        .s_ex2_alu_Q(s_ex2_alu),
        .s_ex2_brimm_Q(s_ex2_brimm),
        .s_ex2_fwdA_sel_Q(s_ex2_fwdA_sel),
        .s_ex2_fwdB_sel_Q(s_ex2_fwdB_sel),
        .s_ex2_reg1_Q(s_ex2_reg1),
        .s_ex2_reg2_Q(s_ex2_reg2),
        .s_ex2_src1_Q(s_ex2_src1),
        .s_ex2_src2_Q(s_ex2_src2),
        .s_ex2_xor_Q(s_ex2_xor),
        .s_me_fwdA_Q(s_me_fwdA),
        .s_me_fwdB_Q(s_me_fwdB),
        .s_me_rdA_Q(s_me_rdA),
        .s_me_rdB_Q(s_me_rdB),
        .s_me_wtenA_Q(s_me_wtenA),
        .s_me_wtenB_Q(s_me_wtenB),
        .s_wb_fwdA_Q(s_wb_fwdA),
        .s_wb_fwdB_Q(s_wb_fwdB),
        .s_wb_rdA_Q(s_wb_rdA),
        .s_wb_rdB_Q(s_wb_rdB),
        .s_wb_wtenA_Q(s_wb_wtenA),
        .s_wb_wtenB_Q(s_wb_wtenB),
        .s_ex2_alu_D(s_ex2_alu),
        .s_ex2_bradd_D(s_ex2_bradd),
        .s_ex2_brimm_D(s_ex2_brimm),
        .s_ex2_fwdA_sel_D(s_ex2_fwdA_sel),
        .s_ex2_fwdB_sel_D(s_ex2_fwdB_sel),
        .s_ex2_pcsrc_D(s_ex2_pcsrc),
        .s_ex2_reg1_D(s_ex2_reg1),
        .s_ex2_reg2_D(s_ex2_reg2),
        .s_ex2_src1_D(s_ex2_src1),
        .s_ex2_src2_D(s_ex2_src2),
        .s_ex2_xor_D(s_ex2_xor),
        .s_ex2_zero_D(s_ex2_zero)
    );

    // functional unit instance:
    id1_stage_t id1_stage (
        .ACT(main_id1_stage_ACT_wire),
        .if1_ahb_HRDATA(if1_ahb_HRDATA),
        .if1_ahb_HREADY(if1_ahb_HREADY),
        .if1_ahb_HRESP(if1_ahb_HRESP),
        .r_id1_instr_preserved_Q(r_id1_instr_preserved_Q_wire),
        .r_id1_order_preserved_Q(r_id1_order_preserved_Q_wire),
        .r_id1_order_Q(r_id1_order_Q_wire),
        .r_id1_pc_preserved_Q(r_id1_pc_preserved_Q_wire),
        .r_id1_pc_Q(r_id1_pc_Q_wire),
        .r_id1_stall_Q(r_id1_stall_Q_wire),
        .r_id_clear_Q(r_id_clear_Q_wire),
        .rf_xpr_read0_Q(rf_xpr_read0_Q_wire),
        .rf_xpr_read1_Q(rf_xpr_read1_Q_wire),
        .s_id1_branchop_Q(s_id1_branchop),
        .s_id1_immed_Q(s_id1_immed),
        .s_id1_immedb_Q(s_id1_immedb),
        .s_id1_immedi_Q(s_id1_immedi),
        .s_id1_immedj_Q(s_id1_immedj),
        .s_id1_immeds_Q(s_id1_immeds),
        .s_id1_immedu_Q(s_id1_immedu),
        .s_id1_immsel_Q(s_id1_immsel),
        .s_id1_instr_Q(s_id1_instr),
        .s_id1_opc_Q(s_id1_opc),
        .s_id1_pc_Q(s_id1_pc),
        .s_id1_read1_Q(s_id1_read1),
        .s_id1_read2_Q(s_id1_read2),
        .s_id1_rff1_sel_Q(s_id1_rff1_sel),
        .s_id1_rff2_sel_Q(s_id1_rff2_sel),
        .s_id1_rs1_Q(s_id1_rs1),
        .s_id1_rs2_Q(s_id1_rs2),
        .s_wb_fwdA_Q(s_wb_fwdA),
        .s_wb_fwdB_Q(s_wb_fwdB),
        .s_wb_rdA_Q(s_wb_rdA),
        .s_wb_rdB_Q(s_wb_rdB),
        .s_wb_wtenA_Q(s_wb_wtenA),
        .s_wb_wtenB_Q(s_wb_wtenB),
        .decoder1_ACT(id1_stage_decoder1_ACT_wire),
        .decoder1_codasip_param_0(id1_stage_decoder1_codasip_param_0_wire),
        .id1_output_ACT(id1_stage_id1_output_ACT_wire),
        .rf_xpr_read0_RA(id1_stage_rf_xpr_read0_RA_wire),
        .rf_xpr_read0_RE(id1_stage_rf_xpr_read0_RE_wire),
        .rf_xpr_read1_RA(id1_stage_rf_xpr_read1_RA_wire),
        .rf_xpr_read1_RE(id1_stage_rf_xpr_read1_RE_wire),
        .s_id1_bradd_D(s_id1_bradd),
        .s_id1_immed_D(s_id1_immed),
        .s_id1_immedb_D(s_id1_immedb),
        .s_id1_immedi_D(s_id1_immedi),
        .s_id1_immedj_D(s_id1_immedj),
        .s_id1_immeds_D(s_id1_immeds),
        .s_id1_immedu_D(s_id1_immedu),
        .s_id1_instr_D(s_id1_instr),
        .s_id1_opc_D(s_id1_opc),
        .s_id1_order_D(s_id1_order),
        .s_id1_pc_D(s_id1_pc),
        .s_id1_pcsrc_D(s_id1_pcsrc),
        .s_id1_rd_D(s_id1_rd),
        .s_id1_read1_D(s_id1_read1),
        .s_id1_read2_D(s_id1_read2),
        .s_id1_reg1_D(s_id1_reg1),
        .s_id1_reg2_D(s_id1_reg2),
        .s_id1_rff1_sel_D(s_id1_rff1_sel),
        .s_id1_rff2_sel_D(s_id1_rff2_sel),
        .s_id1_rs1_D(s_id1_rs1),
        .s_id1_rs2_D(s_id1_rs2)
    );

    // functional unit instance:
    id2_stage_t id2_stage (
        .ACT(main_id2_stage_ACT_wire),
        .if2_ahb_HRDATA(if2_ahb_HRDATA),
        .if2_ahb_HREADY(if2_ahb_HREADY),
        .if2_ahb_HRESP(if2_ahb_HRESP),
        .r_id2_instr_preserved_Q(r_id2_instr_preserved_Q_wire),
        .r_id2_order_preserved_Q(r_id2_order_preserved_Q_wire),
        .r_id2_order_Q(r_id2_order_Q_wire),
        .r_id2_pc_preserved_Q(r_id2_pc_preserved_Q_wire),
        .r_id2_pc_Q(r_id2_pc_Q_wire),
        .r_id2_stall_Q(r_id2_stall_Q_wire),
        .r_id_clear_Q(r_id_clear_Q_wire),
        .rf_xpr_read2_Q(rf_xpr_read2_Q_wire),
        .rf_xpr_read3_Q(rf_xpr_read3_Q_wire),
        .s_id2_branchop_Q(s_id2_branchop),
        .s_id2_immed_Q(s_id2_immed),
        .s_id2_immedb_Q(s_id2_immedb),
        .s_id2_immedi_Q(s_id2_immedi),
        .s_id2_immedj_Q(s_id2_immedj),
        .s_id2_immeds_Q(s_id2_immeds),
        .s_id2_immedu_Q(s_id2_immedu),
        .s_id2_immsel_Q(s_id2_immsel),
        .s_id2_instr_Q(s_id2_instr),
        .s_id2_opc_Q(s_id2_opc),
        .s_id2_pc_Q(s_id2_pc),
        .s_id2_read1_Q(s_id2_read1),
        .s_id2_read2_Q(s_id2_read2),
        .s_id2_rff1_sel_Q(s_id2_rff1_sel),
        .s_id2_rff2_sel_Q(s_id2_rff2_sel),
        .s_id2_rs1_Q(s_id2_rs1),
        .s_id2_rs2_Q(s_id2_rs2),
        .s_wb_fwdA_Q(s_wb_fwdA),
        .s_wb_fwdB_Q(s_wb_fwdB),
        .s_wb_rdA_Q(s_wb_rdA),
        .s_wb_rdB_Q(s_wb_rdB),
        .s_wb_wtenA_Q(s_wb_wtenA),
        .s_wb_wtenB_Q(s_wb_wtenB),
        .decoder2_ACT(id2_stage_decoder2_ACT_wire),
        .decoder2_codasip_param_0(id2_stage_decoder2_codasip_param_0_wire),
        .id2_output_ACT(id2_stage_id2_output_ACT_wire),
        .rf_xpr_read2_RA(id2_stage_rf_xpr_read2_RA_wire),
        .rf_xpr_read2_RE(id2_stage_rf_xpr_read2_RE_wire),
        .rf_xpr_read3_RA(id2_stage_rf_xpr_read3_RA_wire),
        .rf_xpr_read3_RE(id2_stage_rf_xpr_read3_RE_wire),
        .s_id2_bradd_D(s_id2_bradd),
        .s_id2_immed_D(s_id2_immed),
        .s_id2_immedb_D(s_id2_immedb),
        .s_id2_immedi_D(s_id2_immedi),
        .s_id2_immedj_D(s_id2_immedj),
        .s_id2_immeds_D(s_id2_immeds),
        .s_id2_immedu_D(s_id2_immedu),
        .s_id2_instr_D(s_id2_instr),
        .s_id2_opc_D(s_id2_opc),
        .s_id2_order_D(s_id2_order),
        .s_id2_pc_D(s_id2_pc),
        .s_id2_pcsrc_D(s_id2_pcsrc),
        .s_id2_rd_D(s_id2_rd),
        .s_id2_read1_D(s_id2_read1),
        .s_id2_read2_D(s_id2_read2),
        .s_id2_reg1_D(s_id2_reg1),
        .s_id2_reg2_D(s_id2_reg2),
        .s_id2_rff1_sel_D(s_id2_rff1_sel),
        .s_id2_rff2_sel_D(s_id2_rff2_sel),
        .s_id2_rs1_D(s_id2_rs1),
        .s_id2_rs2_D(s_id2_rs2)
    );

    // functional unit instance:
    if_output_t if_output (
        .ACT(if_stage_if_output_ACT_wire),
        .r_order1_Q(r_order1_Q_wire),
        .r_order2_Q(r_order2_Q_wire),
        .s_id1_stall_Q(s_id1_stall),
        .s_id2_stall_Q(s_id2_stall),
        .s_if_jump_Q(s_if_jump),
        .s_if_pc1_Q(s_if_pc1),
        .s_if_pc2_Q(s_if_pc2),
        .s_if_pcin_Q(s_if_pcin),
        .r_id1_order_D(if_output_r_id1_order_D_wire),
        .r_id1_order_WE(if_output_r_id1_order_WE_wire),
        .r_id1_pc_D(if_output_r_id1_pc_D_wire),
        .r_id1_pc_WE(if_output_r_id1_pc_WE_wire),
        .r_id1_valid_D(if_output_r_id1_valid_D_wire),
        .r_id1_valid_WE(if_output_r_id1_valid_WE_wire),
        .r_id2_order_D(if_output_r_id2_order_D_wire),
        .r_id2_order_WE(if_output_r_id2_order_WE_wire),
        .r_id2_pc_D(if_output_r_id2_pc_D_wire),
        .r_id2_pc_WE(if_output_r_id2_pc_WE_wire),
        .r_id2_valid_D(if_output_r_id2_valid_D_wire),
        .r_id2_valid_WE(if_output_r_id2_valid_WE_wire),
        .r_order1_D(if_output_r_order1_D_wire),
        .r_order1_WE(if_output_r_order1_WE_wire),
        .r_order2_D(if_output_r_order2_D_wire),
        .r_order2_WE(if_output_r_order2_WE_wire),
        .r_pc_D(if_output_r_pc_D_wire),
        .r_pc_WE(if_output_r_pc_WE_wire)
    );

    // functional unit instance:
    me1_stage_t me1_stage (
        .ACT(main_me1_stage_ACT_wire),
        .r_me1_branchop_Q(r_me1_branchop_Q_wire),
        .r_me1_zero_Q(r_me1_zero_Q_wire),
        .me1_memory_ACT(me1_stage_me1_memory_ACT_wire),
        .me1_output_ACT(me1_stage_me1_output_ACT_wire),
        .s_me1_pcsrc_D(s_me1_pcsrc)
    );

    // functional unit instance:
    me2_stage_t me2_stage (
        .ACT(main_me2_stage_ACT_wire),
        .r_me2_branchop_Q(r_me2_branchop_Q_wire),
        .r_me2_zero_Q(r_me2_zero_Q_wire),
        .me2_memory_ACT(me2_stage_me2_memory_ACT_wire),
        .me2_output_ACT(me2_stage_me2_output_ACT_wire),
        .s_me2_pcsrc_D(s_me2_pcsrc)
    );

    // functional unit instance:
    wb1_stage_t wb1_stage (
        .ACT(main_wb1_stage_ACT_wire),
        .r_wb1_alu_Q(r_wb1_alu_Q_wire),
        .r_wb1_memdat_Q(r_wb1_memdat_Q_wire),
        .r_wb1_pc_Q(r_wb1_pc_Q_wire),
        .r_wb1_rd_Q(r_wb1_rd_Q_wire),
        .r_wb1_rfwt_sel_Q(r_wb1_rfwt_sel_Q_wire),
        .s_wb1_nextpc_Q(s_wb1_nextpc),
        .s_wb1_result_Q(s_wb1_result),
        .s_wb1_wten_Q(s_wb1_wten),
        .rf_xpr_wrt0_D(wb1_stage_rf_xpr_wrt0_D_wire),
        .rf_xpr_wrt0_WA(wb1_stage_rf_xpr_wrt0_WA_wire),
        .rf_xpr_wrt0_WE(wb1_stage_rf_xpr_wrt0_WE_wire),
        .s_wb1_nextpc_D(s_wb1_nextpc),
        .s_wb1_result_D(s_wb1_result)
    );

    // functional unit instance:
    wb2_stage_t wb2_stage (
        .ACT(main_wb2_stage_ACT_wire),
        .r_wb1_rd_Q(r_wb1_rd_Q_wire),
        .r_wb2_alu_Q(r_wb2_alu_Q_wire),
        .r_wb2_memdat_Q(r_wb2_memdat_Q_wire),
        .r_wb2_pc_Q(r_wb2_pc_Q_wire),
        .r_wb2_rd_Q(r_wb2_rd_Q_wire),
        .r_wb2_rfwt_sel_Q(r_wb2_rfwt_sel_Q_wire),
        .s_wb1_result_Q(s_wb1_result),
        .s_wb1_wten_Q(s_wb1_wten),
        .s_wb2_nextpc_Q(s_wb2_nextpc),
        .s_wb2_older_Q(s_wb2_older),
        .s_wb2_result_Q(s_wb2_result),
        .s_wb2_wten_Q(s_wb2_wten),
        .rf_xpr_wrt1_D(wb2_stage_rf_xpr_wrt1_D_wire),
        .rf_xpr_wrt1_WA(wb2_stage_rf_xpr_wrt1_WA_wire),
        .rf_xpr_wrt1_WE(wb2_stage_rf_xpr_wrt1_WE_wire),
        .s_wb2_nextpc_D(s_wb2_nextpc),
        .s_wb2_result_D(s_wb2_result),
        .s_wb_fwdA_D(s_wb_fwdA),
        .s_wb_fwdB_D(s_wb_fwdB),
        .s_wb_rdA_D(s_wb_rdA),
        .s_wb_rdB_D(s_wb_rdB),
        .s_wb_wtenA_D(s_wb_wtenA),
        .s_wb_wtenB_D(s_wb_wtenB)
    );

    // functional unit instance:
    if_stage_t if_stage (
        .ACT(main_if_stage_ACT_wire),
        .r_id_clear_Q(r_id_clear_Q_wire),
        .r_pc_Q(r_pc_Q_wire),
        .s_ex_bradd_Q(s_ex_bradd),
        .s_ex_pcsrc_Q(s_ex_pcsrc),
        .s_id_bradd_Q(s_id_bradd),
        .s_id_fetch_order_Q(s_id_fetch_order),
        .s_id_pcsrc_Q(s_id_pcsrc),
        .s_id_stallA_Q(s_id_stallA),
        .s_id_stallB_Q(s_id_stallB),
        .s_if_nextpc_Q(s_if_nextpc),
        .s_if_pc1_Q(s_if_pc1),
        .s_if_pc2_Q(s_if_pc2),
        .s_if_pcB_Q(s_if_pcB),
        .s_me_bradd_Q(s_me_bradd),
        .s_me_pcsrc_Q(s_me_pcsrc),
        .if1_ahb_HADDR(if1_ahb_HADDR),
        .if1_ahb_HBURST(if1_ahb_HBURST),
        .if1_ahb_HMASTLOCK(if1_ahb_HMASTLOCK),
        .if1_ahb_HPROT(if1_ahb_HPROT),
        .if1_ahb_HSIZE(if1_ahb_HSIZE),
        .if1_ahb_HTRANS(if1_ahb_HTRANS),
        .if1_ahb_HWRITE(if1_ahb_HWRITE),
        .if2_ahb_HADDR(if2_ahb_HADDR),
        .if2_ahb_HBURST(if2_ahb_HBURST),
        .if2_ahb_HMASTLOCK(if2_ahb_HMASTLOCK),
        .if2_ahb_HPROT(if2_ahb_HPROT),
        .if2_ahb_HSIZE(if2_ahb_HSIZE),
        .if2_ahb_HTRANS(if2_ahb_HTRANS),
        .if2_ahb_HWRITE(if2_ahb_HWRITE),
        .if_output_ACT(if_stage_if_output_ACT_wire),
        .s_if_jump_D(s_if_jump),
        .s_if_nextpc_D(s_if_nextpc),
        .s_if_pc1_D(s_if_pc1),
        .s_if_pc2_D(s_if_pc2),
        .s_if_pcB_D(s_if_pcB),
        .s_if_pcin_D(s_if_pcin)
    );

    // functional unit instance:
    main_t main (
        .ACT(codasip_startup_ctrl_main_ACT_wire),
        .ex1_stage_ACT(main_ex1_stage_ACT_wire),
        .ex2_stage_ACT(main_ex2_stage_ACT_wire),
        .ex_coordination_ACT(main_ex_coordination_ACT_wire),
        .flush_control_ACT(main_flush_control_ACT_wire),
        .id1_stage_ACT(main_id1_stage_ACT_wire),
        .id2_stage_ACT(main_id2_stage_ACT_wire),
        .id_coordination_ACT(main_id_coordination_ACT_wire),
        .if_stage_ACT(main_if_stage_ACT_wire),
        .me1_stage_ACT(main_me1_stage_ACT_wire),
        .me2_stage_ACT(main_me2_stage_ACT_wire),
        .me_coordination_ACT(main_me_coordination_ACT_wire),
        .pipeline_control_ACT(main_pipeline_control_ACT_wire),
        .wb1_stage_ACT(main_wb1_stage_ACT_wire),
        .wb2_stage_ACT(main_wb2_stage_ACT_wire),
        .wb_coordination_ACT(main_wb_coordination_ACT_wire)
    );

    // instruction decoder instance:
    decoder1_t decoder1 (
        .ACT(id1_stage_decoder1_ACT_wire),
        .codasip_param_0(id1_stage_decoder1_codasip_param_0_wire),
        .s_id1_aluop_D(s_id1_aluop),
        .s_id1_alusrc1_D(s_id1_alusrc1),
        .s_id1_alusrc2_D(s_id1_alusrc2),
        .s_id1_branchop_D(s_id1_branchop),
        .s_id1_brnch_sel_D(s_id1_brnch_sel),
        .s_id1_immsel_D(s_id1_immsel),
        .s_id1_memop_D(s_id1_memop),
        .s_id1_regwrite_D(s_id1_regwrite),
        .s_id1_rfwt_sel_D(s_id1_rfwt_sel)
    );

    // instruction decoder instance:
    decoder2_t decoder2 (
        .ACT(id2_stage_decoder2_ACT_wire),
        .codasip_param_0(id2_stage_decoder2_codasip_param_0_wire),
        .s_id2_aluop_D(s_id2_aluop),
        .s_id2_alusrc1_D(s_id2_alusrc1),
        .s_id2_alusrc2_D(s_id2_alusrc2),
        .s_id2_branchop_D(s_id2_branchop),
        .s_id2_brnch_sel_D(s_id2_brnch_sel),
        .s_id2_immsel_D(s_id2_immsel),
        .s_id2_memop_D(s_id2_memop),
        .s_id2_regwrite_D(s_id2_regwrite),
        .s_id2_rfwt_sel_D(s_id2_rfwt_sel)
    );

    // pipeline controller instance:
    pipe_t pipe (
        .EX1_CLEAR_D(pipeline_control_pipe_EX1_CLEAR_D_wire),
        .EX1_STALL_D(pipeline_control_pipe_EX1_STALL_D_wire),
        .EX2_CLEAR_D(pipeline_control_pipe_EX2_CLEAR_D_wire),
        .EX2_STALL_D(pipeline_control_pipe_EX2_STALL_D_wire),
        .ID1_CLEAR_D(pipeline_control_pipe_ID1_CLEAR_D_wire),
        .ID1_STALL_D(pipeline_control_pipe_ID1_STALL_D_wire),
        .ID2_CLEAR_D(pipeline_control_pipe_ID2_CLEAR_D_wire),
        .ID2_STALL_D(pipeline_control_pipe_ID2_STALL_D_wire),
        .IF_STALL_D(pipeline_control_pipe_IF_STALL_D_wire),
        .ME1_CLEAR_D(pipeline_control_pipe_ME1_CLEAR_D_wire),
        .ME1_STALL_D(pipeline_control_pipe_ME1_STALL_D_wire),
        .ME2_CLEAR_D(pipeline_control_pipe_ME2_CLEAR_D_wire),
        .ME2_STALL_D(pipeline_control_pipe_ME2_STALL_D_wire),
        .WB1_CLEAR_D(pipeline_control_pipe_WB1_CLEAR_D_wire),
        .WB1_STALL_D(pipeline_control_pipe_WB1_STALL_D_wire),
        .WB2_CLEAR_D(pipeline_control_pipe_WB2_CLEAR_D_wire),
        .WB2_STALL_D(pipeline_control_pipe_WB2_STALL_D_wire),
        .EX1_CLEAR_Q(pipe_EX1_CLEAR_Q_wire),
        .EX1_STALL_Q(pipe_EX1_STALL_Q_wire),
        .EX2_CLEAR_Q(pipe_EX2_CLEAR_Q_wire),
        .EX2_STALL_Q(pipe_EX2_STALL_Q_wire),
        .ID1_CLEAR_Q(pipe_ID1_CLEAR_Q_wire),
        .ID1_STALL_Q(pipe_ID1_STALL_Q_wire),
        .ID2_CLEAR_Q(pipe_ID2_CLEAR_Q_wire),
        .ID2_STALL_Q(pipe_ID2_STALL_Q_wire),
        .IF_STALL_Q(pipe_IF_STALL_Q_wire),
        .ME1_CLEAR_Q(pipe_ME1_CLEAR_Q_wire),
        .ME1_STALL_Q(pipe_ME1_STALL_Q_wire),
        .ME2_CLEAR_Q(pipe_ME2_CLEAR_Q_wire),
        .ME2_STALL_Q(pipe_ME2_STALL_Q_wire),
        .WB1_CLEAR_Q(pipe_WB1_CLEAR_Q_wire),
        .WB1_STALL_Q(pipe_WB1_STALL_Q_wire),
        .WB2_CLEAR_Q(pipe_WB2_CLEAR_Q_wire),
        .WB2_STALL_Q(pipe_WB2_STALL_Q_wire)
    );

    // startup controller instance:
    codasip_startup_ctrl_t codasip_startup_ctrl (
        .CLK(CLK),
        .RST(RST),
        .main_ACT(codasip_startup_ctrl_main_ACT_wire),
        .reset_ACT(codasip_startup_ctrl_reset_ACT_wire)
    );

endmodule // t
