module disable_task;
  task process_a;
    $display("\t process_a is initiated",$time);
    #10
    $display("\t process_a is completed",$time);
  endtask
  task process_b;
    $display("\t process_b is initiated",$time);
    #5
    $display("\t process_b is completed",$time);
  endtask
  initial begin
    fork
      process_a;
      disable process_b;
    join
  end
endmodule
