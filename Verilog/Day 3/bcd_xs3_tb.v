module bcd_xs3_tb;
  reg b3,b2,b1,b0;
  wire e3,e2,e1,e0;
  bcd_xs3 bcd_xs3(.b3(b3),.b2(b2),.b1(b1),.b0(b0),.e3(e3),.e2(e2),.e1(e1),.e0(e0));
  initial begin
    $dumpfile("bcd_xs3.vcd");
    $dumpvars(1,bcd_xs3_tb);
    $monitor("b3=%d b2=%d b1=%d b0=%d e3=%d e2=%d e1=%d e0=%d",b3,b2,b1,b0,e3,e2,e1,e0);
  end
  initial begin
    b3=0;b2=0;b1=0;b0=0;
    #20
    b3=0;b2=0;b1=0;b0=1;
    #20
    b3=0;b2=0;b1=1;b0=0;
    #20
    b3=0;b2=0;b1=1;b0=1;
    #20
    b3=0;b2=1;b1=0;b0=0;
    #20
    b3=0;b2=1;b1=0;b0=1;
    #20
    b3=0;b2=1;b1=1;b0=0;
    #20
    b3=0;b2=1;b1=1;b0=1;
    #20
    b3=1;b2=0;b1=0;b0=0;
    #20
    b3=1;b2=0;b1=0;b0=1;
    #20
    $finish;
  end
endmodule
