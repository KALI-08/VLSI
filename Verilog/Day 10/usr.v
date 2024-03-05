module usr(
  input clk,reset,
  input [7:0]d,
  input [1:0]s,
  output reg [7:0]q);
  always @(posedge clk) begin
  if (reset)
    q=0;
  else begin
    case(s)
      2'b00: q=d;
      2'b01: q=d<<1;
      2'b10: q=d>>1;
      2'b11: q=d;
    endcase
  end
  end
endmodule
