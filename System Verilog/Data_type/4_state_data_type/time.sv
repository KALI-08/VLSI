module time_ex;
  time clk;
  initial begin
    
    $display("default of time = %0d",$time);
    #5
    $display("time = %0d",$time);
    #10
    
    $display("value of clk =%0d",$time);
  end
endmodule
