module ripple_carry_adder_tb;
  reg a0,a1,a2,a3,b0,b1,b2,b3;
  reg cin;
  wire sum0,sum1,sum2,sum3;
  wire carry;
  ripple_carry_adder ripple_carry_adder(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.b0(b0),.b1(b1),.b2(b2),.b3(b3),.cin(cin),.sum0(sum0),.sum1(sum1),.sum2(sum2),.sum3(sum3),.carry(carry));
  initial begin
    $dumpfile("ripple_carry_adder.vcd");
    $dumpvars(1,ripple_carry_adder_tb);
    $monitor("a0=%d a1=%d a2=%d a3=%d b0=%d b1=%d b2=%d b3=%d cin=%d sum0=%d sum1=%d sum2=%d sum3=%d carry=%d",a0,a1,a2,a3,b0,b1,b2,b3,cin,sum0,sum1,sum2,sum3,carry);
  end
  initial begin
    a0=$random%16;a1=$random%16;a2=$random%16;a3=$random%16;
    b0=$random%16;b1=$random%16;b2=$random%16;b3=$random%16;
    cin=0;
    #20
    $finish;
  end
endmodule
