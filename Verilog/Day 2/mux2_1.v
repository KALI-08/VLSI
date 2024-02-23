// Code your design here
module mux2_1(
  input d0,d1,s0,  //2input and 1 select line
  output y);
  wire x,a,b;   //select line invert and and gate output
  not (x,s0);
  and (a,x,d0);
  and (b,s0,d1);
  or (y,a,b);
endmodule
