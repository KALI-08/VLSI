module repeat_ex;
  initial begin
    repeat_call;
  end
  
  task repeat_call;
    repeat(5) begin
      $display("example for repeat");
    end
  endtask
endmodule
