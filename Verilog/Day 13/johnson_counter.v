module johnson_counter(clk,reset,out);
  parameter N=4;
  input clk,reset;
  output reg [N-1:0] out;
  always@(posedge clk) 
    begin
      if(reset)
        out={~out[0],out[N-1:1]};
      else
        out=1;
    end
endmodule
