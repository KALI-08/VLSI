module bcd_counter_tb;
  reg clk,reset;
  wire [7:0]out;
  bcd_counter bcd_counter(.clk(clk),.reset(reset),.out(out));
  initial begin
    $monitor("t=%d clk=%b reset=%b out=%d",$time,clk,reset,out);
  end
  initial begin
    reset=1;
    clk=0;
    #5reset=0;
    #100
    $finish;
  end
  always #5 clk=~clk;
endmodule
