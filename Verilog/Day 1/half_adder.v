module half_adder(
  input A,B,
  output sum,carry);
  xor (sum,A,B);
  and (carry,A,B);
endmodule
