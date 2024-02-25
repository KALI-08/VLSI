module full_sub_tb;
  reg a,b,c;
  wire dif,bar;
  full_sub halfsub(.a(a),.b(b),.c(c),.dif(dif),.bar(bar));
  initial begin
    $dumpfile("full_sub.vcd");
    $dumpvars(1,full_sub_tb);
    $monitor ("a=%0d b=%0d c=%0d dif=%0d bar=%0d",a,b,c,dif,bar);
  end
  initial begin
    a=0;b=0;c=0;
    #15
    a=0;b=0;c=1;
    #15
    a=1;b=1;c=0;
    #15
    a=0;b=1;c=1;
    #15
    a=1;b=0;c=0;
    #15
    a=1;b=0;c=1;
    #15
    a=1;b=1;c=0;
    #15
    a=1;b=1;c=1;
    #15
    $finish;
  end
endmodule
