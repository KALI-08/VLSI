class example;
  rand bit [7:0] data;
  rand bit [7:0] value;
  
  constraint c1{data==((value>25)?10:20);}
endclass

module sample;
  example ex;
  initial begin
    ex=new();
    repeat(10) begin
      ex.randomize();
      $display("------------------------------");
      $display("data=%0d   value=%0d",ex.data,ex.value);
    end
  end
endmodule
