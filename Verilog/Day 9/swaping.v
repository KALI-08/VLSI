module swaping(
  input  [7:0]a,b,
  output reg [7:0]swaped_a,swaped_b);
  reg [7:0]temp;
  always @(*)
  begin
    temp=a;
    swaped_a=b;
    swaped_b=temp;
  end
endmodule
