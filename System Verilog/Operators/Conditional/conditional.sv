module conditional;
  bit[3:0]a,b;
  string c,d,y;
  initial begin
    a=4'b0001;
    b=4'b0011;
    c="true";
    d="false";
    $display("Value of a=%0d",a);
    $display("Value of b=%0d",b);
    y=a<b?c:d;
    $display("Value in y=%0s",y);
  end
endmodule
