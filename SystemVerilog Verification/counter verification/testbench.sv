`include "interface.sv"
`include "test.sv"


module counter_test;
  dfftest test;
  mailbox mail;
  mailbox m1;
  operation intf();
  bcd_counter inst(.clk(intf.clk),.reset(intf.reset),.out(intf.out));
  initial begin
    mail=new();
    test=new(intf,mail,m1);
    fork
      test.memory;
      test.run;
    join
  end
  initial begin
    intf.clk=1'b1;
    //forever #10 intf.clk=~intf.ckl;
  end
  initial begin
    intf.reset=1;
    #12;
    intf.reset=0;
    #400;
    $finish;
  end
  initial begin
    $monitor("time=%0d clk=%0b reset=%0b out=%0d",$time,intf.clk,intf.reset,intf.out);
  end
  always #10 intf.clk=~intf.clk;
endmodule
