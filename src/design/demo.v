module demo(input CLK, RST, output [15:0] LED);
    wire HCLK;
    ClockDivider #(10) div(CLK, HCLK);
    riscv_top(HCLK, ~RST, LED);
endmodule

//=============================================================================
module ClockDivider #(FREQUENCY=1000) (input clk, output reg clk_div=0);
    localparam CLOCK_FREQUENCY = 100_000_000;
    localparam MODULO = CLOCK_FREQUENCY / (2 * FREQUENCY);
    localparam N = $clog2(MODULO);
    reg [N:0] counter = MODULO-1;
    always @(posedge(clk)) begin
        counter <= (counter ? counter : MODULO) - 1;
        clk_div <= counter ? clk_div : ~clk_div;
    end
endmodule
