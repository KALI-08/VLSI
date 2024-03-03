module left_shift_reg(
  input [7:0]a,
  output reg [7:0]q);
  always @(*)
    begin
      q=a<<4;
    end 
endmodule
