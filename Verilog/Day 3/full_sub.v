module full_sub(
  input a,b,c,
  output dif,bar);
  wire x,y,z;
  half_sub hs1(.a(a),.b(b),.dif(x),.bar(y));
  half_sub hs2(.a(x),.b(c),.dif(dif),.bar(z));
               or (bar,y,z);
endmodule
               module half_sub(
                 input a,b,
                 output dif,bar);
                 wire q;
                 not (q,a);
                 xor (dif,a,b);
                 and (bar,q,b);
               endmodule
