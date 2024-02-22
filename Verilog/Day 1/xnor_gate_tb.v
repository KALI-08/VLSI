module xnor_gate_tb;
  reg x,y;
  wire z;  
//instantiate the XNOR gate module
  xnor_gate xnorgate(.x(x),.y(y),.z(z)); //ordered instant
//dump waveform information
  initial begin
    $dumpfile("xnor_gate.vcd");
    $dumpvars(1, xnor_gate_tb);
    $monitor("x=%0d y=%0d z=%0d",x,y,z);
  end
//apply input values
  initial begin
    x=1'b0 ; y=1'b0;
    #10
    x=1'b0 ; y=1'b1;
    #10
    x=1'b1 ; y=1'b0;
    #10
    x=1'b1 ; y=1'b1;
    #10
    $finish;
  end
endmodule
