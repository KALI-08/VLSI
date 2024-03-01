module odd_tb;
  reg [7:0]a;
  odd odd(.a(a));
  initial begin
    repeat(8)
      #15
    a=$random;
    #15 $finish;
  end
  initial 
    $monitor("a=%d",a);
endmodule
