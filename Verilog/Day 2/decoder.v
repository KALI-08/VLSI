module decoder(
  input a,b,
  output y1,y2,y3,y4);
  wire p,q;
  not (p,a),(q,b);
  and a1(y1,p,q);
  and a2(y2,p,b);
  and a3(y3,a,q);
  and a4(y4,a,b);
endmodule
