module left_shift_reg_tb;
  reg [7:0]a;
  wire [7:0]q;
  left_shift_reg left_shift_reg(.a(a),.q(q));
  initial begin
    $monitor("a=%b q=%b",a,q);
  end
  initial begin
    a=4'b0101;
  end
endmodule
