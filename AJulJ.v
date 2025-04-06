// Name: JULIAN, Jedidiah | Section: S17
// Structural Model for Even Up-Down Binary Counter using T Flip-Flop

`timescale 1ns/1ps

module FF_T(Q, T, clk, rst);
    input T, clk, rst;
    output reg Q;

    always @ (posedge clk or negedge rst)
        if (!rst)         
            Q <= 0;
        else if (T)
            Q <= ~Q;
        else
            Q <= Q;  
endmodule

module ex1(A,B,C,D,Y,reset,clock);
    output A,B,C,D;
    input Y, clock, reset;
    wire TA, TB, TC, TD;

    assign TA = ((~B) & (~C) & (~Y)) | (B & C & Y);
    assign TB = ((~C) & (~Y)) | (C & Y);
    assign TC = 1;
    assign TD = 0;

    FF_T FF_A(A,TA,clock, reset);
    FF_T FF_B(B,TB,clock, reset);
    FF_T FF_C(C,TC,clock, reset);
    FF_T FF_D(D,TD,clock, reset);

endmodule