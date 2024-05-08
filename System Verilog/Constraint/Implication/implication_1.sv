class example;
  string addr_name;
  rand bit [3:0] addr;
  
  constraint c1{(addr_name=="HIGH") -> (addr>10);}
endclass

module implication;
  example ex;
  initial begin
    ex=new();
    repeat(10) begin
    ex.addr_name="HIGH";
      ex.randomize();
      $display("______________________________");
      $display("addr_name=%0s  addr=%0d",ex.addr_name,ex.addr);
    end
  end
endmodule
