module half_sub_tb;
  reg a,b;
  wire dif,bar;
  half_sub halfsub(.a(a),.b(b),.dif(dif),.bar(bar));
  initial begin
    $dumpfile("half_sub.vcd");
    $dumpvars(1,half_sub_tb);
    $monitor ("a=%0d b=%0d dif=%0d bar=%0d",a,b,dif,bar);
  end
  initial begin
    a=0;b=0;
    #15
    a=0;b=1;
    #15
    a=1;b=0;
    #15
    a=1;b=1;
    #15
    $finish;
  end
endmodule
