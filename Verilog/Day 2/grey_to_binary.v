module grey_to_binary(
  input g1,g2,g3,g4,
  output b1,b2,b3,b4);
  buf (b1,g1);
  xor a1(b2,g2,g1);
  xor a2(b3,g2,b2);
  xor a3(b4,g4,b3);
endmodule
