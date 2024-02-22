// Code your testbench here
// or browse Examples
module and_gate_tb;
  reg a,b;
  wire y;  
//instantiate the AND gate module
  and_gate andgate(.A(a),.B(b),.Y(y));
//dump waveform information
  initial begin
    $dumpfile("and_gate.vcd");
    $dumpvars(1, and_gate_tb);
    $monitor("a=%0d b=%0d y=%0d",a,b,y);
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
