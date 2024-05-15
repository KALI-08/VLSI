module event_ex;
  event e1;
  
  task process_A;
    #10
    $display("------------------------------");
    $display("Before event trigger");
    ->e1;
    $display("------------------------------");
    $display("After event trigger");
    $display("------------------------------");
  endtask
  
  task process_B;
    //#10
    $display("------------------------------");
    $display("Waiting for event trigger");
    @e1;
    $display("Event is triggered");
    $display("------------------------------");
  endtask
  
  initial begin
    fork
    process_A;
    process_B;
    join
  end
endmodule
