module bcd_xs3(
  input b3,b2,b1,b0,
  output e3,e2,e1,e0);
  wire p,q,r,s,w,x,y,z;
  not (p,b3),(q,b2),(r,b1),(s,b0);
  or or1(w,b1,b0);
  and and1(x,w,b2);
  or or2(e3,x,b3);
  and and2(y,q,w);
  and and3(z,b2,r,s);
  or or3(e2,y,z);
  xnor (e1,b1,b0);
  buf (e0,s);
endmodule
