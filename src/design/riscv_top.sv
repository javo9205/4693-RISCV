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
 *  in Codasip license agreement under which you obtained this file.  * 
 *  \file
 *  \date    2024-03-30
 *  \author  Codasip (c) HW generator
 *  \version 9.4.2
 *  \brief   Contains module definition of the 'riscv_top' ASIP top.
 */

`include "AHB_Interface.svh"

module riscv_top(
    input CLK,
    input RST,
    input  [15:0] SW,
    output [15:0] LED,
    output [ 5:0] RGB,
    output [15:0] D_7SEG,
    output [ 7:0] EN_7SEG
);
    localparam ROM_FILE="test3.mem";
    localparam ADDR_WIDTH=32;
    localparam DATA_WIDTH=32;

    AHB_Interface #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) master[3:0]();
    AHB_Interface #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) slaves[3:0]();
    assign slaves[0].base_addr = 32'h0;
    assign slaves[0].last_addr = 32'hFFFF;
    assign slaves[1].base_addr = 32'h0;
    assign slaves[1].last_addr = 32'hFFFF;
    assign slaves[2].base_addr = 32'h0;
    assign slaves[2].last_addr = 32'hFFFF;
    assign slaves[3].base_addr = 32'h0;
    assign slaves[3].last_addr = 32'hFFFF;

//    assign LED = {2'b0, i_haddr[13:2], 2'b0};
    

    // child instances inside ASIP top:
    // ASIP instance:
    
    superscalar riscv32ia (
        .CLK(CLK),
        .RST(RST),
        .if1  (master[0]),
        .if2  (master[1]),
        .ldst1(master[2]),
        .ldst2(master[3])
    );
    
    AHB_Interconnect #(
        .NUM_MASTER(4),
        .NUM_SLAVES(4),
        .DATA_WIDTH (DATA_WIDTH),
        .ADDR_WIDTH (ADDR_WIDTH)
    ) bus (
        .HCLK (CLK),
        .HRESETn(RST),
        .m (master),
        .s (slaves)
    );
	
    AHB_Memory #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .PORTS(4),
        .SIZE_IN_KB(64),
        .INITIALIZE(1),
        .INIT_FILE("test3.mem")
    ) memory (
        .HCLK (CLK),
        .HRESETn (RST),
        .AHB (slaves[3:0])
    );

endmodule // riscv_top
