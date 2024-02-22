// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module or_gate_tb;
  reg a,b;
  wire c;  
//instantiate the OR gate module
  or_gate orgate(.a(a),.b(b),.c(c));
//dump waveform information
  initial begin
    $dumpfile("or_gate.vcd");
    $dumpvars(1, or_gate_tb);
    $monitor("a=%0d b=%0d c=%0d",a,b,c);
  end
//apply input values
  initial begin
    a=0 ; b=0;
    #10
    a=0 ; b=1;
    #10 
    a=1 ; b=0;
    #10 
    a=1 ; b=1;
    #10
    $finish;
  end
endmodule
