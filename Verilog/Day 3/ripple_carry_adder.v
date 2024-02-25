module ripple_carry_adder(
  input a0,a1,a2,a3,b0,b1,b2,b3,
  input cin,
  output sum0,sum1,sum2,sum3,
  output carry);
  wire c0,c1,c2;
  full_adder fa1(.a(a0),.b(b0),.c(cin),.sum(sum0),.ca(c0));
  full_adder fa2(.a(a1),.b(b1),.c(c0),.sum(sum1),.ca(c1));
  full_adder fa3(.a(a2),.b(b2),.c(c1),.sum(sum2),.ca(c2));
  full_adder fa4(.a(a3),.b(b3),.c(c2),.sum(sum3),.ca(carry));
endmodule
module full_adder(
    input a,b,c,
    output sum,ca);
    wire x,y,z;
    xor (x,a,b);
    and (y,a,b);
    xor (sum,x,c);
    and (z,x,c);
    or (ca,y,z);
endmodule
