`include "hatest.sv"
`include "interface.sv"

module half_adder_tb;
  hatest test;
  operation intf();
  mailbox mail;
  
  half_adder inst(.a(intf.a),.b(intf.b),.sum(intf.sum),.carry(intf.carry));
  
  initial begin
    mail=new();
    test=new(intf,mail);
    fork
      test.run;
      test.memory;
    join
  end
  initial
    $monitor("a=%0b b=%0b sum=%0b carry=%0b",intf.a,intf.b,intf.sum,intf.carry);
endmodule
