module semaphore;
  semaphore sem=new(10);
  task write;
    sem.get(6);
    $display("Before write start");
    #8
    $display("After write completed");
    sem.put(6);
  endtask
  task read;
    sem.get(5);
    $display("Before read start");
    #5
    $display("After read completed");
    sem.put(5);
  endtask
  initial begin
    fork
      write;
      read;
    join
  end
endmodule
