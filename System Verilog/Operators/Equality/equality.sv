module equality;
  bit[3:0] a,b,c,d,y;
  initial begin
    a=4'bx01z;
    b=4'b011x;
    c=4'bx01z;
    d=4'b0101;
    $display("Value of a=%0d",a);
    $display("Value of b=%0d",b);
    $display("Value of c=%0d",c);
    $display("Value of d=%0d",d);
    y=(a===c);
    $display("Value of y=(a===c)=%0d",y);
    y=(a!==c);
    $display("Value of y=(a!==c)=%0d",y);
    y=(a==d);
    $display("Value of y=(a==d)=%0d",y);
    y=(b!=d);
    $display("Value of y=(b!=d)=%0d",y);
  end
endmodule
