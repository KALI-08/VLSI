module d_ff(
  input D,
  input clk,
  input reset,
  output q);
  reg q;
 
  always @(posedge clk or reset)
    begin
      if(!reset) 
        q <= D;
      else if(reset)
        q <=1'b0;
    end
endmodule
