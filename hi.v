`timescale 1ns/1ps

module FF_T (Q,T, clk);
    input T, clk;
    output reg Q;

    always @ (posedge clk)
        if (T==0)
            Q <= Q
        else 
            Q <= !Q

