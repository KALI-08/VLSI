module ring_counter_tb ; 
  parameter WIDTH=4;  
  reg clk;  
  reg reset;  
  wire [WIDTH-1:0]out;  
  ring_counter ring_counter(.clk(clk),.reset(reset),.out(out));  
  initial begin
    
    $dumpfile("ring_counter.vcd");
    $dumpvars(1,ring_counter_tb);
    $monitor("t=%d reset=%b clk=%b out=%b",$time,reset,clk,out);
  end
  initial begin  
    {clk,reset} <= 0;   
    repeat(2) @(posedge clk);  
    reset<=1;  
    repeat(15) @(posedge clk);  
    $finish;  
  end  
always #10 clk=~clk;  
endmodule 
