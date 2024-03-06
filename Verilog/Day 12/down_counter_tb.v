module up_counter_tb;
  reg clk,reset;
  wire [3:0]out;
  up_counter up_counter(.clk(clk),.reset(reset),.out(out));
  initial begin
    reset=1;
    clk=0;
    #5 reset=0;
    #200
    $finish;
  end
  initial begin
    $monitor("t=%d reset=%b clk=%b out=%d",$time,reset,clk,out);
  end
  always #5 clk=~clk;
endmodule
