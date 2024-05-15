module fork_join;
  initial begin
    $display("------------------------------");
    fork
      begin
      $display("t=%0d process 1 started",$time);
      #5
      $display("t=%0d process 1 finished",$time);
      end
      begin
      $display("t=%0d process 2 started",$time);
      #10
      $display("t=%0d process 2 finished",$time);
      end
      begin
      $display("t=%0d process 3 started",$time);
      #20
      $display("t=%0d process 3 finished",$time);
      end
    join_none
    disable fork;
    $display("***************************");
    $display("*  fork...join completed  *");
    $display("***************************");
  end
endmodule
        
