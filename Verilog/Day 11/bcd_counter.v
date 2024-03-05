module bcd_counter(
  input clk,reset,
  output reg [7:0]out);
  always @(posedge clk or posedge reset)
    begin
      if (reset)
        out<=0;
      else if(out==4'b1001)
        out<=4'b0;
      else
        out<=out+1;
    end
endmodule
