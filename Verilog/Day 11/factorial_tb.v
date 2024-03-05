module factorial_tb;
  reg [4:0]a;
  wire [12:0]y;  
  factorial uut(.a(a),.y(y));
  initial begin
    a=4;
    #10
    $finish;
  end
  always@(*)
    $monitor("a = %d  y= %d",a,y);
endmodule
