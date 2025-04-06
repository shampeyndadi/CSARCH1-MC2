`timescale 1ns / 1ps

module ex1_tb();
    wire [3:0] t_Q;
    reg t_Y, t_clk, t_reset;

    ex1 dut(t_Q[3], t_Q[2], t_Q[1], t_Q[0], t_Y, t_reset, t_clk);

    initial begin 
        t_clk = 1'b0;
        forever #5 t_clk = ~t_clk;
    end

    initial 
        begin
            t_reset = 1'b0;  
            #10 t_reset = 1'b1; 
        end

    initial begin
        t_Y = 1'b1;
        #30 t_Y = 1'b0;
        #70 t_Y = 1'b1;
    end

    initial #130 $finish;

    initial begin
        $display("Program by Jed Julian");
        $monitor("time=%03d, Clk=%b, reset=%b, Y=%b, state=%b%b%b%b", 
                  $time, t_clk, t_reset, t_Y, t_Q[3], t_Q[2], t_Q[1], t_Q[0]);
        $dumpfile("jed_julian.vcd"); 
        $dumpvars(0, ex1_tb);        
    end

endmodule