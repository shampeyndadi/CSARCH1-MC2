`timescale 1ns / 1ps

module ex1_tb();
    wire A, B, C, D;
    reg t_Y, t_clk, t_reset;

    // Instantiate your design with correct signal names
    ex1 dut(A, B, C, D, t_Y, t_reset, t_clk);

    // Clock generation: 10 ns period
    initial begin 
        t_clk = 1'b0;
        forever #5 t_clk = ~t_clk;
    end

    // Reset logic
    initial begin
        t_reset = 1'b0;   // Active low reset
        #10 t_reset = 1'b1; // Release reset after 10ns
    end

    // Input Y toggle logic
    initial begin
        t_Y = 1'b1;
        #70 t_Y = 1'b0;
        #30 t_Y = 1'b1;
    end

    // End simulation after 130 ns
    initial #130 $finish;

    // Display and dump signals
    initial begin
        $display("Program by Jed Julian");
        $monitor("time=%03d, Clk=%b, reset=%b, Y=%b, state=%b%b%b%b", 
                  $time, t_clk, t_reset, t_Y, A, B, C, D);
        $dumpfile("jed_julian.vcd"); // ✅ must end with .vcd
        $dumpvars(0, ex1_tb);        // ✅ dump all variables in this module
    end

endmodule
