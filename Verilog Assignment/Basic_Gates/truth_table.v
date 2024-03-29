module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    wire x,y,z;
    not(x,x3);
    and(y,x3,x1);
    and(z,x,x2);
    or(f,y,z);

endmodule
