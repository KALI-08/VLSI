module semaphore;
  semaphore sem=new(10);
  task write;
    sem.get(6);
    $display("time=%0d Before write start",$time);
    #8
    $display("time=%0d After write completed",$time);
    sem.put(6);
  endtask
  task read;
    sem.get(5);
    $display("time=%0d Before read start",$time);
    #5
    $display("time=%0d After read completed",$time);
    sem.put(5);
  endtask
  initial begin
    fork
      write;
      read;
    join
  end
endmodule
