module updown_counter(
  input clk,reset,updown,
  output reg [3:0]out);
  always @(posedge clk or posedge reset)
    begin
      if(reset)
        out<=0;
      else if(~updown)
        out<=out+1;
      else if(updown)
        out<=out-1;
    end
endmodule
