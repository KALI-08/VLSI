// Code your testbench here
// or browse Examples
module mux2_1_tb;
  reg d0,d1,s0;
  wire y;
  //instantiate the 2_1mux module
  mux2_1 mux2_1(.d0(d0),.d1(d1),.s0(s0),.y(y)); //ordered instant
  //dump waveform information
  initial begin
    $dumpfile("mux2_1.vcd");
    $dumpvars(1,mux2_1_tb);
    $monitor("d0=%0d d1=%0d s0=%0d y=%0d",d0,d1,s0,y);
  end
  //apply input values
  initial begin
    d0=1'b0;d1=1'b1;s0=1'b0;
    #15
    d0=1'b0;d1=1'b1;s0=1'b1;
    #15
    $finish;
  end
endmodule
