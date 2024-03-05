module moore_1010_tb;
  reg in,clk,reset;
  wire out;
  wire [2:0]present,next;
  moore_1010 moore_1010(.in(in),.clk(clk),.reset(reset),.out(out),.present(present),.next(next));
  initial begin
    $dumpfile("moore_1010.vcd");
    $dumpvars(1,moore_1010_tb);
    $monitor("t=%d reset=%b clk=%b in=%b present=%b next=%b out=%b",$time,reset,clk,in,present,next,out);
  end
  initial begin
    //in=1;
    reset=1;
    clk=1;
    #5 reset=0;
  end
  initial begin
    #10in=1'b1;
    #10
    in=1'b0;
    #10
    in=1'b1;
    #10
    in=1'b0;
    #100
    $finish;
  end
  always #5 clk=~clk;
endmodule
