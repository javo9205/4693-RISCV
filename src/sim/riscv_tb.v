`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 01:36:59 PM
// Design Name: 
// Module Name: riscv_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module riscv_tb;

    reg CLK;
    reg RST;
    integer i;
    
    riscv_top top (CLK, RST);
    
    always #1 CLK = ~CLK;
    
    initial begin
        CLK = 0;
        RST = 0;
        #5
        RST = 1;
        for (i=0; i<1000; i=i+1)
            #2;
        $finish;
    end
endmodule
