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
 *  \brief   Contains definition of generic pipeline register with synchronous write, configurable reset and with write enable signal.
 */

module d_ff_rst_we_stall_t #(
    parameter integer BIT_WIDTH = 32'sd8,
    parameter [BIT_WIDTH-1:0] DEFAULT_VALUE = {BIT_WIDTH{1'b0}},
    parameter [0:0] RESET_LEVEL = 1'b0,
    parameter [0:0] RESET_SYNC = 1'b0
) (
    input  wire CLK,
    input  wire RST,
    input  wire STALL,
    input  wire WE,
    input  wire [(BIT_WIDTH)-1:0] D,
    output wire [(BIT_WIDTH)-1:0] Q
);
    // local register holding the stored value
    reg [BIT_WIDTH-1:0] Q_reg;

    generate
        if ( RESET_SYNC ) begin : SYNC
            always @( posedge CLK ) begin
                if ( RST == RESET_LEVEL ) begin
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
                end else if ( STALL == 1'b1 ) begin
                    Q_reg <= Q_reg;
                end else if ( WE == 1'b1 ) begin
                    Q_reg <= D;
                end
            end
        end
    endgenerate

    assign Q = Q_reg;
endmodule // d_ff_rst_we_stall_t
