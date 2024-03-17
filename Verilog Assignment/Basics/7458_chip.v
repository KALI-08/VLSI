module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
wire w,x,y,z;
    and(w,p2a,p2b);
    and(x,p2c,p2d);
    and(y,p1c,p1b,p1a);
    and(z,p1f,p1e,p1d);
    or(p2y,w,x);
    or(p1y,y,z);

endmodule
