module decoder_tb;
  reg a,b;
  wire y1,y2,y3,y4;
  //instantiate the decoder module
  decoder decoder(.a(a),.b(b),.y1(y1),.y2(y2),.y3(y3),.y4(y4));
  //ordered instant
  //dump waveform information
  initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(1,decoder_tb);
    $monitor("a=%0d b=%0d y1=%0d y2=%0d y3=%0d y4=%0d",a,b,y1,y2,y3,y4);
  end
  //apply input values
  initial begin
     a=0;b=0;
    #10
     a=0;b=1;
    #10
     a=1;b=0;
    #10
     a=1;b=1;
    #10
    $finish;
  end
endmodule
