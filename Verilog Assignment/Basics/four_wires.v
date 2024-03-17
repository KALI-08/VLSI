module top_module( 
    input a,b,c,
    output w,x,y,z );
    buf(w,a);
    buf(x,b);
    buf(y,b);
    buf(z,c);
endmodule
