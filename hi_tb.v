`timescale 1ns / 1ps

module ex1_tb;
    reg clk;
    reg reset;
    reg Y;
    wire A, B, C, D;

    // Instantiate the counter
    ex1 dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(Y),
        .reset(reset),
        .clock(clk)
    );

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 0;
        Y = 0;

        // Monitor the values
        $monitor("Time = %0t, clk = %b, reset = %b, Y = %b, count = %b%b%b%b", $time, clk, reset, Y, A, B, C, D);

        // Test Case a: Initially reset=0, then after 10 time units, change the reset value to 1
        #10 reset = 1;

        // Test Case b: Then y=0 and ensure enough simulation time to show the entire counter transition
        #80 Y = 0;

        // Test Case c: Then y=1 and ensure enough simulation time to show the entire counter transition
        #80 Y = 1;

        // Finish simulation after enough time
        #160 $finish;
    end

    // Generate clock with half cycle of 5 time units
    always #5 clk = ~clk;

endmodule