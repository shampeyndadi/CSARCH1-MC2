`timescale 1ns/1ps

module FF_T(Q,T, clk);
    input T, clk, rst;
    output reg Q;

    always @ (posedge clk, negedge rst)
        if (T==0)
            Q <= Q
        else 
            Q <= !Q
endmodule



