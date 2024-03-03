module clock(
  output reg clock);
  initial begin
    clock=0;
    #2 clock=1;
    #2 clock=0;
    #2 clock=1;
    #10 $finish;
    end
  initial begin
    $monitor("clock=%d",clock);
  end ;
endmodule
