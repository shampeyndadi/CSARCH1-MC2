// Name: JULIAN, Jedidiah Kyle M. | Section: S17
// Testbench for Even Up-Down Binary Counter using T Flip-Flop

module AJulJ_tb();
    wire [3:0] t_Q;
    reg t_Y, t_clk, t_reset;

    AJulJ dut(t_Q[3], t_Q[2], t_Q[1], t_Q[0], t_Y, t_reset, t_clk);

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
        t_Y = 1'b0;
        #10 t_Y = 1'b0;
        #80 t_Y = 1'b1;
    end

    initial #170 $finish;

    initial begin
        $display("Program by Jedidah Julian, Structural model of even up-down Binary Counter using T Flip-Flop");
        $monitor("Time=%03d, Clk=%b, Reset=%b, Y=%b, State=%b%b%b%b", 
                  $time, t_clk, t_reset, t_Y, t_Q[3], t_Q[2], t_Q[1], t_Q[0]);
        $dumpfile("AJulJ.vcd"); 
        $dumpvars();        
    end

endmodule