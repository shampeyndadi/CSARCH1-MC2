`timescale 1ns/1ps

module FF_T(Q, T, clk, rst);
    input T, clk, rst;
    output reg Q;

    always @ (posedge clk or negedge rst)
        if (!rst)
            Q <= 1'b0;           // ✅ initialize to 0 on reset
        else if (T == 1'b1)
            Q <= ~Q;             // ✅ toggle if T = 1
        else
            Q <= Q;              // ✅ retain value if T = 0
endmodule

module ex1(A,B,C,D,Y,reset, clock);
    output A,B,C,D;
    input Y, reset, clock;
    wire TA, TB, TC, TD;
    wire QA,QB,QC,QD;

    assign TA = QC&QD;
    assign TB = QD;
    assign TC = 1'b1;
    assign TD = 1'b0;

    FF_T F1(QA, TA, clock, reset);
    FF_T F2(QB, TB, clock, reset);
    FF_T F3(QC, TC, clock, reset);
    FF_T F4(QD, TD, clock, reset);

    assign A = QA;
    assign B = QB;
    assign C = QC;
    assign D = QD;
endmodule



