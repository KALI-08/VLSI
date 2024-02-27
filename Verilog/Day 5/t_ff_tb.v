module t_ff_tb;
  reg t,clk;
  wire q;
  t_ff t_ff(.t(t),.clk(clk),.q(q));
initial begin
  $dumpfile("t_ff.vcd");
  $dumpvars(1,t_ff_tb);
  $monitor(" t=%d t=%b clk=%b q=%b",$time,t,clk,q);
end
  initial begin
    clk=0;
    t=0;
    #20
    $finish;
  end
always #2 clk= ~clk;
always #4t= ~t;
endmodule
