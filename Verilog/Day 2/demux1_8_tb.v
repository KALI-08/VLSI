module demux1_8_tb;
  reg d,s0,s1,s2;
  wire y1,y2,y3,y4,y5,y6,y7,y8;
  //instantiate the demux1_8 module
  demux1_8 demux1_8(.d(d),.s0(s0),.s1(s1),.s2(s2),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7),.y8(y8)); //ordered instant
  //dump waveform information
  initial begin
    $dumpfile("demux1_8.vcd");
    $dumpvars(1,demux1_8_tb);
    $monitor("d=%0d s0=%0d s1=%0d s2=%0d y1=%0d y2=%0d y3=%0d y4=%0d y5=%0d y6=%0d y7=%0d y8=%0d",d,s0,s1,s2,y1,y2,y3,y4,y5,y6,y7,y8);
  end
  //apply input values
  initial begin
    d=1'b1;s0=1'b0;s1=1'b0;s2=1'b0;
    #15
    d=1'b1;s0=1'b0;s1=1'b0;s2=1'b1;
    #15
    d=1'b1;s0=1'b0;s1=1'b1;s2=1'b0;
    #15
    d=1'b1;s0=1'b0;s1=1'b1;s2=1'b1;
    #15
    d=1'b1;s0=1'b1;s1=1'b0;s2=1'b0;
    #15
    d=1'b1;s0=1'b1;s1=1'b0;s2=1'b1;
    #15
    d=1'b1;s0=1'b1;s1=1'b1;s2=1'b0;
    #15
    d=1'b1;s0=1'b1;s1=1'b1;s2=1'b1;
    #15
    $finish;
  end
endmodule
