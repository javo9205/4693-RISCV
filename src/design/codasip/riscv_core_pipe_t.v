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
 *  \brief   Contains module definition of the 'riscv_core_pipe_t' pipeline controller.
 */

module riscv_core_pipe_t(
    input  wire EX_CLEAR_D,
    input  wire EX_STALL_D,
    input  wire ID_CLEAR_D,
    input  wire ID_STALL_D,
    input  wire IF_STALL_D,
    input  wire ME_CLEAR_D,
    input  wire ME_STALL_D,
    input  wire WB_CLEAR_D,
    input  wire WB_STALL_D,
    output wire EX_CLEAR_Q,
    output wire EX_STALL_Q,
    output wire ID_CLEAR_Q,
    output wire ID_STALL_Q,
    output wire IF_STALL_Q,
    output wire ME_CLEAR_Q,
    output wire ME_STALL_Q,
    output wire WB_CLEAR_Q,
    output wire WB_STALL_Q
);
    // data-path code:
    assign IF_STALL_Q = IF_STALL_D;
    assign ID_CLEAR_Q = ID_CLEAR_D;
    assign ID_STALL_Q = ID_STALL_D;
    assign EX_CLEAR_Q = EX_CLEAR_D;
    assign EX_STALL_Q = EX_STALL_D;
    assign ME_CLEAR_Q = ME_CLEAR_D;
    assign ME_STALL_Q = ME_STALL_D;
    assign WB_CLEAR_Q = WB_CLEAR_D;
    assign WB_STALL_Q = WB_STALL_D;
endmodule // riscv_core_pipe_t
