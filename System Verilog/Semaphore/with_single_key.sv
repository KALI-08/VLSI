module semaphore;
  semaphore sem=new(1);
  task write;
    sem.get();
    $display("time=%0d Before write start",$time);
    #8
    $display("time=%0d After write completed",$time);
    sem.put();
  endtask
  task read;
    sem.get();
    $display("time=%0d Before read start",$time);
    #5
    $display("time=%0d After read completed",$time);
    sem.put();
  endtask
  initial begin
    fork
      write;
      read;
    join
  end
endmodule
