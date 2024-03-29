module top_module (
    input in1,
    input in2,
    output out);
wire x;
    not(x,in2);
    and(out,x,in1);
endmodule
