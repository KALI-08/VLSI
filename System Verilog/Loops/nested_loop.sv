module nested_loop;
  initial begin
    $display("nested loop before started");
    for(int i=0;i<2;i++) begin
      $display("nested loop started");
      $display("before second loop");
      for(int j=0;j<5;j++) begin
        $display("inside second loop");
      end
    end
    $display("ended from both loop");
  end
endmodule
