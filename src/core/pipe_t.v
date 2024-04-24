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
 *  \brief   Contains module definition of the 'pipe_t' pipeline controller.
 */

module pipe_t(
    input  wire EX1_CLEAR_D,
    input  wire EX1_STALL_D,
    input  wire EX2_CLEAR_D,
    input  wire EX2_STALL_D,
    input  wire ID1_CLEAR_D,
    input  wire ID1_STALL_D,
    input  wire ID2_CLEAR_D,
    input  wire ID2_STALL_D,
    input  wire IF_STALL_D,
    input  wire ME1_CLEAR_D,
    input  wire ME1_STALL_D,
    input  wire ME2_CLEAR_D,
    input  wire ME2_STALL_D,
    input  wire WB1_CLEAR_D,
    input  wire WB1_STALL_D,
    input  wire WB2_CLEAR_D,
    input  wire WB2_STALL_D,
    output wire EX1_CLEAR_Q,
    output wire EX1_STALL_Q,
    output wire EX2_CLEAR_Q,
    output wire EX2_STALL_Q,
    output wire ID1_CLEAR_Q,
    output wire ID1_STALL_Q,
    output wire ID2_CLEAR_Q,
    output wire ID2_STALL_Q,
    output wire IF_STALL_Q,
    output wire ME1_CLEAR_Q,
    output wire ME1_STALL_Q,
    output wire ME2_CLEAR_Q,
    output wire ME2_STALL_Q,
    output wire WB1_CLEAR_Q,
    output wire WB1_STALL_Q,
    output wire WB2_CLEAR_Q,
    output wire WB2_STALL_Q
);
    // data-path code:
    assign IF_STALL_Q = IF_STALL_D;
    assign ID1_CLEAR_Q = ID1_CLEAR_D;
    assign ID1_STALL_Q = ID1_STALL_D;
    assign ID2_CLEAR_Q = ID2_CLEAR_D;
    assign ID2_STALL_Q = ID2_STALL_D;
    assign EX1_CLEAR_Q = EX1_CLEAR_D;
    assign EX1_STALL_Q = EX1_STALL_D;
    assign EX2_CLEAR_Q = EX2_CLEAR_D;
    assign EX2_STALL_Q = EX2_STALL_D;
    assign ME1_CLEAR_Q = ME1_CLEAR_D;
    assign ME1_STALL_Q = ME1_STALL_D;
    assign ME2_CLEAR_Q = ME2_CLEAR_D;
    assign ME2_STALL_Q = ME2_STALL_D;
    assign WB1_CLEAR_Q = WB1_CLEAR_D;
    assign WB1_STALL_Q = WB1_STALL_D;
    assign WB2_CLEAR_Q = WB2_CLEAR_D;
    assign WB2_STALL_Q = WB2_STALL_D;
endmodule // pipe_t
