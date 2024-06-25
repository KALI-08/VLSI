module arithmetic;
  int a=10;
  int b=3;
  int x,y;
  initial begin
    $display("Value of a=%0d",a);
    $display("Value of b=%0d",b);
    $display("----------------------");
    y=a+b;
    $display("Value of a+b is =%0d",y);
    y=a-b;
    $display("Value of a-b is =%0d",y);
     y=a*b;
    $display("Value of a*b is =%0d",y);
     y=a/b;
    $display("Value of a/b is =%0d",y);
     y=a%b;
    $display("Value of a modulo b is =%0d",y);
     y=a**b;
    $display("Value of a**b is =%0d",y);
  end
endmodule
