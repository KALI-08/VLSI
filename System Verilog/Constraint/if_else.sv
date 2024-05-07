class example;
   rand bit [2:0]data;
   rand bit [2:0]value;
  
  constraint c1{if(value==5)data<3;
                else data>3;
               }
  
endclass

module sample;
  example ex;
  initial begin
    ex=new();
    repeat(10) begin
    ex.randomize();
      $display("---------------------------------");
      $display("data=%0d  value=%0d",ex.data,ex.value);
    end
  end
endmodule
