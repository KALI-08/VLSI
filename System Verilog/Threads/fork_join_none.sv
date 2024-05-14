module fork_join;
  initial begin
    $display("----------------------------");
 // end
  fork
    begin
      $display("t=%0d PROCESS 1 STARTED",$time);
      #10
      $display("t=%0d PROCESS 1 FINISHED",$time);
    end
    begin
      $display("t=%0d PROCESS 2 STARTED",$time);
      #25
      $display("t=%0d PROCESS 2 FINISHED",$time);
    end
   
  join_none
     $display("t=%0d join",$time); 	
    $display("--------------------------------");
  end
endmodule
