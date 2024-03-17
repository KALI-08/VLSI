module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
wire x,y;
    and(x,a,b);
    and(y,c,d);
    or(out,x,y);
    not(out_n,out);
endmodule
