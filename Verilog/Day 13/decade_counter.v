module decade_counter
  #(parameter N=4)
  (input clk, reset,
    output reg [N-1:0] out);
  always @(posedge clk or posedge reset)
    begin
      if (reset)
        out<=4'b0000;
      else if(out==4'b1001)
      out<=4'b0000;
    else
      out<=out+1;
  end 
endmodule
