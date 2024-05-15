module nonblocking_event;
  event e1;
  
  task process_A;
    $display("time=%0d Event before trigger",$time);
    ->>e1;
    $display("time=%0d Event after trigger",$time);
  endtask
  
  task process_B;
    $display("time=%0d Waiting for triggering",$time);
    @e1;
    $display("time=%0d Event e1 is triggered",$time);
  endtask
  
  initial begin
    fork
      process_A;
      process_B;
    join
  end
endmodule
