module encoder_tb;
  reg a,b,c,d;
  wire y,z;
  //instantiate the encoder module
  encoder encoder(.a(a),.b(b),.c(c),.d(d),.y(y),.z(z));
  //ordered instant
  //dump waveform information
  initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(1,encoder_tb);
    $monitor("a=%0d b=%0d c=%0d d=%0d y=%0d z=%0d",a,b,c,d,y,z);
  end
  //apply input values
  initial begin
   a=1;b=0;c=0;d=0;
    #10
     a=0;b=1;c=0;d=0;
    #10
     a=0;b=0;c=1;d=0;
    #10
     a=0;b=0;c=0;d=1;
    #10
    $finish;
  end
endmodule
