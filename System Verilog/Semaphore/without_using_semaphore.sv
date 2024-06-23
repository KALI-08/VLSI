//example without using semaphore
//here read task done before write task

module semaphore;
  task write;
    $display("time=%0d Before write start",$time);
    #5
    $display("time=%0d After write completed",$time);
  endtask
  task read;
    $display("time=%0d Before read start",$time);
    #3
    $display("time=%0d After read is completed",$time);
  endtask
  initial begin
    fork
      write;
      read;
    join
  end
endmodule
