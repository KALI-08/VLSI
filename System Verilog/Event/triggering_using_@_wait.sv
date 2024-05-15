module event_ex;
  event e1;
  
  task process_A;
    //#10
    $display("------------------------------");
    $display("time=%0d Before event trigger",$time);
    ->e1;
    $display("------------------------------");
    $display("time=%0d After event trigger",$time);
    $display("------------------------------");
  endtask
  
    
  task process_B;
    $display("------------------------------");
    $display("time=%0d Waiting for event trigger using '@'",$time);
    @e1;
    $display("------------------------------");
    $display("time=%0d Event is triggered using '@'",$time);
  endtask
  
  task process_C;
    //#10
    $display("------------------------------");
    $display("time=%0d Waiting for event trigger using 'wait'",$time);
    //@e1;
    wait(e1.triggered);
    $display("time=%0d Event is triggered using 'wait'",$time);
    $display("------------------------------");
  endtask
  
  initial begin
    fork
    process_A;
    process_B;
    process_C;
    join
  end
endmodule
