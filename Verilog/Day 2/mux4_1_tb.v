module mux4_1_tb;
  reg a,b,c,d,s0,s1;
  wire z;
  //instantiate the 4_1mux module
  mux4_1 mux4_1(.a(a),.b(b),.c(c),.d(d),.s0(s0),.s1(s1),.z(z)); //ordered instant
  //dump waveform information
  initial begin
    $dumpfile("mux4_1.vcd");
    $dumpvars(1,mux4_1_tb);
    $monitor("a=%0d b=%0d c=%0d d=%0d s0=%0d s1=%0d z=%0d",a,b,c,d,s0,s1,z);
  end
  //apply input values
  initial begin
    a=1'b1;b=1'b0;c=1'b0;d=1'b0;s0=1'b0;s1=1'b0;
    #15
    a=1'b0;b=1'b1;c=1'b0;d=1'b0;s0=1'b0;s1=1'b1;
    #15
    a=1'b0;b=1'b0;c=1'b1;d=1'b0;s0=1'b1;s1=1'b0;
    #15
    a=1'b0;b=1'b0;c=1'b0;d=1'b1;s0=1'b1;s1=1'b1;
    #15
    $finish;
  end
endmodule
