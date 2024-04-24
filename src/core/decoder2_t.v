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
 *  \brief   Contains module definition of the 'decoder2_t' instruction decoder.
 */

module decoder2_t(
    input  wire ACT,
    input  wire [16:0] codasip_param_0,
    output wire [3:0] s_id2_aluop_D,
    output wire s_id2_alusrc1_D,
    output wire s_id2_alusrc2_D,
    output wire [2:0] s_id2_branchop_D,
    output wire s_id2_brnch_sel_D,
    output wire [2:0] s_id2_immsel_D,
    output wire [3:0] s_id2_memop_D,
    output wire s_id2_regwrite_D,
    output wire [1:0] s_id2_rfwt_sel_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire [16:0] codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc;
    // signal/wire
    wire [9:0] codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc;
    // signal/wire
    wire [16:0] codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc;
    // signal/wire
    wire [9:0] codasip_return_MI15opc_itype_jlregIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_jlreg3opc;
    // signal/wire
    wire [6:0] codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ops3opc;
    // signal/wire
    wire [9:0] codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc;
    // signal/wire
    wire [6:0] codasip_return_MI15opc_jtype_jlinkIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_jtype_jlink3opc;
    // signal/wire
    wire [9:0] codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc;
    // signal/wire
    wire [9:0] codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc;
    // signal/wire
    wire cs_0_wire;
    // signal/wire
    wire cs_10_wire;
    // signal/wire
    wire cs_11_wire;
    // signal/wire
    wire cs_12_wire;
    // signal/wire
    wire cs_13_wire;
    // signal/wire
    wire cs_14_wire;
    // signal/wire
    wire cs_15_wire;
    // signal/wire
    wire cs_16_wire;
    // signal/wire
    wire cs_17_wire;
    // signal/wire
    wire cs_18_wire;
    // signal/wire
    wire cs_19_wire;
    // signal/wire
    wire cs_1_wire;
    // signal/wire
    wire cs_20_wire;
    // signal/wire
    wire cs_21_wire;
    // signal/wire
    wire cs_22_wire;
    // signal/wire
    wire cs_23_wire;
    // signal/wire
    wire cs_24_wire;
    // signal/wire
    wire cs_25_wire;
    // signal/wire
    wire cs_26_wire;
    // signal/wire
    wire cs_27_wire;
    // signal/wire
    wire cs_28_wire;
    // signal/wire
    wire cs_29_wire;
    // signal/wire
    wire cs_2_wire;
    // signal/wire
    wire cs_30_wire;
    // signal/wire
    wire cs_31_wire;
    // signal/wire
    wire cs_32_wire;
    // signal/wire
    wire cs_33_wire;
    // signal/wire
    wire cs_34_wire;
    // signal/wire
    wire cs_35_wire;
    // signal/wire
    wire cs_36_wire;
    // signal/wire
    wire cs_37_wire;
    // signal/wire
    wire cs_38_wire;
    // signal/wire
    wire cs_39_wire;
    // signal/wire
    wire cs_3_wire;
    // signal/wire
    wire cs_40_wire;
    // signal/wire
    wire cs_41_wire;
    // signal/wire
    wire cs_42_wire;
    // signal/wire
    wire cs_43_wire;
    // signal/wire
    wire cs_44_wire;
    // signal/wire
    wire cs_45_wire;
    // signal/wire
    wire cs_46_wire;
    // signal/wire
    wire cs_47_wire;
    // signal/wire
    wire cs_4_wire;
    // signal/wire
    wire cs_5_wire;
    // signal/wire
    wire cs_6_wire;
    // signal/wire
    wire cs_7_wire;
    // signal/wire
    wire cs_8_wire;
    // signal/wire
    wire cs_9_wire;
    // signal/wire
    wire invalid_instruction_wire;
    // signal/wire
    wire vs_0_wire;
    // signal/wire
    wire vs_1_wire;
    // signal/wire
    wire vs_2_wire;
    // signal/wire
    wire [9:0] codasip_tmp_var_0_i_hw2_itype_alu_decoder2_decoder2_id2_stage_id2_stage;
    // signal/wire
    wire [16:0] codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage;
    // signal/wire
    wire [6:0] codasip_tmp_var_0_i_hw2_utype_ops_decoder2_decoder2_id2_stage_id2_stage;
    // signal/wire
    wire codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage;
    // signal/wire
    wire [9:0] codasip_tmp_var_0_i_hw2_itype_loads_decoder2_decoder2_id2_stage_id2_stage;
    // signal/wire
    wire codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage;
    // signal/wire
    wire [9:0] codasip_tmp_var_0_i_hw2_stype_store_decoder2_decoder2_id2_stage_id2_stage;
    // signal/wire
    wire [16:0] codasip_tmp_var_0_i_hw2_itype_special_decoder2_decoder2_id2_stage_id2_stage;
    // signal/wire
    wire [9:0] codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage;
    // signal/wire
    wire i_hw2_halt_ACT;
    // signal/wire
    wire i_hw2_itype_alu_ACT;
    // signal/wire
    wire i_hw2_rtype_alu_ACT;
    // signal/wire
    wire i_hw2_utype_ops_ACT;
    // signal/wire
    wire i_hw2_itype_jlreg_ACT;
    // signal/wire
    wire i_hw2_itype_loads_ACT;
    // signal/wire
    wire i_hw2_jtype_jlink_ACT;
    // signal/wire
    wire i_hw2_stype_store_ACT;
    // signal/wire
    wire i_hw2_itype_special_ACT;
    // signal/wire
    wire i_hw2_btype_branches_ACT;
    // signal/wire
    wire opc_lb_opc_decoder2_ACT;
    // signal/wire
    wire opc_lh_opc_decoder2_ACT;
    // signal/wire
    wire opc_lw_opc_decoder2_ACT;
    // signal/wire
    wire opc_or_opc_decoder2_ACT;
    // signal/wire
    wire opc_sb_opc_decoder2_ACT;
    // signal/wire
    wire opc_sh_opc_decoder2_ACT;
    // signal/wire
    wire opc_sw_opc_decoder2_ACT;
    // signal/wire
    wire opc_add_opc_decoder2_ACT;
    // signal/wire
    wire opc_and_opc_decoder2_ACT;
    // signal/wire
    wire opc_beq_opc_decoder2_ACT;
    // signal/wire
    wire opc_bge_opc_decoder2_ACT;
    // signal/wire
    wire opc_blt_opc_decoder2_ACT;
    // signal/wire
    wire opc_bne_opc_decoder2_ACT;
    // signal/wire
    wire opc_jal_opc_decoder2_ACT;
    // signal/wire
    wire opc_lbu_opc_decoder2_ACT;
    // signal/wire
    wire opc_lhu_opc_decoder2_ACT;
    // signal/wire
    wire opc_lui_opc_decoder2_ACT;
    // signal/wire
    wire opc_ori_opc_decoder2_ACT;
    // signal/wire
    wire opc_sll_opc_decoder2_ACT;
    // signal/wire
    wire opc_slt_opc_decoder2_ACT;
    // signal/wire
    wire opc_sra_opc_decoder2_ACT;
    // signal/wire
    wire opc_srl_opc_decoder2_ACT;
    // signal/wire
    wire opc_sub_opc_decoder2_ACT;
    // signal/wire
    wire opc_xor_opc_decoder2_ACT;
    // signal/wire
    wire opc_addi_opc_decoder2_ACT;
    // signal/wire
    wire opc_andi_opc_decoder2_ACT;
    // signal/wire
    wire opc_bgeu_opc_decoder2_ACT;
    // signal/wire
    wire opc_bltu_opc_decoder2_ACT;
    // signal/wire
    wire opc_jalr_opc_decoder2_ACT;
    // signal/wire
    wire opc_slli_opc_decoder2_ACT;
    // signal/wire
    wire opc_slti_opc_decoder2_ACT;
    // signal/wire
    wire opc_sltu_opc_decoder2_ACT;
    // signal/wire
    wire opc_srai_opc_decoder2_ACT;
    // signal/wire
    wire opc_srli_opc_decoder2_ACT;
    // signal/wire
    wire opc_xori_opc_decoder2_ACT;
    // signal/wire
    wire opc_auipc_opc_decoder2_ACT;
    // signal/wire
    wire opc_sltiu_opc_decoder2_ACT;
    // signal/wire
    wire [3:0] i_hw2_halt_s_id2_aluop_D;
    // signal/wire
    wire i_hw2_halt_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_halt_s_id2_alusrc2_D;
    // signal/wire
    wire [2:0] i_hw2_halt_s_id2_immsel_D;
    // signal/wire
    wire [2:0] i_hw2_halt_s_id2_branchop_D;
    // signal/wire
    wire i_hw2_halt_s_id2_brnch_sel_D;
    // signal/wire
    wire [3:0] i_hw2_halt_s_id2_memop_D;
    // signal/wire
    wire i_hw2_halt_s_id2_regwrite_D;
    // signal/wire
    wire [1:0] i_hw2_halt_s_id2_rfwt_sel_D;
    // signal/wire
    wire i_hw2_itype_alu_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_itype_alu_s_id2_alusrc2_D;
    // signal/wire
    wire [2:0] i_hw2_itype_alu_s_id2_immsel_D;
    // signal/wire
    wire i_hw2_itype_alu_s_id2_regwrite_D;
    // signal/wire
    wire [1:0] i_hw2_itype_alu_s_id2_rfwt_sel_D;
    // signal/wire
    wire [2:0] i_hw2_itype_alu_s_id2_branchop_D;
    // signal/wire
    wire i_hw2_itype_alu_s_id2_brnch_sel_D;
    // signal/wire
    wire [3:0] i_hw2_itype_alu_s_id2_memop_D;
    // signal/wire
    wire [3:0] i_hw2_itype_alu_s_id2_aluop_D;
    // signal/wire
    wire [3:0] i_hw2_itype_alu_s_id2_aluop_D_ACT;
    // signal/wire
    wire i_hw2_rtype_alu_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_rtype_alu_s_id2_alusrc2_D;
    // signal/wire
    wire [2:0] i_hw2_rtype_alu_s_id2_immsel_D;
    // signal/wire
    wire i_hw2_rtype_alu_s_id2_regwrite_D;
    // signal/wire
    wire [1:0] i_hw2_rtype_alu_s_id2_rfwt_sel_D;
    // signal/wire
    wire [2:0] i_hw2_rtype_alu_s_id2_branchop_D;
    // signal/wire
    wire i_hw2_rtype_alu_s_id2_brnch_sel_D;
    // signal/wire
    wire [3:0] i_hw2_rtype_alu_s_id2_memop_D;
    // signal/wire
    wire [3:0] i_hw2_rtype_alu_s_id2_aluop_D;
    // signal/wire
    wire [3:0] i_hw2_rtype_alu_s_id2_aluop_D_ACT;
    // signal/wire
    wire [3:0] i_hw2_utype_ops_s_id2_aluop_D;
    // signal/wire
    wire i_hw2_utype_ops_s_id2_alusrc2_D;
    // signal/wire
    wire [2:0] i_hw2_utype_ops_s_id2_immsel_D;
    // signal/wire
    wire i_hw2_utype_ops_s_id2_regwrite_D;
    // signal/wire
    wire [1:0] i_hw2_utype_ops_s_id2_rfwt_sel_D;
    // signal/wire
    wire [2:0] i_hw2_utype_ops_s_id2_branchop_D;
    // signal/wire
    wire i_hw2_utype_ops_s_id2_brnch_sel_D;
    // signal/wire
    wire [3:0] i_hw2_utype_ops_s_id2_memop_D;
    // signal/wire
    wire i_hw2_utype_ops_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_utype_ops_s_id2_alusrc1_D_ACT;
    // signal/wire
    wire [3:0] i_hw2_itype_jlreg_s_id2_aluop_D;
    // signal/wire
    wire [3:0] i_hw2_itype_jlreg_s_id2_aluop_D_ACT;
    // signal/wire
    wire i_hw2_itype_jlreg_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_itype_jlreg_s_id2_alusrc1_D_ACT;
    // signal/wire
    wire i_hw2_itype_jlreg_s_id2_alusrc2_D;
    // signal/wire
    wire i_hw2_itype_jlreg_s_id2_alusrc2_D_ACT;
    // signal/wire
    wire [2:0] i_hw2_itype_jlreg_s_id2_immsel_D;
    // signal/wire
    wire [2:0] i_hw2_itype_jlreg_s_id2_immsel_D_ACT;
    // signal/wire
    wire i_hw2_itype_jlreg_s_id2_regwrite_D;
    // signal/wire
    wire i_hw2_itype_jlreg_s_id2_regwrite_D_ACT;
    // signal/wire
    wire [1:0] i_hw2_itype_jlreg_s_id2_rfwt_sel_D;
    // signal/wire
    wire [1:0] i_hw2_itype_jlreg_s_id2_rfwt_sel_D_ACT;
    // signal/wire
    wire [2:0] i_hw2_itype_jlreg_s_id2_branchop_D;
    // signal/wire
    wire [2:0] i_hw2_itype_jlreg_s_id2_branchop_D_ACT;
    // signal/wire
    wire i_hw2_itype_jlreg_s_id2_brnch_sel_D;
    // signal/wire
    wire i_hw2_itype_jlreg_s_id2_brnch_sel_D_ACT;
    // signal/wire
    wire [3:0] i_hw2_itype_jlreg_s_id2_memop_D;
    // signal/wire
    wire [3:0] i_hw2_itype_jlreg_s_id2_memop_D_ACT;
    // signal/wire
    wire [3:0] i_hw2_itype_loads_s_id2_aluop_D;
    // signal/wire
    wire i_hw2_itype_loads_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_itype_loads_s_id2_alusrc2_D;
    // signal/wire
    wire [2:0] i_hw2_itype_loads_s_id2_immsel_D;
    // signal/wire
    wire i_hw2_itype_loads_s_id2_regwrite_D;
    // signal/wire
    wire [1:0] i_hw2_itype_loads_s_id2_rfwt_sel_D;
    // signal/wire
    wire [2:0] i_hw2_itype_loads_s_id2_branchop_D;
    // signal/wire
    wire i_hw2_itype_loads_s_id2_brnch_sel_D;
    // signal/wire
    wire [3:0] i_hw2_itype_loads_s_id2_memop_D;
    // signal/wire
    wire [3:0] i_hw2_itype_loads_s_id2_memop_D_ACT;
    // signal/wire
    wire [3:0] i_hw2_jtype_jlink_s_id2_aluop_D;
    // signal/wire
    wire [3:0] i_hw2_jtype_jlink_s_id2_aluop_D_ACT;
    // signal/wire
    wire i_hw2_jtype_jlink_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_jtype_jlink_s_id2_alusrc1_D_ACT;
    // signal/wire
    wire i_hw2_jtype_jlink_s_id2_alusrc2_D;
    // signal/wire
    wire i_hw2_jtype_jlink_s_id2_alusrc2_D_ACT;
    // signal/wire
    wire [2:0] i_hw2_jtype_jlink_s_id2_immsel_D;
    // signal/wire
    wire [2:0] i_hw2_jtype_jlink_s_id2_immsel_D_ACT;
    // signal/wire
    wire i_hw2_jtype_jlink_s_id2_regwrite_D;
    // signal/wire
    wire i_hw2_jtype_jlink_s_id2_regwrite_D_ACT;
    // signal/wire
    wire [1:0] i_hw2_jtype_jlink_s_id2_rfwt_sel_D;
    // signal/wire
    wire [1:0] i_hw2_jtype_jlink_s_id2_rfwt_sel_D_ACT;
    // signal/wire
    wire [2:0] i_hw2_jtype_jlink_s_id2_branchop_D;
    // signal/wire
    wire [2:0] i_hw2_jtype_jlink_s_id2_branchop_D_ACT;
    // signal/wire
    wire i_hw2_jtype_jlink_s_id2_brnch_sel_D;
    // signal/wire
    wire i_hw2_jtype_jlink_s_id2_brnch_sel_D_ACT;
    // signal/wire
    wire [3:0] i_hw2_jtype_jlink_s_id2_memop_D;
    // signal/wire
    wire [3:0] i_hw2_jtype_jlink_s_id2_memop_D_ACT;
    // signal/wire
    wire [3:0] i_hw2_stype_store_s_id2_aluop_D;
    // signal/wire
    wire i_hw2_stype_store_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_stype_store_s_id2_alusrc2_D;
    // signal/wire
    wire [2:0] i_hw2_stype_store_s_id2_immsel_D;
    // signal/wire
    wire i_hw2_stype_store_s_id2_regwrite_D;
    // signal/wire
    wire [1:0] i_hw2_stype_store_s_id2_rfwt_sel_D;
    // signal/wire
    wire [2:0] i_hw2_stype_store_s_id2_branchop_D;
    // signal/wire
    wire i_hw2_stype_store_s_id2_brnch_sel_D;
    // signal/wire
    wire [3:0] i_hw2_stype_store_s_id2_memop_D;
    // signal/wire
    wire [3:0] i_hw2_stype_store_s_id2_memop_D_ACT;
    // signal/wire
    wire i_hw2_itype_special_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_itype_special_s_id2_alusrc2_D;
    // signal/wire
    wire [2:0] i_hw2_itype_special_s_id2_immsel_D;
    // signal/wire
    wire i_hw2_itype_special_s_id2_regwrite_D;
    // signal/wire
    wire [1:0] i_hw2_itype_special_s_id2_rfwt_sel_D;
    // signal/wire
    wire [2:0] i_hw2_itype_special_s_id2_branchop_D;
    // signal/wire
    wire i_hw2_itype_special_s_id2_brnch_sel_D;
    // signal/wire
    wire [3:0] i_hw2_itype_special_s_id2_memop_D;
    // signal/wire
    wire [3:0] i_hw2_itype_special_s_id2_aluop_D;
    // signal/wire
    wire [3:0] i_hw2_itype_special_s_id2_aluop_D_ACT;
    // signal/wire
    wire i_hw2_btype_branches_s_id2_alusrc1_D;
    // signal/wire
    wire i_hw2_btype_branches_s_id2_alusrc2_D;
    // signal/wire
    wire [2:0] i_hw2_btype_branches_s_id2_immsel_D;
    // signal/wire
    wire i_hw2_btype_branches_s_id2_regwrite_D;
    // signal/wire
    wire [1:0] i_hw2_btype_branches_s_id2_rfwt_sel_D;
    // signal/wire
    wire i_hw2_btype_branches_s_id2_brnch_sel_D;
    // signal/wire
    wire [3:0] i_hw2_btype_branches_s_id2_memop_D;
    // signal/wire
    wire [3:0] i_hw2_btype_branches_s_id2_aluop_D;
    // signal/wire
    wire [3:0] i_hw2_btype_branches_s_id2_aluop_D_ACT;
    // signal/wire
    wire [2:0] i_hw2_btype_branches_s_id2_branchop_D;
    // signal/wire
    wire [2:0] i_hw2_btype_branches_s_id2_branchop_D_ACT;
    // signal/wire
    wire [9:0] opc_lb_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D;
    // signal/wire
    wire [9:0] opc_lh_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D;
    // signal/wire
    wire [9:0] opc_lw_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D;
    // signal/wire
    wire [16:0] opc_or_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [9:0] opc_sb_opc_decoder2_codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc_D;
    // signal/wire
    wire [9:0] opc_sh_opc_decoder2_codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc_D;
    // signal/wire
    wire [9:0] opc_sw_opc_decoder2_codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc_D;
    // signal/wire
    wire [16:0] opc_add_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [16:0] opc_and_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [9:0] opc_beq_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D;
    // signal/wire
    wire [9:0] opc_bge_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D;
    // signal/wire
    wire [9:0] opc_blt_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D;
    // signal/wire
    wire [9:0] opc_bne_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D;
    // signal/wire
    wire [6:0] opc_jal_opc_decoder2_codasip_return_MI15opc_jtype_jlinkIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_jtype_jlink3opc_D;
    // signal/wire
    wire [9:0] opc_lbu_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D;
    // signal/wire
    wire [9:0] opc_lhu_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D;
    // signal/wire
    wire [6:0] opc_lui_opc_decoder2_codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ops3opc_D;
    // signal/wire
    wire [9:0] opc_ori_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D;
    // signal/wire
    wire [16:0] opc_sll_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [16:0] opc_slt_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [16:0] opc_sra_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [16:0] opc_srl_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [16:0] opc_sub_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [16:0] opc_xor_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [9:0] opc_addi_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D;
    // signal/wire
    wire [9:0] opc_andi_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D;
    // signal/wire
    wire [9:0] opc_bgeu_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D;
    // signal/wire
    wire [9:0] opc_bltu_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D;
    // signal/wire
    wire [9:0] opc_jalr_opc_decoder2_codasip_return_MI15opc_itype_jlregIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_jlreg3opc_D;
    // signal/wire
    wire [16:0] opc_slli_opc_decoder2_codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc_D;
    // signal/wire
    wire [9:0] opc_slti_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D;
    // signal/wire
    wire [16:0] opc_sltu_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D;
    // signal/wire
    wire [16:0] opc_srai_opc_decoder2_codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc_D;
    // signal/wire
    wire [16:0] opc_srli_opc_decoder2_codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc_D;
    // signal/wire
    wire [9:0] opc_xori_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D;
    // signal/wire
    wire [6:0] opc_auipc_opc_decoder2_codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ops3opc_D;
    // signal/wire
    wire [9:0] opc_sltiu_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D;

    // additional declarations:
    // temporary variable for multiplexer, should not be synthesized as register
    reg tmp_codasip_conv_mux_i_hw2_utype_ops_s_id2_alusrc1_D_1;

    // data-path code:
    assign cs_0_wire = (((codasip_param_0[6:0] == 7'h3f) || ({codasip_param_0[6], codasip_param_0[4:0]} == 6'h17)) || (codasip_param_0[6:0] == 7'h6f)) ? 1'b1 : 1'b0;
    assign cs_10_wire = (codasip_param_0[9:0] == 10'h0a3) ? 1'b1 : 1'b0;
    assign cs_11_wire = (codasip_param_0[9:0] == 10'h123) ? 1'b1 : 1'b0;
    assign cs_12_wire = ((codasip_param_0[9:0] == 10'h103) || ({codasip_param_0[8], codasip_param_0[6:0]} == 8'h03)) ? 1'b1 : 1'b0;
    assign cs_13_wire = (codasip_param_0[9:0] == 10'h103) ? 1'b1 : 1'b0;
    assign cs_14_wire = (codasip_param_0[9:0] == 10'h003) ? 1'b1 : 1'b0;
    assign cs_15_wire = (codasip_param_0[9:0] == 10'h083) ? 1'b1 : 1'b0;
    assign cs_16_wire = (codasip_param_0[9:0] == 10'h203) ? 1'b1 : 1'b0;
    assign cs_17_wire = (codasip_param_0[9:0] == 10'h283) ? 1'b1 : 1'b0;
    assign cs_18_wire = (({codasip_param_0[9:8], codasip_param_0[6:0]} == 9'h1e3) || ({codasip_param_0[8], codasip_param_0[6:0]} == 8'h63)) ? 1'b1 : 1'b0;
    assign cs_19_wire = (codasip_param_0[9:0] == 10'h363) ? 1'b1 : 1'b0;
    assign cs_1_wire = (codasip_param_0[6:0] == 7'h3f) ? 1'b1 : 1'b0;
    assign cs_20_wire = (codasip_param_0[9:0] == 10'h3e3) ? 1'b1 : 1'b0;
    assign cs_21_wire = (codasip_param_0[9:0] == 10'h063) ? 1'b1 : 1'b0;
    assign cs_22_wire = (codasip_param_0[9:0] == 10'h0e3) ? 1'b1 : 1'b0;
    assign cs_23_wire = (codasip_param_0[9:0] == 10'h263) ? 1'b1 : 1'b0;
    assign cs_24_wire = (codasip_param_0[9:0] == 10'h2e3) ? 1'b1 : 1'b0;
    assign cs_25_wire = ((codasip_param_0[8:0] == 9'h193) || (codasip_param_0[7:0] == 8'h13)) ? 1'b1 : 1'b0;
    assign cs_26_wire = (codasip_param_0[9:0] == 10'h193) ? 1'b1 : 1'b0;
    assign cs_27_wire = (codasip_param_0[9:0] == 10'h393) ? 1'b1 : 1'b0;
    assign cs_28_wire = (codasip_param_0[9:0] == 10'h013) ? 1'b1 : 1'b0;
    assign cs_29_wire = (codasip_param_0[9:0] == 10'h113) ? 1'b1 : 1'b0;
    assign cs_2_wire = ({codasip_param_0[6], codasip_param_0[4:0]} == 6'h17) ? 1'b1 : 1'b0;
    assign cs_30_wire = (codasip_param_0[9:0] == 10'h213) ? 1'b1 : 1'b0;
    assign cs_31_wire = (codasip_param_0[9:0] == 10'h313) ? 1'b1 : 1'b0;
    assign cs_32_wire = (((({codasip_param_0[16:10], codasip_param_0[8:0]} == 16'h0093) || ({codasip_param_0[16:10], codasip_param_0[6:0]} == 14'h0033)) || (codasip_param_0 == 17'h08033)) || ({codasip_param_0[16:6], codasip_param_0[4:0]} == 16'h4153)) ? 1'b1 : 1'b0;
    assign cs_33_wire = (({codasip_param_0[16:10], codasip_param_0[8:0]} == 16'h0093) || (codasip_param_0 == 17'h08293)) ? 1'b1 : 1'b0;
    assign cs_34_wire = (codasip_param_0 == 17'h00093) ? 1'b1 : 1'b0;
    assign cs_35_wire = (codasip_param_0 == 17'h00293) ? 1'b1 : 1'b0;
    assign cs_36_wire = (codasip_param_0 == 17'h08293) ? 1'b1 : 1'b0;
    assign cs_37_wire = ((({codasip_param_0[16:10], codasip_param_0[6:0]} == 14'h0033) || (codasip_param_0 == 17'h08033)) || (codasip_param_0 == 17'h082b3)) ? 1'b1 : 1'b0;
    assign cs_38_wire = (codasip_param_0 == 17'h00033) ? 1'b1 : 1'b0;
    assign cs_39_wire = (codasip_param_0 == 17'h000b3) ? 1'b1 : 1'b0;
    assign cs_3_wire = (codasip_param_0[6:0] == 7'h17) ? 1'b1 : 1'b0;
    assign cs_40_wire = (codasip_param_0 == 17'h00133) ? 1'b1 : 1'b0;
    assign cs_41_wire = (codasip_param_0 == 17'h001b3) ? 1'b1 : 1'b0;
    assign cs_42_wire = (codasip_param_0 == 17'h00233) ? 1'b1 : 1'b0;
    assign cs_43_wire = (codasip_param_0 == 17'h002b3) ? 1'b1 : 1'b0;
    assign cs_44_wire = (codasip_param_0 == 17'h00333) ? 1'b1 : 1'b0;
    assign cs_45_wire = (codasip_param_0 == 17'h003b3) ? 1'b1 : 1'b0;
    assign cs_46_wire = (codasip_param_0 == 17'h08033) ? 1'b1 : 1'b0;
    assign cs_47_wire = (codasip_param_0 == 17'h082b3) ? 1'b1 : 1'b0;
    assign cs_4_wire = (codasip_param_0[6:0] == 7'h37) ? 1'b1 : 1'b0;
    assign cs_5_wire = (codasip_param_0[6:0] == 7'h6f) ? 1'b1 : 1'b0;
    assign cs_6_wire = (((((((((codasip_param_0[9:0] == 10'h067) || ({codasip_param_0[9:8], codasip_param_0[6:0]} == 9'h023)) || (codasip_param_0[9:0] == 10'h103)) || (codasip_param_0[9:0] == 10'h123)) || ({codasip_param_0[9:8], codasip_param_0[6:0]} == 9'h1e3)) || ({codasip_param_0[8], codasip_param_0[6:0]} == 8'h03)) || ({codasip_param_0[8], codasip_param_0[6:0]} == 8'h63)) || (codasip_param_0[8:0] == 9'h193)) || (codasip_param_0[7:0] == 8'h13)) ? 1'b1 : 1'b0;
    assign cs_7_wire = (codasip_param_0[9:0] == 10'h067) ? 1'b1 : 1'b0;
    assign cs_8_wire = (({codasip_param_0[9:8], codasip_param_0[6:0]} == 9'h023) || (codasip_param_0[9:0] == 10'h123)) ? 1'b1 : 1'b0;
    assign cs_9_wire = (codasip_param_0[9:0] == 10'h023) ? 1'b1 : 1'b0;
    assign invalid_instruction_wire = ((ACT == 1'b1) && ((vs_2_wire || (vs_1_wire || vs_0_wire)) == 1'b0)) ? 1'b1 : 1'b0;
    assign vs_0_wire = ((codasip_param_0[6:0] == 7'h6f) || (({codasip_param_0[6], codasip_param_0[4:0]} == 6'h17) || (codasip_param_0[6:0] == 7'h3f))) ? 1'b1 : 1'b0;
    assign vs_1_wire = (((codasip_param_0[8:0] == 9'h193) || (codasip_param_0[7:0] == 8'h13)) || ((({codasip_param_0[9:8], codasip_param_0[6:0]} == 9'h1e3) || ({codasip_param_0[8], codasip_param_0[6:0]} == 8'h63)) || (((codasip_param_0[9:0] == 10'h103) || ({codasip_param_0[8], codasip_param_0[6:0]} == 8'h03)) || ((({codasip_param_0[9:8], codasip_param_0[6:0]} == 9'h023) || (codasip_param_0[9:0] == 10'h123)) || (codasip_param_0[9:0] == 10'h067))))) ? 1'b1 : 1'b0;
    assign vs_2_wire = (((({codasip_param_0[16:10], codasip_param_0[6:0]} == 14'h0033) || (codasip_param_0 == 17'h08033)) || (codasip_param_0 == 17'h082b3)) || (({codasip_param_0[16:10], codasip_param_0[8:0]} == 16'h0093) || (codasip_param_0 == 17'h08293))) ? 1'b1 : 1'b0;
    assign i_hw2_halt_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_1_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw2_itype_alu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_6_wire == 1'b1) && (cs_25_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw2_rtype_alu_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw2_utype_ops_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_2_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw2_itype_jlreg_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_6_wire == 1'b1) && (cs_7_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw2_itype_loads_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_6_wire == 1'b1) && (cs_12_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw2_jtype_jlink_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_5_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw2_stype_store_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_6_wire == 1'b1) && (cs_8_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw2_itype_special_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_32_wire == 1'b1) && (cs_33_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign i_hw2_btype_branches_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_6_wire == 1'b1) && (cs_18_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_lb_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_12_wire == 1'b1)) && (cs_14_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_lh_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_12_wire == 1'b1)) && (cs_15_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_lw_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_12_wire == 1'b1)) && (cs_13_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_or_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_44_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sb_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_8_wire == 1'b1)) && (cs_9_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sh_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_8_wire == 1'b1)) && (cs_10_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sw_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_8_wire == 1'b1)) && (cs_11_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_add_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_38_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_and_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_45_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_beq_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_18_wire == 1'b1)) && (cs_21_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bge_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_18_wire == 1'b1)) && (cs_24_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_blt_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_18_wire == 1'b1)) && (cs_23_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bne_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_18_wire == 1'b1)) && (cs_22_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_jal_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_0_wire == 1'b1) && (cs_5_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_lbu_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_12_wire == 1'b1)) && (cs_16_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_lhu_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_12_wire == 1'b1)) && (cs_17_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_lui_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_0_wire == 1'b1) && (cs_2_wire == 1'b1)) && (cs_4_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_ori_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_25_wire == 1'b1)) && (cs_31_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sll_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_39_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_slt_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_40_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sra_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_47_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_srl_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_43_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sub_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_46_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_xor_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_42_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_addi_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_25_wire == 1'b1)) && (cs_28_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_andi_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_25_wire == 1'b1)) && (cs_27_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bgeu_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_18_wire == 1'b1)) && (cs_20_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_bltu_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_18_wire == 1'b1)) && (cs_19_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_jalr_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && ((cs_6_wire == 1'b1) && (cs_7_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_slli_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_33_wire == 1'b1)) && (cs_34_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_slti_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_25_wire == 1'b1)) && (cs_29_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sltu_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_37_wire == 1'b1)) && (cs_41_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_srai_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_33_wire == 1'b1)) && (cs_36_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_srli_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_32_wire == 1'b1) && (cs_33_wire == 1'b1)) && (cs_35_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_xori_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_25_wire == 1'b1)) && (cs_30_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_auipc_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_0_wire == 1'b1) && (cs_2_wire == 1'b1)) && (cs_3_wire == 1'b1))) ? 1'b1 : 1'b0;
    assign opc_sltiu_opc_decoder2_ACT = (((invalid_instruction_wire == 1'b0) && (ACT == 1'b1)) && (((cs_6_wire == 1'b1) && (cs_25_wire == 1'b1)) && (cs_26_wire == 1'b1))) ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:64:9
    // s_id2_aluop.write((uint1)(0x0));
    assign i_hw2_halt_s_id2_aluop_D = i_hw2_halt_ACT ? 4'h0 : 4'h0;
    assign s_id2_aluop_D = (((((((((i_hw2_halt_s_id2_aluop_D | i_hw2_itype_alu_s_id2_aluop_D_ACT) | i_hw2_rtype_alu_s_id2_aluop_D_ACT) | i_hw2_utype_ops_s_id2_aluop_D) | i_hw2_itype_jlreg_s_id2_aluop_D_ACT) | i_hw2_itype_loads_s_id2_aluop_D) | i_hw2_jtype_jlink_s_id2_aluop_D_ACT) | i_hw2_stype_store_s_id2_aluop_D) | i_hw2_itype_special_s_id2_aluop_D_ACT) | i_hw2_btype_branches_s_id2_aluop_D_ACT);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:65:9
    // s_id2_alusrc1.write((int32)(0x0));
    assign i_hw2_halt_s_id2_alusrc1_D = i_hw2_halt_ACT ? 1'b0 : 1'b0;
    assign s_id2_alusrc1_D = (((((((((i_hw2_halt_s_id2_alusrc1_D | i_hw2_itype_alu_s_id2_alusrc1_D) | i_hw2_rtype_alu_s_id2_alusrc1_D) | i_hw2_utype_ops_s_id2_alusrc1_D_ACT) | i_hw2_itype_jlreg_s_id2_alusrc1_D_ACT) | i_hw2_itype_loads_s_id2_alusrc1_D) | i_hw2_jtype_jlink_s_id2_alusrc1_D_ACT) | i_hw2_stype_store_s_id2_alusrc1_D) | i_hw2_itype_special_s_id2_alusrc1_D) | i_hw2_btype_branches_s_id2_alusrc1_D);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:66:9
    // s_id2_alusrc2.write((int32)(0x0));
    assign i_hw2_halt_s_id2_alusrc2_D = i_hw2_halt_ACT ? 1'b0 : 1'b0;
    assign s_id2_alusrc2_D = (((((((((i_hw2_halt_s_id2_alusrc2_D | i_hw2_itype_alu_s_id2_alusrc2_D) | i_hw2_rtype_alu_s_id2_alusrc2_D) | i_hw2_utype_ops_s_id2_alusrc2_D) | i_hw2_itype_jlreg_s_id2_alusrc2_D_ACT) | i_hw2_itype_loads_s_id2_alusrc2_D) | i_hw2_jtype_jlink_s_id2_alusrc2_D_ACT) | i_hw2_stype_store_s_id2_alusrc2_D) | i_hw2_itype_special_s_id2_alusrc2_D) | i_hw2_btype_branches_s_id2_alusrc2_D);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:67:9
    // s_id2_immsel.write((int32)(0x0));
    assign i_hw2_halt_s_id2_immsel_D = i_hw2_halt_ACT ? 3'h0 : 3'h0;
    assign s_id2_immsel_D = (((((((((i_hw2_halt_s_id2_immsel_D | i_hw2_itype_alu_s_id2_immsel_D) | i_hw2_rtype_alu_s_id2_immsel_D) | i_hw2_utype_ops_s_id2_immsel_D) | i_hw2_itype_jlreg_s_id2_immsel_D_ACT) | i_hw2_itype_loads_s_id2_immsel_D) | i_hw2_jtype_jlink_s_id2_immsel_D_ACT) | i_hw2_stype_store_s_id2_immsel_D) | i_hw2_itype_special_s_id2_immsel_D) | i_hw2_btype_branches_s_id2_immsel_D);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:68:9
    // s_id2_branchop.write((uint1)(0x0));
    assign i_hw2_halt_s_id2_branchop_D = i_hw2_halt_ACT ? 3'h0 : 3'h0;
    assign s_id2_branchop_D = (((((((((i_hw2_halt_s_id2_branchop_D | i_hw2_itype_alu_s_id2_branchop_D) | i_hw2_rtype_alu_s_id2_branchop_D) | i_hw2_utype_ops_s_id2_branchop_D) | i_hw2_itype_jlreg_s_id2_branchop_D_ACT) | i_hw2_itype_loads_s_id2_branchop_D) | i_hw2_jtype_jlink_s_id2_branchop_D_ACT) | i_hw2_stype_store_s_id2_branchop_D) | i_hw2_itype_special_s_id2_branchop_D) | i_hw2_btype_branches_s_id2_branchop_D_ACT);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:69:9
    // s_id2_brnch_sel.write((int32)(0x0));
    assign i_hw2_halt_s_id2_brnch_sel_D = i_hw2_halt_ACT ? 1'b0 : 1'b0;
    assign s_id2_brnch_sel_D = (((((((((i_hw2_halt_s_id2_brnch_sel_D | i_hw2_itype_alu_s_id2_brnch_sel_D) | i_hw2_rtype_alu_s_id2_brnch_sel_D) | i_hw2_utype_ops_s_id2_brnch_sel_D) | i_hw2_itype_jlreg_s_id2_brnch_sel_D_ACT) | i_hw2_itype_loads_s_id2_brnch_sel_D) | i_hw2_jtype_jlink_s_id2_brnch_sel_D_ACT) | i_hw2_stype_store_s_id2_brnch_sel_D) | i_hw2_itype_special_s_id2_brnch_sel_D) | i_hw2_btype_branches_s_id2_brnch_sel_D);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:70:9
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_halt_s_id2_memop_D = i_hw2_halt_ACT ? 4'h0 : 4'h0;
    assign s_id2_memop_D = (((((((((i_hw2_halt_s_id2_memop_D | i_hw2_itype_alu_s_id2_memop_D) | i_hw2_rtype_alu_s_id2_memop_D) | i_hw2_utype_ops_s_id2_memop_D) | i_hw2_itype_jlreg_s_id2_memop_D_ACT) | i_hw2_itype_loads_s_id2_memop_D_ACT) | i_hw2_jtype_jlink_s_id2_memop_D_ACT) | i_hw2_stype_store_s_id2_memop_D_ACT) | i_hw2_itype_special_s_id2_memop_D) | i_hw2_btype_branches_s_id2_memop_D);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:71:9
    // s_id2_regwrite.write((uint1)(0x0));
    assign i_hw2_halt_s_id2_regwrite_D = i_hw2_halt_ACT ? 1'b0 : 1'b0;
    assign s_id2_regwrite_D = (((((((((i_hw2_halt_s_id2_regwrite_D | i_hw2_itype_alu_s_id2_regwrite_D) | i_hw2_rtype_alu_s_id2_regwrite_D) | i_hw2_utype_ops_s_id2_regwrite_D) | i_hw2_itype_jlreg_s_id2_regwrite_D_ACT) | i_hw2_itype_loads_s_id2_regwrite_D) | i_hw2_jtype_jlink_s_id2_regwrite_D_ACT) | i_hw2_stype_store_s_id2_regwrite_D) | i_hw2_itype_special_s_id2_regwrite_D) | i_hw2_btype_branches_s_id2_regwrite_D);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:72:9
    // s_id2_rfwt_sel.write((int32)(0x0));
    assign i_hw2_halt_s_id2_rfwt_sel_D = i_hw2_halt_ACT ? 2'h0 : 2'h0;
    assign s_id2_rfwt_sel_D = (((((((((i_hw2_halt_s_id2_rfwt_sel_D | i_hw2_itype_alu_s_id2_rfwt_sel_D) | i_hw2_rtype_alu_s_id2_rfwt_sel_D) | i_hw2_utype_ops_s_id2_rfwt_sel_D) | i_hw2_itype_jlreg_s_id2_rfwt_sel_D_ACT) | i_hw2_itype_loads_s_id2_rfwt_sel_D) | i_hw2_jtype_jlink_s_id2_rfwt_sel_D_ACT) | i_hw2_stype_store_s_id2_rfwt_sel_D) | i_hw2_itype_special_s_id2_rfwt_sel_D) | i_hw2_btype_branches_s_id2_rfwt_sel_D);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:158:9
    // s_id2_alusrc1.write((uint1)(0x1));
    assign i_hw2_itype_alu_s_id2_alusrc1_D = i_hw2_itype_alu_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:159:9
    // s_id2_alusrc2.write((uint1)(0x0));
    assign i_hw2_itype_alu_s_id2_alusrc2_D = i_hw2_itype_alu_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:160:9
    // s_id2_immsel.write((uint1)(0x1));
    assign i_hw2_itype_alu_s_id2_immsel_D = i_hw2_itype_alu_ACT ? 3'h1 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:161:9
    // s_id2_regwrite.write((uint1)(0x1));
    assign i_hw2_itype_alu_s_id2_regwrite_D = i_hw2_itype_alu_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:162:9
    // s_id2_rfwt_sel.write((uint1)(0x0));
    assign i_hw2_itype_alu_s_id2_rfwt_sel_D = i_hw2_itype_alu_ACT ? 2'h0 : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:163:9
    // s_id2_branchop.write((uint1)(0x0));
    assign i_hw2_itype_alu_s_id2_branchop_D = i_hw2_itype_alu_ACT ? 3'h0 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:164:9
    // s_id2_brnch_sel.write((int32)(0x0));
    assign i_hw2_itype_alu_s_id2_brnch_sel_D = i_hw2_itype_alu_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:165:9
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_itype_alu_s_id2_memop_D = i_hw2_itype_alu_ACT ? 4'h0 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:166:17
    // codasip_tmp_var_0.write(codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder2 ...
    assign codasip_tmp_var_0_i_hw2_itype_alu_decoder2_decoder2_id2_stage_id2_stage = codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:189:17
    assign i_hw2_itype_alu_s_id2_aluop_D =
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:169:17
        // s_id2_aluop.write((uint1)(0x1));
        (codasip_tmp_var_0_i_hw2_itype_alu_decoder2_decoder2_id2_stage_id2_stage == 10'h013) ? 4'h1 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:173:17
        // s_id2_aluop.write((uint2)(0x3));
        (codasip_tmp_var_0_i_hw2_itype_alu_decoder2_decoder2_id2_stage_id2_stage == 10'h393) ? 4'h3 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:177:17
        // s_id2_aluop.write((uint3)(0x4));
        (codasip_tmp_var_0_i_hw2_itype_alu_decoder2_decoder2_id2_stage_id2_stage == 10'h313) ? 4'h4 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:181:17
        // s_id2_aluop.write((uint3)(0x5));
        (codasip_tmp_var_0_i_hw2_itype_alu_decoder2_decoder2_id2_stage_id2_stage == 10'h213) ? 4'h5 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:185:17
        // s_id2_aluop.write((uint4)(0x9));
        (codasip_tmp_var_0_i_hw2_itype_alu_decoder2_decoder2_id2_stage_id2_stage == 10'h113) ? 4'h9 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:189:17
        // s_id2_aluop.write((uint4)(0xa));
        (codasip_tmp_var_0_i_hw2_itype_alu_decoder2_decoder2_id2_stage_id2_stage == 10'h193) ? 4'ha : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:189:17
    // s_id2_aluop.write((uint4)(0xa));
    assign i_hw2_itype_alu_s_id2_aluop_D_ACT = i_hw2_itype_alu_ACT ? i_hw2_itype_alu_s_id2_aluop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:90:9
    // s_id2_alusrc1.write((uint1)(0x1));
    assign i_hw2_rtype_alu_s_id2_alusrc1_D = i_hw2_rtype_alu_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:91:9
    // s_id2_alusrc2.write((uint1)(0x1));
    assign i_hw2_rtype_alu_s_id2_alusrc2_D = i_hw2_rtype_alu_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:92:9
    // s_id2_immsel.write((uint1)(0x0));
    assign i_hw2_rtype_alu_s_id2_immsel_D = i_hw2_rtype_alu_ACT ? 3'h0 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:93:9
    // s_id2_regwrite.write((uint1)(0x1));
    assign i_hw2_rtype_alu_s_id2_regwrite_D = i_hw2_rtype_alu_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:94:9
    // s_id2_rfwt_sel.write((uint1)(0x0));
    assign i_hw2_rtype_alu_s_id2_rfwt_sel_D = i_hw2_rtype_alu_ACT ? 2'h0 : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:95:9
    // s_id2_branchop.write((uint1)(0x0));
    assign i_hw2_rtype_alu_s_id2_branchop_D = i_hw2_rtype_alu_ACT ? 3'h0 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:96:9
    // s_id2_brnch_sel.write((int32)(0x0));
    assign i_hw2_rtype_alu_s_id2_brnch_sel_D = i_hw2_rtype_alu_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:97:9
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_rtype_alu_s_id2_memop_D = i_hw2_rtype_alu_ACT ? 4'h0 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:100:17
    // codasip_tmp_var_0.write(codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder2 ...
    assign codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage = codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:139:17
    assign i_hw2_rtype_alu_s_id2_aluop_D =
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:103:17
        // s_id2_aluop.write((uint1)(0x1));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h00033) ? 4'h1 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:107:17
        // s_id2_aluop.write((uint2)(0x2));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h08033) ? 4'h2 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:111:17
        // s_id2_aluop.write((uint2)(0x3));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h003b3) ? 4'h3 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:115:17
        // s_id2_aluop.write((uint3)(0x4));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h00333) ? 4'h4 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:119:17
        // s_id2_aluop.write((uint3)(0x5));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h00233) ? 4'h5 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:123:17
        // s_id2_aluop.write((uint3)(0x6));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h000b3) ? 4'h6 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:127:17
        // s_id2_aluop.write((uint3)(0x7));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h002b3) ? 4'h7 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:131:17
        // s_id2_aluop.write((uint4)(0x8));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h082b3) ? 4'h8 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:135:17
        // s_id2_aluop.write((uint4)(0x9));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h00133) ? 4'h9 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:139:17
        // s_id2_aluop.write((uint4)(0xa));
        (codasip_tmp_var_0_i_hw2_rtype_alu_decoder2_decoder2_id2_stage_id2_stage == 17'h001b3) ? 4'ha : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:127:17
    // s_id2_aluop.write((uint3)(0x7));
    assign i_hw2_rtype_alu_s_id2_aluop_D_ACT = i_hw2_rtype_alu_ACT ? i_hw2_rtype_alu_s_id2_aluop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:300:9
    // s_id2_aluop.write((uint1)(0x1));
    assign i_hw2_utype_ops_s_id2_aluop_D = i_hw2_utype_ops_ACT ? 4'h1 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:301:9
    // s_id2_alusrc2.write((uint1)(0x0));
    assign i_hw2_utype_ops_s_id2_alusrc2_D = i_hw2_utype_ops_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:302:9
    // s_id2_immsel.write((uint2)(0x3));
    assign i_hw2_utype_ops_s_id2_immsel_D = i_hw2_utype_ops_ACT ? 3'h3 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:303:9
    // s_id2_regwrite.write((uint1)(0x1));
    assign i_hw2_utype_ops_s_id2_regwrite_D = i_hw2_utype_ops_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:304:9
    // s_id2_rfwt_sel.write((uint1)(0x0));
    assign i_hw2_utype_ops_s_id2_rfwt_sel_D = i_hw2_utype_ops_ACT ? 2'h0 : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:305:9
    // s_id2_branchop.write((uint1)(0x0));
    assign i_hw2_utype_ops_s_id2_branchop_D = i_hw2_utype_ops_ACT ? 3'h0 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:306:9
    // s_id2_brnch_sel.write((int32)(0x0));
    assign i_hw2_utype_ops_s_id2_brnch_sel_D = i_hw2_utype_ops_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:307:9
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_utype_ops_s_id2_memop_D = i_hw2_utype_ops_ACT ? 4'h0 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:310:17
    // codasip_tmp_var_0.write(codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder2 ...
    assign codasip_tmp_var_0_i_hw2_utype_ops_decoder2_decoder2_id2_stage_id2_stage = codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ops3opc;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:317:17
    always @(*) begin
        case ( codasip_tmp_var_0_i_hw2_utype_ops_decoder2_decoder2_id2_stage_id2_stage )
            // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:317:17
            // s_id2_alusrc1.write((uint2)(0x2));
            7'h17: tmp_codasip_conv_mux_i_hw2_utype_ops_s_id2_alusrc1_D_1 = 1'b0;
            // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:313:17
            // s_id2_alusrc1.write((uint1)(0x0));
            7'h37: tmp_codasip_conv_mux_i_hw2_utype_ops_s_id2_alusrc1_D_1 = 1'b0;
            // This multiplexor is complete (forced full), but not all 2-state values are used.
            // Disable code coverage for illegal branches, but leave the information for synthesis.
            // pragma coverage off
            // VCS coverage off
            default: tmp_codasip_conv_mux_i_hw2_utype_ops_s_id2_alusrc1_D_1 = 1'bx;
            // pragma coverage on
            // VCS coverage on
        endcase
    end
    assign i_hw2_utype_ops_s_id2_alusrc1_D = tmp_codasip_conv_mux_i_hw2_utype_ops_s_id2_alusrc1_D_1;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:317:17
    // s_id2_alusrc1.write((uint2)(0x2));
    assign i_hw2_utype_ops_s_id2_alusrc1_D_ACT = i_hw2_utype_ops_ACT ? i_hw2_utype_ops_s_id2_alusrc1_D : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:248:17
    // codasip_tmp_var_0.write((bool)(codasip_return_MI15opc_itype_jlregIH11_9id2_stage9id2_stage10_ ...
    assign codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage = (codasip_return_MI15opc_itype_jlregIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_jlreg3opc == 10'h067);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:250:13
    // s_id2_aluop.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_aluop_D = codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage ? 4'h1 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:250:13
    // s_id2_aluop.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_aluop_D_ACT = i_hw2_itype_jlreg_ACT ? i_hw2_itype_jlreg_s_id2_aluop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:251:13
    // s_id2_alusrc1.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_alusrc1_D = codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:251:13
    // s_id2_alusrc1.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_alusrc1_D_ACT = i_hw2_itype_jlreg_ACT ? i_hw2_itype_jlreg_s_id2_alusrc1_D : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:252:13
    // s_id2_alusrc2.write((uint1)(0x0));
    assign i_hw2_itype_jlreg_s_id2_alusrc2_D = codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:252:13
    // s_id2_alusrc2.write((uint1)(0x0));
    assign i_hw2_itype_jlreg_s_id2_alusrc2_D_ACT = i_hw2_itype_jlreg_ACT ? i_hw2_itype_jlreg_s_id2_alusrc2_D : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:253:13
    // s_id2_immsel.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_immsel_D = codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage ? 3'h1 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:253:13
    // s_id2_immsel.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_immsel_D_ACT = i_hw2_itype_jlreg_ACT ? i_hw2_itype_jlreg_s_id2_immsel_D : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:254:13
    // s_id2_regwrite.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_regwrite_D = codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:254:13
    // s_id2_regwrite.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_regwrite_D_ACT = i_hw2_itype_jlreg_ACT ? i_hw2_itype_jlreg_s_id2_regwrite_D : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:255:13
    // s_id2_rfwt_sel.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_rfwt_sel_D = codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage ? 2'h1 : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:255:13
    // s_id2_rfwt_sel.write((uint1)(0x1));
    assign i_hw2_itype_jlreg_s_id2_rfwt_sel_D_ACT = i_hw2_itype_jlreg_ACT ? i_hw2_itype_jlreg_s_id2_rfwt_sel_D : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:256:13
    // s_id2_branchop.write((uint3)(0x5));
    assign i_hw2_itype_jlreg_s_id2_branchop_D = codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage ? 3'h5 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:256:13
    // s_id2_branchop.write((uint3)(0x5));
    assign i_hw2_itype_jlreg_s_id2_branchop_D_ACT = i_hw2_itype_jlreg_ACT ? i_hw2_itype_jlreg_s_id2_branchop_D : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:257:13
    // s_id2_brnch_sel.write((uint1)(0x0));
    assign i_hw2_itype_jlreg_s_id2_brnch_sel_D = codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:257:13
    // s_id2_brnch_sel.write((uint1)(0x0));
    assign i_hw2_itype_jlreg_s_id2_brnch_sel_D_ACT = i_hw2_itype_jlreg_ACT ? i_hw2_itype_jlreg_s_id2_brnch_sel_D : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:258:13
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_itype_jlreg_s_id2_memop_D = codasip_tmp_var_0_i_hw2_itype_jlreg_decoder2_decoder2_id2_stage_id2_stage ? 4'h0 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:258:13
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_itype_jlreg_s_id2_memop_D_ACT = i_hw2_itype_jlreg_ACT ? i_hw2_itype_jlreg_s_id2_memop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:393:9
    // s_id2_aluop.write((uint1)(0x1));
    assign i_hw2_itype_loads_s_id2_aluop_D = i_hw2_itype_loads_ACT ? 4'h1 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:394:9
    // s_id2_alusrc1.write((uint1)(0x1));
    assign i_hw2_itype_loads_s_id2_alusrc1_D = i_hw2_itype_loads_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:395:9
    // s_id2_alusrc2.write((uint1)(0x0));
    assign i_hw2_itype_loads_s_id2_alusrc2_D = i_hw2_itype_loads_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:396:9
    // s_id2_immsel.write((uint1)(0x1));
    assign i_hw2_itype_loads_s_id2_immsel_D = i_hw2_itype_loads_ACT ? 3'h1 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:397:9
    // s_id2_regwrite.write((uint1)(0x1));
    assign i_hw2_itype_loads_s_id2_regwrite_D = i_hw2_itype_loads_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:398:9
    // s_id2_rfwt_sel.write((uint2)(0x2));
    assign i_hw2_itype_loads_s_id2_rfwt_sel_D = i_hw2_itype_loads_ACT ? 2'h2 : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:399:9
    // s_id2_branchop.write((uint1)(0x0));
    assign i_hw2_itype_loads_s_id2_branchop_D = i_hw2_itype_loads_ACT ? 3'h0 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:400:9
    // s_id2_brnch_sel.write((int32)(0x0));
    assign i_hw2_itype_loads_s_id2_brnch_sel_D = i_hw2_itype_loads_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:403:17
    // codasip_tmp_var_0.write(codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decode ...
    assign codasip_tmp_var_0_i_hw2_itype_loads_decoder2_decoder2_id2_stage_id2_stage = codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:422:17
    assign i_hw2_itype_loads_s_id2_memop_D =
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:406:17
        // s_id2_memop.write((uint4)(0x9));
        (codasip_tmp_var_0_i_hw2_itype_loads_decoder2_decoder2_id2_stage_id2_stage == 10'h003) ? 4'h9 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:410:17
        // s_id2_memop.write((uint4)(0xa));
        (codasip_tmp_var_0_i_hw2_itype_loads_decoder2_decoder2_id2_stage_id2_stage == 10'h203) ? 4'ha :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:414:17
        // s_id2_memop.write((uint4)(0xb));
        (codasip_tmp_var_0_i_hw2_itype_loads_decoder2_decoder2_id2_stage_id2_stage == 10'h083) ? 4'hb :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:418:17
        // s_id2_memop.write((uint4)(0xc));
        (codasip_tmp_var_0_i_hw2_itype_loads_decoder2_decoder2_id2_stage_id2_stage == 10'h283) ? 4'hc :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:422:17
        // s_id2_memop.write((uint4)(0xd));
        (codasip_tmp_var_0_i_hw2_itype_loads_decoder2_decoder2_id2_stage_id2_stage == 10'h103) ? 4'hd : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:422:17
    // s_id2_memop.write((uint4)(0xd));
    assign i_hw2_itype_loads_s_id2_memop_D_ACT = i_hw2_itype_loads_ACT ? i_hw2_itype_loads_s_id2_memop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:274:17
    // codasip_tmp_var_0.write((bool)(codasip_return_MI15opc_jtype_jlinkIH11_9id2_stage9id2_stage10_ ...
    assign codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage = (codasip_return_MI15opc_jtype_jlinkIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_jtype_jlink3opc == 7'h6f);
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:276:13
    // s_id2_aluop.write((int32)(0x0));
    assign i_hw2_jtype_jlink_s_id2_aluop_D = codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage ? 4'h0 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:276:13
    // s_id2_aluop.write((int32)(0x0));
    assign i_hw2_jtype_jlink_s_id2_aluop_D_ACT = i_hw2_jtype_jlink_ACT ? i_hw2_jtype_jlink_s_id2_aluop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:277:13
    // s_id2_alusrc1.write((int32)(0x0));
    assign i_hw2_jtype_jlink_s_id2_alusrc1_D = codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:277:13
    // s_id2_alusrc1.write((int32)(0x0));
    assign i_hw2_jtype_jlink_s_id2_alusrc1_D_ACT = i_hw2_jtype_jlink_ACT ? i_hw2_jtype_jlink_s_id2_alusrc1_D : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:278:13
    // s_id2_alusrc2.write((int32)(0x0));
    assign i_hw2_jtype_jlink_s_id2_alusrc2_D = codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:278:13
    // s_id2_alusrc2.write((int32)(0x0));
    assign i_hw2_jtype_jlink_s_id2_alusrc2_D_ACT = i_hw2_jtype_jlink_ACT ? i_hw2_jtype_jlink_s_id2_alusrc2_D : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:279:13
    // s_id2_immsel.write((uint3)(0x5));
    assign i_hw2_jtype_jlink_s_id2_immsel_D = codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage ? 3'h5 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:279:13
    // s_id2_immsel.write((uint3)(0x5));
    assign i_hw2_jtype_jlink_s_id2_immsel_D_ACT = i_hw2_jtype_jlink_ACT ? i_hw2_jtype_jlink_s_id2_immsel_D : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:280:13
    // s_id2_regwrite.write((uint1)(0x1));
    assign i_hw2_jtype_jlink_s_id2_regwrite_D = codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:280:13
    // s_id2_regwrite.write((uint1)(0x1));
    assign i_hw2_jtype_jlink_s_id2_regwrite_D_ACT = i_hw2_jtype_jlink_ACT ? i_hw2_jtype_jlink_s_id2_regwrite_D : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:281:13
    // s_id2_rfwt_sel.write((uint1)(0x1));
    assign i_hw2_jtype_jlink_s_id2_rfwt_sel_D = codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage ? 2'h1 : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:281:13
    // s_id2_rfwt_sel.write((uint1)(0x1));
    assign i_hw2_jtype_jlink_s_id2_rfwt_sel_D_ACT = i_hw2_jtype_jlink_ACT ? i_hw2_jtype_jlink_s_id2_rfwt_sel_D : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:282:13
    // s_id2_branchop.write((uint3)(0x4));
    assign i_hw2_jtype_jlink_s_id2_branchop_D = codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage ? 3'h4 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:282:13
    // s_id2_branchop.write((uint3)(0x4));
    assign i_hw2_jtype_jlink_s_id2_branchop_D_ACT = i_hw2_jtype_jlink_ACT ? i_hw2_jtype_jlink_s_id2_branchop_D : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:283:13
    // s_id2_brnch_sel.write((int32)(0x0));
    assign i_hw2_jtype_jlink_s_id2_brnch_sel_D = codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:283:13
    // s_id2_brnch_sel.write((int32)(0x0));
    assign i_hw2_jtype_jlink_s_id2_brnch_sel_D_ACT = i_hw2_jtype_jlink_ACT ? i_hw2_jtype_jlink_s_id2_brnch_sel_D : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:284:13
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_jtype_jlink_s_id2_memop_D = codasip_tmp_var_0_i_hw2_jtype_jlink_decoder2_decoder2_id2_stage_id2_stage ? 4'h0 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:284:13
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_jtype_jlink_s_id2_memop_D_ACT = i_hw2_jtype_jlink_ACT ? i_hw2_jtype_jlink_s_id2_memop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:442:9
    // s_id2_aluop.write((uint1)(0x1));
    assign i_hw2_stype_store_s_id2_aluop_D = i_hw2_stype_store_ACT ? 4'h1 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:443:9
    // s_id2_alusrc1.write((uint1)(0x1));
    assign i_hw2_stype_store_s_id2_alusrc1_D = i_hw2_stype_store_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:444:9
    // s_id2_alusrc2.write((uint1)(0x0));
    assign i_hw2_stype_store_s_id2_alusrc2_D = i_hw2_stype_store_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:445:9
    // s_id2_immsel.write((uint3)(0x4));
    assign i_hw2_stype_store_s_id2_immsel_D = i_hw2_stype_store_ACT ? 3'h4 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:446:9
    // s_id2_regwrite.write((uint1)(0x0));
    assign i_hw2_stype_store_s_id2_regwrite_D = i_hw2_stype_store_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:447:9
    // s_id2_rfwt_sel.write((int32)(0x0));
    assign i_hw2_stype_store_s_id2_rfwt_sel_D = i_hw2_stype_store_ACT ? 2'h0 : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:448:9
    // s_id2_branchop.write((uint1)(0x0));
    assign i_hw2_stype_store_s_id2_branchop_D = i_hw2_stype_store_ACT ? 3'h0 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:449:9
    // s_id2_brnch_sel.write((int32)(0x0));
    assign i_hw2_stype_store_s_id2_brnch_sel_D = i_hw2_stype_store_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:452:17
    // codasip_tmp_var_0.write(codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decode ...
    assign codasip_tmp_var_0_i_hw2_stype_store_decoder2_decoder2_id2_stage_id2_stage = codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:463:17
    assign i_hw2_stype_store_s_id2_memop_D =
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:455:17
        // s_id2_memop.write((uint1)(0x1));
        (codasip_tmp_var_0_i_hw2_stype_store_decoder2_decoder2_id2_stage_id2_stage == 10'h023) ? 4'h1 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:459:17
        // s_id2_memop.write((uint2)(0x2));
        (codasip_tmp_var_0_i_hw2_stype_store_decoder2_decoder2_id2_stage_id2_stage == 10'h0a3) ? 4'h2 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:463:17
        // s_id2_memop.write((uint2)(0x3));
        (codasip_tmp_var_0_i_hw2_stype_store_decoder2_decoder2_id2_stage_id2_stage == 10'h123) ? 4'h3 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:463:17
    // s_id2_memop.write((uint2)(0x3));
    assign i_hw2_stype_store_s_id2_memop_D_ACT = i_hw2_stype_store_ACT ? i_hw2_stype_store_s_id2_memop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:208:9
    // s_id2_alusrc1.write((uint1)(0x1));
    assign i_hw2_itype_special_s_id2_alusrc1_D = i_hw2_itype_special_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:209:9
    // s_id2_alusrc2.write((uint1)(0x0));
    assign i_hw2_itype_special_s_id2_alusrc2_D = i_hw2_itype_special_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:210:9
    // s_id2_immsel.write((uint1)(0x1));
    assign i_hw2_itype_special_s_id2_immsel_D = i_hw2_itype_special_ACT ? 3'h1 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:211:9
    // s_id2_regwrite.write((uint1)(0x1));
    assign i_hw2_itype_special_s_id2_regwrite_D = i_hw2_itype_special_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:212:9
    // s_id2_rfwt_sel.write((uint1)(0x0));
    assign i_hw2_itype_special_s_id2_rfwt_sel_D = i_hw2_itype_special_ACT ? 2'h0 : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:213:9
    // s_id2_branchop.write((uint1)(0x0));
    assign i_hw2_itype_special_s_id2_branchop_D = i_hw2_itype_special_ACT ? 3'h0 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:214:9
    // s_id2_brnch_sel.write((int32)(0x0));
    assign i_hw2_itype_special_s_id2_brnch_sel_D = i_hw2_itype_special_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:215:9
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_itype_special_s_id2_memop_D = i_hw2_itype_special_ACT ? 4'h0 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:218:17
    // codasip_tmp_var_0.write(codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8deco ...
    assign codasip_tmp_var_0_i_hw2_itype_special_decoder2_decoder2_id2_stage_id2_stage = codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:229:17
    assign i_hw2_itype_special_s_id2_aluop_D =
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:221:17
        // s_id2_aluop.write((uint3)(0x6));
        (codasip_tmp_var_0_i_hw2_itype_special_decoder2_decoder2_id2_stage_id2_stage == 17'h00093) ? 4'h6 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:225:17
        // s_id2_aluop.write((uint3)(0x7));
        (codasip_tmp_var_0_i_hw2_itype_special_decoder2_decoder2_id2_stage_id2_stage == 17'h00293) ? 4'h7 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:229:17
        // s_id2_aluop.write((uint4)(0x8));
        (codasip_tmp_var_0_i_hw2_itype_special_decoder2_decoder2_id2_stage_id2_stage == 17'h08293) ? 4'h8 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:229:17
    // s_id2_aluop.write((uint4)(0x8));
    assign i_hw2_itype_special_s_id2_aluop_D_ACT = i_hw2_itype_special_ACT ? i_hw2_itype_special_s_id2_aluop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:336:9
    // s_id2_alusrc1.write((uint1)(0x1));
    assign i_hw2_btype_branches_s_id2_alusrc1_D = i_hw2_btype_branches_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:337:9
    // s_id2_alusrc2.write((uint1)(0x1));
    assign i_hw2_btype_branches_s_id2_alusrc2_D = i_hw2_btype_branches_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:338:9
    // s_id2_immsel.write((uint2)(0x2));
    assign i_hw2_btype_branches_s_id2_immsel_D = i_hw2_btype_branches_ACT ? 3'h2 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:339:9
    // s_id2_regwrite.write((uint1)(0x0));
    assign i_hw2_btype_branches_s_id2_regwrite_D = i_hw2_btype_branches_ACT ? 1'b0 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:340:9
    // s_id2_rfwt_sel.write((int32)(0x0));
    assign i_hw2_btype_branches_s_id2_rfwt_sel_D = i_hw2_btype_branches_ACT ? 2'h0 : 2'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:341:9
    // s_id2_brnch_sel.write((uint1)(0x1));
    assign i_hw2_btype_branches_s_id2_brnch_sel_D = i_hw2_btype_branches_ACT ? 1'b1 : 1'b0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:342:9
    // s_id2_memop.write((uint1)(0x0));
    assign i_hw2_btype_branches_s_id2_memop_D = i_hw2_btype_branches_ACT ? 4'h0 : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:345:17
    // codasip_tmp_var_0.write(codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8dec ...
    assign codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage = codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:368:17
    assign i_hw2_btype_branches_s_id2_aluop_D =
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:348:17
        // s_id2_aluop.write((uint2)(0x2));
        ((codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h063) || (codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h0e3)) ? 4'h2 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:358:17
        // s_id2_aluop.write((uint4)(0x9));
        ((codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h263) || (codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h2e3)) ? 4'h9 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:368:17
        // s_id2_aluop.write((uint4)(0xa));
        ((codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h363) || (codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h3e3)) ? 4'ha : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:373:17
    // s_id2_aluop.write((uint4)(0xa));
    assign i_hw2_btype_branches_s_id2_aluop_D_ACT = i_hw2_btype_branches_ACT ? i_hw2_btype_branches_s_id2_aluop_D : 4'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:374:17
    assign i_hw2_btype_branches_s_id2_branchop_D =
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:349:17
        // s_id2_branchop.write((uint3)(0x7));
        (codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h063) ? 3'h7 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:354:17
        // s_id2_branchop.write((uint3)(0x6));
        (codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h0e3) ? 3'h6 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:359:17
        // s_id2_branchop.write((uint2)(0x2));
        (codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h263) ? 3'h2 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:364:17
        // s_id2_branchop.write((uint2)(0x3));
        (codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h2e3) ? 3'h3 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:369:17
        // s_id2_branchop.write((uint2)(0x2));
        (codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h363) ? 3'h2 :
        // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:374:17
        // s_id2_branchop.write((uint2)(0x3));
        (codasip_tmp_var_0_i_hw2_btype_branches_decoder2_decoder2_id2_stage_id2_stage == 10'h3e3) ? 3'h3 : 3'h0;
    // /home/project/superscalar/model/ca/decoders/ca_decoder2.codal:374:17
    // s_id2_branchop.write((uint2)(0x3));
    assign i_hw2_btype_branches_s_id2_branchop_D_ACT = i_hw2_btype_branches_ACT ? i_hw2_btype_branches_s_id2_branchop_D : 3'h0;
    // /home/project/superscalar/model/share/isa/isa.codal:329:62
    // codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_ityp ...
    assign opc_lb_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D = opc_lb_opc_decoder2_ACT ? 10'h003 : 10'h000;
    assign codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc = ((((opc_lb_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D | opc_lh_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D) | opc_lw_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D) | opc_lbu_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D) | opc_lhu_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D);
    // /home/project/superscalar/model/share/isa/isa.codal:330:62
    // codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_ityp ...
    assign opc_lh_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D = opc_lh_opc_decoder2_ACT ? 10'h083 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:331:62
    // codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_ityp ...
    assign opc_lw_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D = opc_lw_opc_decoder2_ACT ? 10'h103 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:142:62
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_or_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_or_opc_decoder2_ACT ? 17'h00333 : 17'h00000;
    assign codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc = (((((((((opc_or_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D | opc_add_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D) | opc_and_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D) | opc_sll_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D) | opc_slt_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D) | opc_sra_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D) | opc_srl_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D) | opc_sub_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D) | opc_xor_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D) | opc_sltu_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D);
    // /home/project/superscalar/model/share/isa/isa.codal:361:62
    // codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_styp ...
    assign opc_sb_opc_decoder2_codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc_D = opc_sb_opc_decoder2_ACT ? 10'h023 : 10'h000;
    assign codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc = ((opc_sb_opc_decoder2_codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc_D | opc_sh_opc_decoder2_codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc_D) | opc_sw_opc_decoder2_codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc_D);
    // /home/project/superscalar/model/share/isa/isa.codal:362:62
    // codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_styp ...
    assign opc_sh_opc_decoder2_codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc_D = opc_sh_opc_decoder2_ACT ? 10'h0a3 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:363:62
    // codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_styp ...
    assign opc_sw_opc_decoder2_codasip_return_MI15opc_stype_storeIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_stype_store3opc_D = opc_sw_opc_decoder2_ACT ? 10'h123 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:134:65
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_add_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_add_opc_decoder2_ACT ? 17'h00033 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:143:65
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_and_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_and_opc_decoder2_ACT ? 17'h003b3 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:497:65
    // codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_b ...
    assign opc_beq_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D = opc_beq_opc_decoder2_ACT ? 10'h063 : 10'h000;
    assign codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc = (((((opc_beq_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D | opc_bge_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D) | opc_blt_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D) | opc_bne_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D) | opc_bgeu_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D) | opc_bltu_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D);
    // /home/project/superscalar/model/share/isa/isa.codal:500:65
    // codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_b ...
    assign opc_bge_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D = opc_bge_opc_decoder2_ACT ? 10'h2e3 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:499:65
    // codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_b ...
    assign opc_blt_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D = opc_blt_opc_decoder2_ACT ? 10'h263 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:498:65
    // codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_b ...
    assign opc_bne_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D = opc_bne_opc_decoder2_ACT ? 10'h0e3 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:440:65
    // codasip_return_MI15opc_jtype_jlinkIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_jtyp ...
    assign opc_jal_opc_decoder2_codasip_return_MI15opc_jtype_jlinkIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_jtype_jlink3opc_D = opc_jal_opc_decoder2_ACT ? 7'h6f : 7'h00;
    assign codasip_return_MI15opc_jtype_jlinkIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_jtype_jlink3opc = opc_jal_opc_decoder2_codasip_return_MI15opc_jtype_jlinkIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_jtype_jlink3opc_D;
    // /home/project/superscalar/model/share/isa/isa.codal:332:65
    // codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_ityp ...
    assign opc_lbu_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D = opc_lbu_opc_decoder2_ACT ? 10'h203 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:333:65
    // codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_ityp ...
    assign opc_lhu_opc_decoder2_codasip_return_MI15opc_itype_loadsIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_loads3opc_D = opc_lhu_opc_decoder2_ACT ? 10'h283 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:403:65
    // codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ ...
    assign opc_lui_opc_decoder2_codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ops3opc_D = opc_lui_opc_decoder2_ACT ? 7'h37 : 7'h00;
    assign codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ops3opc = (opc_lui_opc_decoder2_codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ops3opc_D | opc_auipc_opc_decoder2_codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ops3opc_D);
    // /home/project/superscalar/model/share/isa/isa.codal:274:65
    // codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_ ...
    assign opc_ori_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D = opc_ori_opc_decoder2_ACT ? 10'h313 : 10'h000;
    assign codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc = (((((opc_ori_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D | opc_addi_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D) | opc_andi_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D) | opc_slti_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D) | opc_xori_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D) | opc_sltiu_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D);
    // /home/project/superscalar/model/share/isa/isa.codal:136:65
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_sll_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_sll_opc_decoder2_ACT ? 17'h000b3 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:137:65
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_slt_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_slt_opc_decoder2_ACT ? 17'h00133 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:141:65
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_sra_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_sra_opc_decoder2_ACT ? 17'h082b3 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:140:65
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_srl_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_srl_opc_decoder2_ACT ? 17'h002b3 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:135:65
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_sub_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_sub_opc_decoder2_ACT ? 17'h08033 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:139:65
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_xor_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_xor_opc_decoder2_ACT ? 17'h00233 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:270:68
    // codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_ ...
    assign opc_addi_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D = opc_addi_opc_decoder2_ACT ? 10'h013 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:275:68
    // codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_ ...
    assign opc_andi_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D = opc_andi_opc_decoder2_ACT ? 10'h393 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:502:68
    // codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_b ...
    assign opc_bgeu_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D = opc_bgeu_opc_decoder2_ACT ? 10'h3e3 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:501:68
    // codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_b ...
    assign opc_bltu_opc_decoder2_codasip_return_MI18opc_btype_branchesIH11_9id2_stage9id2_stage10_8decoder28decoder221_18opc_btype_branches3opc_D = opc_bltu_opc_decoder2_ACT ? 10'h363 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:468:68
    // codasip_return_MI15opc_itype_jlregIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_ityp ...
    assign opc_jalr_opc_decoder2_codasip_return_MI15opc_itype_jlregIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_jlreg3opc_D = opc_jalr_opc_decoder2_ACT ? 10'h067 : 10'h000;
    assign codasip_return_MI15opc_itype_jlregIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_jlreg3opc = opc_jalr_opc_decoder2_codasip_return_MI15opc_itype_jlregIH11_9id2_stage9id2_stage10_8decoder28decoder218_15opc_itype_jlreg3opc_D;
    // /home/project/superscalar/model/share/isa/isa.codal:227:72
    // codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_it ...
    assign opc_slli_opc_decoder2_codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc_D = opc_slli_opc_decoder2_ACT ? 17'h00093 : 17'h00000;
    assign codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc = ((opc_slli_opc_decoder2_codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc_D | opc_srai_opc_decoder2_codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc_D) | opc_srli_opc_decoder2_codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc_D);
    // /home/project/superscalar/model/share/isa/isa.codal:271:68
    // codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_ ...
    assign opc_slti_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D = opc_slti_opc_decoder2_ACT ? 10'h113 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:138:68
    // codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_ ...
    assign opc_sltu_opc_decoder2_codasip_return_MI13opc_rtype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_rtype_alu3opc_D = opc_sltu_opc_decoder2_ACT ? 17'h001b3 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:229:72
    // codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_it ...
    assign opc_srai_opc_decoder2_codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc_D = opc_srai_opc_decoder2_ACT ? 17'h08293 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:228:72
    // codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_it ...
    assign opc_srli_opc_decoder2_codasip_return_MI17opc_itype_specialIH11_9id2_stage9id2_stage10_8decoder28decoder220_17opc_itype_special3opc_D = opc_srli_opc_decoder2_ACT ? 17'h00293 : 17'h00000;
    // /home/project/superscalar/model/share/isa/isa.codal:273:68
    // codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_ ...
    assign opc_xori_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D = opc_xori_opc_decoder2_ACT ? 10'h213 : 10'h000;
    // /home/project/superscalar/model/share/isa/isa.codal:404:71
    // codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ ...
    assign opc_auipc_opc_decoder2_codasip_return_MI13opc_utype_opsIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_utype_ops3opc_D = opc_auipc_opc_decoder2_ACT ? 7'h17 : 7'h00;
    // /home/project/superscalar/model/share/isa/isa.codal:272:71
    // codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_ ...
    assign opc_sltiu_opc_decoder2_codasip_return_MI13opc_itype_aluIH11_9id2_stage9id2_stage10_8decoder28decoder216_13opc_itype_alu3opc_D = opc_sltiu_opc_decoder2_ACT ? 10'h193 : 10'h000;
endmodule // decoder2_t
