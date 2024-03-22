module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire cin,cout1,cout2;
    wire [15:0] x,y;
    assign cin=1'b0;
    //add16 inst1(.a(a[15:0]),.b(b[15:0]),.sum(x),.cin(cin),.cout(cout1));
    //add 16 inst2(.a(a[16:31]),.b(b[16:31]),.sum(y),.cin(cout1),.cout(cout));
    //assign sum={x,y};
    add16 inst1(a[15:0],b[15:0],cin,x,cout1);
    add16 inst2(a[31:16],b[31:16],cout1,y,cout2);
    assign sum={y,x};
endmodule
