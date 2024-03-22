module top_module(
    input [31:0] a,
    input [31:0] b,
    input  sub,
    output [31:0] sum
);
    wire [31:0]c;
    wire [15:0]x,y;
    wire cin,cout1,cout2;
    //assign cin=1'b0;
    assign c={32{sub}}^b;
    //assign sub=1'b1;
    add16 inst1(a[15:0],c[15:0],sub,x,cout1);
    add16 inst2(a[31:16],c[31:16],cout1,y,cout2);
    assign sum={y,x};

endmodule
