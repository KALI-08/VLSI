module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0]x,y;
    wire cin,cout1,cout2;
    assign cin=1'b0;
    add16 inst1(a[15:0],b[15:0],cin,x,cout1);
    add16 inst2(a[31:16],b[31:16],cout1,y,cout2);
    assign sum={y,x};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
wire p,q,r;
    xor(p,a,b);
    xor(sum,p,cin);
    and(q,a,b);
    and(r,p,cin);
    or(cout,q,r);
// Full adder module here

endmodule
