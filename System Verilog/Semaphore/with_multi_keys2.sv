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
  task read_a;
    sem.get(7);
    $display("time=%0d Before read_a start",$time);
    #5
    $display("time=%0d After read_a completed",$time);
    sem.put(10);
  endtask
  task read_b;
    sem.get(14);
    $display("time=%0d Before read_b strat",$time);
    #10
    $display("time=%0d After read_b completed",$time);
    sem.put(15);
  endtask
  initial begin
    fork
      write;
      read_a;
      read_b;
    join
  end
endmodule
