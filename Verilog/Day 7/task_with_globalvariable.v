module example_task;
  integer a;
  task multi (input int x,y);
  
    begin
      a=x*y;
    end
  endtask
  initial begin
    //$display("multi",(3,2,a));
    multi(3,2);
  $display("a=%0d",a);
  end
endmodule
