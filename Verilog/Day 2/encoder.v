module encoder(
  input a,b,c,d,
  output y,z);
  or (y,c,d);
  or (z,b,d);
endmodule
