module d_ff_tb;
reg D,clk,reset ; 
wire q;
  d_ff d_ff(.D(D),.clk(clk),.reset(reset),.q(q));
initial begin
  $dumpfile("d_ff.vcd");
  $dumpvars(1,d_ff_tb);
  $monitor(" t=%d D=%b clk=%b reset=%b q=%b",$time,D,clk,reset,q);
end
initial begin
  clk=0;
  reset=1;
  D=0;
  #5reset=0;
  #40
  $finish;
end
always #5 clk = ~clk;
always #10 D = ~D;
endmodule
