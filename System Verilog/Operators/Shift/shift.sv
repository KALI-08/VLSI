module shift;
  bit[4:0]a,b;
  initial begin
    a=5'b00110;
    $display("Value of a=%0b",a);
    b=a<<2;
    $display("Value of b=%0b",b);
    b=a>>3;
    $display("Value of b=%0b",b);
    b=a<<<2;
    $display("Value of b=%0b",b);
    b=a>>>2;
    $display("Value of b=%0b",b);
  end
endmodule
