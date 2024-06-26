module simple_task;
  int a=5,b=8,c;
  task mul;
    c=a*b;
  endtask
  initial begin
    mul;
    $display("value in c=%0d",c);
  end
endmodule
