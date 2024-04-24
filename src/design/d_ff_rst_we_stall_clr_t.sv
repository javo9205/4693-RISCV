/**
 *  Codasip s.r.o.
 * 
 *  CONFIDENTIAL
 * 
 *  Copyright 2024 Codasip s.r.o.  * 
 *  All Rights Reserved.
 *  This file is part of the Codasip Studio product. No part of the Studio product, including this
 *  file, may be use, copied, modified, or distributed except in accordance with the terms contained
 *  in Codasip license agreement under which you obtained this file.
 * 
 *  \file
 *  \date    2024-04-21
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains definition of generic pipeline register with synchronous write, configurable reset and with write enable signal.
 */

`include "Control_Signals.svh"

module d_ff_rst_we_stall_clr_t #(
    parameter integer BIT_WIDTH = 32'sd8,
    parameter [BIT_WIDTH-1:0] DEFAULT_VALUE = {BIT_WIDTH{1'b0}},
    parameter [0:0] RESET_LEVEL = 1'b0,
    parameter [0:0] RESET_SYNC = 1'b0,
    parameter control_signal_t CS = REGISTER
) (
    input  wire CLK,
    input  wire RST,
    input  wire CLEAR,
    input  wire STALL,
    input  wire WE,
    input  wire [(BIT_WIDTH)-1:0] D,
    output wire [(BIT_WIDTH)-1:0] Q
);
    typedef reg [BIT_WIDTH-1:0] register_t;

    // local register holding the stored value
    generate
        if (CS == IMM_SEL) begin : IMM_SEL
            d_ff_rst_we_stall_clr_enum_t #(3, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, imm_sel_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == ALUOP)          begin : ALUOP
            d_ff_rst_we_stall_clr_enum_t #(4, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, aluop_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == ALUSRC1) begin : SRC1
            d_ff_rst_we_stall_clr_enum_t #(2, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, src1_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == ALUSRC2) begin : SRC2
            d_ff_rst_we_stall_clr_enum_t #(1, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, src2_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == REGWRITE) begin : REGWRITE
            d_ff_rst_we_stall_clr_enum_t #(1, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, regwrite_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == RFWT_SEL) begin : RFWT_SEL
            d_ff_rst_we_stall_clr_enum_t #(2, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, rfwt_sel_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == BRANCHOP) begin : BRANCHOP
            d_ff_rst_we_stall_clr_enum_t #(3, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, branchop_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == BRNCH_SEL) begin : BRNCH_SEL
            d_ff_rst_we_stall_clr_enum_t #(2, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, brnch_sel_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == MEM_OP) begin : MEM_OP
            d_ff_rst_we_stall_clr_enum_t #(4, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, mem_op_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == RFF_SEL) begin : RFF_SEL
            d_ff_rst_we_stall_clr_enum_t #(2, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, rff_sel_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == FWD_SEL) begin : FWD_SEL
            d_ff_rst_we_stall_clr_enum_t #(3, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, fwd_sel_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else if (CS == XPR) begin : XPR
            d_ff_rst_we_stall_clr_enum_t #(5, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, xpr_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end else                       begin : PIPELINE_REGISTER
            d_ff_rst_we_stall_clr_enum_t #(BIT_WIDTH, DEFAULT_VALUE, RESET_LEVEL, RESET_SYNC, register_t)
            wrapper (CLK, RST, CLEAR, STALL, WE, D, Q);
        end
    endgenerate
endmodule

module d_ff_rst_we_stall_clr_enum_t #(
    parameter integer BIT_WIDTH = 32'sd8,
    parameter [BIT_WIDTH-1:0] DEFAULT_VALUE = {BIT_WIDTH{1'b0}},
    parameter [0:0] RESET_LEVEL = 1'b0,
    parameter [0:0] RESET_SYNC = 1'b0,
    type signal=reg
) (
    input  wire CLK,
    input  wire RST,
    input  wire CLEAR,
    input  wire STALL,
    input  wire WE,
    input  signal D,
    output signal Q
);
    reg [BIT_WIDTH-1:0] Q_reg;
    generate
        if ( RESET_SYNC ) begin : SYNC
            always @( posedge CLK ) begin
                if ( RST == RESET_LEVEL ) begin
                    Q_reg <= DEFAULT_VALUE;
                end else if ( CLEAR == 1'b1 ) begin
                    Q_reg <= DEFAULT_VALUE;
                end else if ( STALL == 1'b1 ) begin
                    Q_reg <= Q_reg;
                end else if ( WE == 1'b1 ) begin
                    Q_reg <= D;
                end
            end
        end else if ( RESET_LEVEL ) begin : ASYNC_HIGH
            always @( posedge CLK or posedge RST ) begin
                if ( RST == 1'b1 ) begin
                    Q_reg <= DEFAULT_VALUE;
                end else if ( CLEAR == 1'b1 ) begin
                    Q_reg <= DEFAULT_VALUE;
                end else if ( STALL == 1'b1 ) begin
                    Q_reg <= Q_reg;
                end else if ( WE == 1'b1 ) begin
                    Q_reg <= D;
                end
            end
        end else begin : ASYNC_LOW
            always @( posedge CLK or negedge RST ) begin
                if ( RST == 1'b0 ) begin
                    Q_reg <= DEFAULT_VALUE;
                end else if ( CLEAR == 1'b1 ) begin
                    Q_reg <= DEFAULT_VALUE;
                end else if ( STALL == 1'b1 ) begin
                    Q_reg <= Q_reg;
                end else if ( WE == 1'b1 ) begin
                    Q_reg <= D;
                end
            end
        end
    endgenerate

    assign Q = Q_reg;
endmodule // d_ff_rst_we_stall_clr_t

