module auto_task;
  int a=8,b=4;
  int result1,result2;
  
  function addition;
    result1=a+b;
    //$display("value in addition=%0d",result1);
  endfunction
  
  task multi;
    addition;
    result2=a*b;
    $display("value in result2=%0d  addition=%0d",result2,result1);
  endtask
  
  initial begin

      
      multi;

  end
endmodule
