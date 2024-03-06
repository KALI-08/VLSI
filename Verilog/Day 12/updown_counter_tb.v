module updown_counter_tb;
  reg clk,reset,updown;
  wire [3:0]out;
  updown_counter udc(.clk(clk),.reset(reset),.out(out),.updown(updown));
  initial begin
    $dumpfile("updown_counter.vcd");
    $dumpvars(1,updown_counter_tb);
    $monitor("t=%d reset=%b clk=%b out=%d",$time,reset,clk,out);
  end
  always #5 clk=~clk;
  initial begin
    reset=1;
    clk=0;
    updown=1;
    #5reset=0;
    
    #150
     reset=1;
    clk=0;
    updown=0;
    #5reset=0;
    
    #150
    $finish;
  end
  
endmodule
