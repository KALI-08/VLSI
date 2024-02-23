module grey_to_binary_tb;
  reg g1,g2,g3,g4;
  wire b1,b2,b3,b4;
  //instantiate the grey_to_binary module
  grey_to_binary grey_to_binary(.g1(g1),.g2(g2),.g3(g3),.g4(g4),.b1(b1),.b2(b2),.b3(b3),.b4(b4));
  //ordered instant
  //dump waveform information
  initial begin
    $dumpfile("grey_to_binary.vcd");
    $dumpvars(1,grey_to_binary_tb);
    $monitor("g1=%0d g2=%0d g3=%0d g4=%0d b1=%0d b2=%0d b3=%0d b4=%0d",g1,g2,g3,g4,b1,b2,b3,b4);
  end
  //apply input values
  initial begin
   g1=0;g2=0;g3=0;g4=0;
    #15
    g1=0;g2=0;g3=0;g4=1;
    #15
    g1=0;g2=0;g3=1;g4=1;
    #15
    g1=0;g2=0;g3=1;g4=0;
    #15
    g1=0;g2=1;g3=1;g4=0;
    #15
    g1=0;g2=1;g3=1;g4=1;
    #15
    g1=0;g2=1;g3=0;g4=1;
    #15
    g1=0;g2=1;g3=0;g4=0;
    #15
    g1=1;g2=1;g3=0;g4=0;
    #15
    g1=1;g2=1;g3=0;g4=1;
    #15
    g1=1;g2=1;g3=1;g4=1;
    #15
    g1=1;g2=1;g3=1;g4=0;
    #15
    g1=1;g2=0;g3=1;g4=0;
    #15
    g1=1;g2=0;g3=1;g4=1;
    #15
    g1=1;g2=0;g3=0;g4=1;
    #15
    g1=1;g2=0;g3=0;g4=0;
    #15
    $finish;
  end
endmodule
