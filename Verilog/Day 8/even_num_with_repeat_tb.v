module even_tb;
  reg [7:0]a;
  even even(.a(a));
  initial begin
    repeat(8)
      #15
    a=$random;
    #15 $finish;
  end
  initial 
    $monitor("a=%d",a);
endmodule
