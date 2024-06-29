class example;
  randc bit[3:0] data;
endclass

module randc_ex;
  example ex;
  initial begin
    ex=new();
    $display("randc value of data");
    for(int i=0;i<10;i++) begin
    ex.randomize;
      $display("data=%0d",ex.data);
    end
  end
endmodule
    
