module even_tb;
  reg [7:0]a;
  even even(.a(a));
  initial begin
    a=10;
  end
endmodule
