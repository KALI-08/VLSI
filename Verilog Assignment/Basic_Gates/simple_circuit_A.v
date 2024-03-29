module top_module (input x, input y, output z);
    reg A;
wire d;
    xor(d,x,y);
    and(z,d,x);
    assign A=z;
endmodule
