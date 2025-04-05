`timescale 1ns/1ps

module FF_T(Q,T,clk, rst);
    input T, clk, rst;
    output reg Q;

    always @ (posedge clk, negedge rst)
        if (T==0)
            Q <= Q;
        else 
            Q <= !Q;
endmodule

module ex1(A,B,C,D,Y,reset, clock);
    output A,B,C,D;
    input Y, reset, clock;
    wire TA, TB, TC, TD;

    assign TA = C&D;
    assign TB = D;
    assign TC = 1;
    assign TD = 0;

    FF_T F1(A, TA, clock, reset);
    FF_T F2(B, TB, clock, reset);
    FF_T F3(C, TC, clock, reset);
    FF_T F4(D, TD, clock, reset);
endmodule



