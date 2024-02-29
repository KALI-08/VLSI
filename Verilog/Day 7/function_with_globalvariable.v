module example_task;
  integer a;
  function multi (input int x,y);
  
    begin
      a=x*y;
    end
  endfunction
  initial begin
    //$display("multi",(3,2,a));
    multi(3,2);
  $display("a=%0d",a);
  end
endmodule
