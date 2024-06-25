module relational;
  bit [3:0]a,b;
  bit[3:0]y;
  initial begin
    a=2'hA;
    b=4'b0101;
    $display("Value of a=%0d",a);
    $display("Value of b=%0d",b);
    y=a<b;
    $display("Output of a<b=%0d",y);
    y=a>b;
    $display("Output of a>b=%0d",y);
    y=a<=b;
    $display("Output of a<=b=%0d",y);
    y=a>=b;
    $display("Output of a>=b=%0d",y);
  end
endmodule
