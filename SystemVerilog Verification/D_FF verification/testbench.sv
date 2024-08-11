`include "dfftest.sv"
`include "interface.sv"

module dff_test;
  dfftest test;
  mailbox mail;
  operation intf();
  dff inst(
    .clk(intf.clk),
    .rst(intf.rst),
    .d(intf.d),
    .q(intf.q));
  
 // bit clk, rst, d, q;
  
  initial begin
    mail=new();
    test=new(intf,mail);
    fork
      test.memory;
      test.run;
    join
  end
  initial begin
    intf.clk=1'b1;
    forever #10 intf.clk=~intf.clk;
  end
  initial begin
    intf.rst=1;
    #12;
    intf.rst=0;
    #40;
    $finish;
  end
  initial begin
    $monitor("time %t clk-- %b rst-- %b d-- %b q-- %b",$time,intf.clk,intf.rst,intf.d,intf.q);
  end
endmodule
