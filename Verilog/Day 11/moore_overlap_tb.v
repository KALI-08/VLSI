module moore_101_tb;
  reg in,clk,reset;
  wire out;
  wire [1:0]present,next;
  moore_101 moore_101(.in(in),.clk(clk),.reset(reset),.out(out),.present(present),.next(next));
  initial begin
    $dumpfile("moore_101.vcd");
    $dumpvars(1,moore_101_tb);
    $monitor("t=%d reset=%b clk=%b in=%b present=%b next=%b out=%b",$time,reset,clk,in,present,next,out);
  end
  initial begin
    in=1;
    reset=1;
    clk=1;
    #5 reset=0;
  end
  initial begin
   #10 in=1'b1;
    #10
    in=1'b0;
    #20
    in=1'b1;
    #40
    in=1'b0;
    #20
    in=1'b1;
    #200
    $finish;
  end
  always #10 clk=~clk;
endmodule
