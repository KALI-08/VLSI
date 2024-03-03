module clock(
  output reg clock);
  initial begin
    clock=0;
    
    #10 $finish;
    end
  initial begin
    $monitor("clock=%d",clock);
    forever #2clock=~clock;
  end ;
endmodule
