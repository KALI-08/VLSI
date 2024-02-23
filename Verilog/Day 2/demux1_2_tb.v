module demux1_2_tb;
  reg d,s0;
  wire i0,i1;
  //instantiate the demux1_2 module
  demux1_2 demux1_2(.d(d),.s0(s0),.i0(i0),.i1(i1)); //ordered instant
  //dump waveform information
  initial begin
    $dumpfile("demux1_2.vcd");
    $dumpvars(1,demux1_2_tb);
    $monitor("d=%0d s0=%0d i0=%0d i1=%0d",d,s0,i0,i1);
  end
  //apply input values
  initial begin
    d=1'b1;s0=1'b0;
    #15
    d=1'b1;s0=1'b1;
    #15
    $finish;
  end
endmodule
