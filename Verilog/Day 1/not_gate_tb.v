// Code your testbench here
// or browse Examples
module not_gate_tb;
  reg x;
  wire y;  
//instantiate the AND gate module
  not_gate notgate(.x(x),.y(y));
//dump waveform information
  initial begin
    $dumpfile("not_gate.vcd");
    $dumpvars(1, not_gate_tb);
    $monitor("x=%0d y=%0d",x,y);
  end
//apply input values
  initial begin
    x=0 ;
    #10
    x=1 ; 
    #10
    $finish;
  end
endmodule
