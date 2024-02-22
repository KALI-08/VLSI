module full_adder(
  input a,b,c,
  output sum,carry);
  wire x,y,z;
  xor (x,a,b);
  xor (sum,x,c);
  and (y,a,b);
  and (z,x,c);
  or (carry,y,z);
endmodule
