class example;
  rand bit [3:0] data;
  rand bit [3:0] value;
  
  constraint c1{(value>10)->data<3;}
  
endclass

module implication;
  example ex;
  initial begin
    ex=new();
    repeat(15) begin
      ex.randomize();
      $display("--------------------------");
      $display("data=%0d  value=%0d",ex.data,ex.value);
    end
  end
endmodule
