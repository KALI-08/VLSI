module fulladder_tb;
  reg a,b,cin;
  wire sum,carry;
//instantiate the full adder module
  fulladder fulladder(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry)); //ordered instant
//dump waveform information
  initial begin
    $dumpfile("fulladder.vcd");
    $dumpvars(1, fulladder_tb);
    $monitor("a=%0d b=%0d cin=%0d sum=%0d carry=%0d",a,b,cin,sum,carry);
  end
//apply input values
  initial begin
    a=0 ; b=0 ; cin=0;
    #10
    a=0 ; b=0 ; cin=1;
    #10
    a=0 ; b=1 ; cin=0;
    #10
    a=0 ; b=1 ; cin=1;
    #10
    a=1 ; b=0 ; cin=0;
    #10
    a=1 ; b=0 ; cin=1;
    #10
    a=1 ; b=1 ; cin=0;
    #10
    a=1 ; b=1 ; cin=1;
    #10
    $finish;
  end
endmodule
