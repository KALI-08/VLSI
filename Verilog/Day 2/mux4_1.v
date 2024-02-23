// Code your design here
module mux4_1(
  input a,b,c,d,s0,s1,
  output z);
  wire x,y,p,q,r,s;
  not (x,s0);
  not (y,s1);
  and (p,x,y,a);
  and (q,x,s1,b);
  and (r,s0,y,c);
  and (s,s0,s1,d);
  or (z,p,q,r,s);
endmodule
