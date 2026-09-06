`timescale 1ns/1ps

module counter_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

    counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Generate clock
    always #5 clk = ~clk;

    initial begin

        $display("=================================");
        $display("Starting counter verification...");
        $display("=================================");

        clk = 0;
        rst = 1;

        // Hold reset
        #10;

        // Counter should be zero after reset
        if (count !== 4'b0000) begin
            $display("FAIL: Counter did not reset to 0");
            $finish;
        end

        $display("PASS: Reset check");

        // Release reset
        rst = 0;

        // Wait for 5 clock cycles
        #50;

        // Expected value after 5 cycles
        if (count !== 4'b0101) begin
            $display("FAIL: Expected count = 5, got %d", count);
            $finish;
        end

        $display("PASS: Counter reached expected value = 5");

        $display("=================================");
        $display("SIMULATION PASSED");
        $display("=================================");

        $finish;

    end

endmodule
