module reduction(
  input [3:0]a,
  output reg y0,y1,y2,y3,y4,y5);
  always @(*) begin
    y0=&a;
    y1=~&a;
    y2=|a;
    y3=~|a;
    y4=^a;
    y5=~^a;
  end
endmodule
