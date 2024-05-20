class packet;
  rand bit [2:0]addr;
  constraint addr_range{addr dist{5 := 3, 6 := 8};}
endclass

module example;
  packet pkt;
  initial begin
    pkt=new();
    repeat(10) begin
      pkt.randomize;
      $display("Value of addr=%0d",pkt.addr);
    end
  end
endmodule
