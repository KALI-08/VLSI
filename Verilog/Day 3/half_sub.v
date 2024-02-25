module half_sub(
  input a,b,
  output dif,bar);
  wire x;
  not (x,a);
  xor (dif,a,b);
  and (bar,x,b);
endmodule
