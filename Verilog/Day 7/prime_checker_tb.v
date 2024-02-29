module prime_check_tb;
  reg [7:0]a;
  prime_check prime_check(.a(a));
  initial begin
    a=301;
  end
endmodule
