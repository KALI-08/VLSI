//we can create any number of sem but with or within that we can get key at 1st process
//eg: 5 keys created write can get 5 or within 5 keys only not more than 5 but it can put more than that eg:7
//same as upcoming process



module semaphore;
  semaphore sem=new(5);
  task write;
    sem.get(5);
    $display("time=%0d Before write start",$time);
    #8
    $display("time=%0d After write completed",$time);
    sem.put(7);
  endtask
  task read;
    sem.get(7);
    $display("time=%0d Before read start",$time);
    #5
    $display("time=%0d After read completed",$time);
    sem.put(10);
  endtask
  initial begin
    fork
      write;
      read;
    join
  end
endmodule
