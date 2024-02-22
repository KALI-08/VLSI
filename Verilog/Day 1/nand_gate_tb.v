// Code your testbench here
// or browse Examples
module nand_gate_tb;
  reg a,b;
  wire y;  
//instantiate the NAND gate module
  nand_gate nandgate(.a(a),.b(b),.y(y)); //ordered instant
//dump waveform information
  initial begin
    $dumpfile("nand_gate.vcd");
    $dumpvars(1, nand_gate_tb);
    $monitor("a=%0d b=%0d y=%0d",a,b,y);
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
