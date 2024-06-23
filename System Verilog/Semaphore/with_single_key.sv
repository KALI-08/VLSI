module semaphore;
  semaphore sem=new(1);
  task write;
    sem.get();
    $display("Before write start");
    #8
    $display("After write completed");
    sem.put();
  endtask
  task read;
    sem.get();
    $display("Before read start");
    #5
    $display("After read completed");
    sem.put();
  endtask
  initial begin
    fork
      write;
      read;
    join
  end
endmodule
