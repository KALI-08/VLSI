module odd_tb;
  reg [7:0]a;
  odd odd(.a(a));
  initial begin
    a=17;
  end
endmodule
