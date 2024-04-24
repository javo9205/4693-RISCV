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
 *  \brief   Contains module definition of the 'codasip_startup_ctrl_t' startup controller.
 */

module codasip_startup_ctrl_t(
    input  wire CLK,
    input  wire RST,
    output wire main_ACT,
    output wire reset_ACT
);
    // additional declarations:
    wire main_ACT_reg_D;
    wire main_ACT_reg_Q;
    wire reset_ACT_reg_D;
    wire reset_ACT_reg_Q;

    // child instances inside startup controller:
    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) main_ACT_reg (
        .CLK(CLK),
        .RST(RST),
        .D(main_ACT_reg_D),
        .Q(main_ACT_reg_Q)
    );

    // register instance:
    d_ff_rst_t #(
        .BIT_WIDTH(32'sd1),
        .DEFAULT_VALUE(1'b0),
        .RESET_LEVEL(1'b0),
        .RESET_SYNC(1'b0)
    ) reset_ACT_reg (
        .CLK(CLK),
        .RST(RST),
        .D(reset_ACT_reg_D),
        .Q(reset_ACT_reg_Q)
    );

    // data-path code:
    assign reset_ACT_reg_D = ((~main_ACT_reg_Q) & (~reset_ACT_reg_Q));
    assign main_ACT_reg_D = (main_ACT_reg_Q | reset_ACT_reg_Q);
    assign main_ACT = main_ACT_reg_Q;
    assign reset_ACT = reset_ACT_reg_Q;
endmodule // codasip_startup_ctrl_t
