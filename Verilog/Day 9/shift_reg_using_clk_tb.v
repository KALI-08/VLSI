module left_shift_reg_tb;
  reg [7:0]a;
  reg clk;
  wire [7:0]q;
  left_shift_reg left_shift_reg(.a(a),.q(q),.clk(clk));
  initial begin
    $monitor("a=%b q=%b clk=%d",a,q,clk);
  end
  initial begin
    clk=1;
    a=$random;
    #10$finish;
  end
  always #2 clk=~clk;
endmodule
