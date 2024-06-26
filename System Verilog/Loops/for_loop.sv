module for_loop;
  initial begin
    $display("going inside the loop");
    for(int i=3;i<9;i++) begin
      $display("value of repeated=%0d",i);
    end
    $display("out of the loop");
  end
endmodule
