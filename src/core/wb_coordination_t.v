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
 *  \brief   Contains module definition of the 'wb_coordination_t' functional unit.
 */

module wb_coordination_t(
    input  wire ACT,
    input  wire r_wb1_order_Q,
    input  wire [4:0] r_wb1_rd_Q,
    input  wire r_wb1_regwrite_Q,
    input  wire r_wb1_valid_Q,
    input  wire r_wb2_order_Q,
    input  wire [4:0] r_wb2_rd_Q,
    input  wire r_wb2_regwrite_Q,
    input  wire r_wb2_valid_Q,
    input  wire s_wb2_older_Q,
    input  wire s_wb_wthaz_Q,
    output wire s_wb1_stall_D,
    output wire s_wb1_wten_D,
    output wire s_wb2_older_D,
    output wire s_wb2_stall_D,
    output wire s_wb2_wten_D,
    output wire s_wb_wthaz_D
);
    // type, wire and constant declarations:
    // signal/wire
    wire ignore_B0;

    // data-path code:
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:55:9
    // ignore.write((int32)(0x1));
    assign ignore_B0 = 1'b1;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:62:9
    // s_wb1_stall.write((int32)(0x0));
    assign s_wb1_stall_D = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:56:9
    // s_wb1_wten.write(r_wb1_regwrite.read() & (r_wb1_rd.read() != (uint5)(0)) & (((s_wb2_older.rea ...
    assign s_wb1_wten_D = (ACT == 1'b1) ? ((r_wb1_regwrite_Q & (r_wb1_rd_Q != 5'h00)) & ((s_wb2_older_Q) ? ignore_B0 : (~s_wb_wthaz_Q))) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:45:9
    // s_wb2_older.write((~r_wb1_valid.read()) | (r_wb2_valid.read() & (r_wb1_order.read() ^ r_wb2_o ...
    assign s_wb2_older_D = (ACT == 1'b1) ? ((~r_wb1_valid_Q) | (r_wb2_valid_Q & (r_wb1_order_Q ^ r_wb2_order_Q))) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:63:9
    // s_wb2_stall.write((int32)(0x0));
    assign s_wb2_stall_D = 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:57:9
    // s_wb2_wten.write(r_wb2_regwrite.read() & (r_wb2_rd.read() != (uint5)(0)) & (((s_wb2_older.rea ...
    assign s_wb2_wten_D = (ACT == 1'b1) ? ((r_wb2_regwrite_Q & (r_wb2_rd_Q != 5'h00)) & ((s_wb2_older_Q) ? (~s_wb_wthaz_Q) : ignore_B0)) : 1'b0;
    // /home/project/superscalar/model/ca/pipelines/ca_pipe5_wb.codal:50:9
    // s_wb_wthaz.write((r_wb1_regwrite.read() & r_wb2_regwrite.read()) & !((r_wb1_rd.read() ^ r_wb2 ...
    assign s_wb_wthaz_D = (ACT == 1'b1) ? ((r_wb1_regwrite_Q & r_wb2_regwrite_Q) & (!((r_wb1_rd_Q ^ r_wb2_rd_Q) != 5'h00))) : 1'b0;
endmodule // wb_coordination_t
