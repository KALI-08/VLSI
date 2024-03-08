module ripple_counter(
  input clk,reset,
  output [3:0]out);
  wire d1,d11,d2,d21,d3,d31,d4,d41;
  d_ff df1(.d(d11),.clk(clk),.reset(reset),.q(d1),.qo(d11));
  d_ff df2(.d(d21),.clk(d0),.reset(reset),.q(d2),.qo(d21));
  d_ff  df3(.d(d31),.clk(d1),.reset(reset),.q(d3),.qo(d31));
  d_ff df4(.d(d41),.clk(d2),.reset(reset),.q(d4),.qo(d41));
  
  assign out={d41,d31,d21,d11};
 
endmodule
module d_ff(
  input d,clk,reset,
  output reg q,
  output qo);
  always@(posedge clk or negedge reset)
    if(!reset==0)
      q=0;
  else 
    q=1;
  assign qo=~q;
endmodule
