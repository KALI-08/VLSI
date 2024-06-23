//example without using semaphore
//here read task done before write task

module semaphore;
  task write;
    $display("Before write start");
    #5
    $display("After write completed");
  endtask
  task read;
    $display("Before read start");
    #3
    $display("After read is completed");
  endtask
  initial begin
    fork
      write;
      read;
    join
  end
endmodule
