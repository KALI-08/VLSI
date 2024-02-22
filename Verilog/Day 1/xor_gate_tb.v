// Code your testbench here
// or browse Examples
module xor_gate_tb;
  reg a,b;
  wire c;  
//instantiate the XOR gate module
  xor_gate xorgate(.a(a),.b(b),.c(c)); //ordered instant
//dump waveform information
  initial begin
    $dumpfile("xor_gate.vcd");
    $dumpvars(1, xor_gate_tb);
    $monitor("a=%0d b=%0d c=%0d",a,b,c);
  end
//apply input values
  initial begin
    a=1'b0 ; b=1'b0;
    #10
    a=1'b0 ; b=1'b1;
    #10
    a=1'b1 ; b=1'b0;
    #10
    a=1'b1 ; b=1'b1;
    #10
    $finish;
  end
endmodule
