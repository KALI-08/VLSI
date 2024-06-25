module bitwise;
  bit[3:0]a,b,c;
  initial begin
    a=4'b0111;
    b=4'b0110;
    $display("Value of a=%0d",a);
    $display("Value of b=%0d",b);
    c=a&b;
    $display("Value of c=a&b=%0b",c);
    c=a|b;
    $display("Value of c=a|b=%0b",c);
    c=~a;
    $display("Value of c=~a=%0b",c);
    c=a^b;
    $display("Value of c=a^b=%0b",c);
    c=~(a^b);
    $display("Value of c=~(a^b)=%0b",c);
  end
endmodule
