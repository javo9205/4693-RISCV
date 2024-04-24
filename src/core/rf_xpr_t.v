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
 *  \brief   Contains module definition of the 'rf_xpr_t' CodAL register file.
 *           size: 32
 *           address width: 5 bits
 *           data width: 32 bits
 *           reset: yes
 *           number of read data ports: 4
 *           number of write data ports: 2
 */

module rf_xpr_t(
    input  wire CLK,
    input  wire RST,
    input  wire read0_RE,
    input  wire [4:0] read0_RA,
    input  wire read1_RE,
    input  wire [4:0] read1_RA,
    input  wire read2_RE,
    input  wire [4:0] read2_RA,
    input  wire read3_RE,
    input  wire [4:0] read3_RA,
    input  wire wrt0_WE,
    input  wire [4:0] wrt0_WA,
    input  wire [31:0] wrt0_D,
    input  wire wrt1_WE,
    input  wire [4:0] wrt1_WA,
    input  wire [31:0] wrt1_D,
    output wire [31:0] read0_Q,
    output wire [31:0] read1_Q,
    output wire [31:0] read2_Q,
    output wire [31:0] read3_Q
);
    localparam integer SIZE = 32'h00000020;
    localparam [31:0] DEFAULT_VALUE = 32'h00000000;
    // memory storage
    reg [31:0] RAM[0:SIZE-1];

    generate
        genvar ii;
        for ( ii = 32'sd0; ii < SIZE; ii = ii + 32'sd1 ) begin : WRITE_PROC
            always @( posedge CLK or negedge RST ) begin
                if ( RST == 1'b0 ) begin
                    RAM[ii] <= DEFAULT_VALUE;
                end else if ( (wrt1_WE == 1'b1) && (wrt1_WA == ii[4:0]) ) begin
                    RAM[ii] <= wrt1_D;
                end else if ( (wrt0_WE == 1'b1) && (wrt0_WA == ii[4:0]) ) begin
                    RAM[ii] <= wrt0_D;
                end
            end
        end
    endgenerate

    assign read0_Q = (read0_RE == 1'b1) ? RAM[read0_RA] : 32'h00000000;
    assign read1_Q = (read1_RE == 1'b1) ? RAM[read1_RA] : 32'h00000000;
    assign read2_Q = (read2_RE == 1'b1) ? RAM[read2_RA] : 32'h00000000;
    assign read3_Q = (read3_RE == 1'b1) ? RAM[read3_RA] : 32'h00000000;
endmodule // rf_xpr_t
