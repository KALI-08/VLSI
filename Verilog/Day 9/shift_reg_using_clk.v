module left_shift_reg(
  input [7:0]a,
  input clk,
  output reg [7:0]q);
  always @(*)
    begin
      if(clk==1)
      q=a<<4;
      else if(clk==0)
        q=1'b0;
    end 
endmodule
