module mealy_11011_tb;
  reg clk,reset;
  reg in;
  wire [2:0]present,next;
  wire out;
  mealy_11011 mealy_11011(.clk(clk),.reset(reset),.in(in),.present(present),.next(next),.out(out));
  initial begin
    in=1;
    reset=1;
    clk=1;
    #5 reset=0;
  end
  initial begin
    #10
    in=1'b1;
    #10
    in=1'b1;
    #20
    in=1'b0;
    #20
    in=1'b1;
    #10
    in=1'b1;
    #100
    $finish;
  end
   initial begin
    $monitor("t=%d reset=%b clk=%b in=%b present=%b next=%b out=%b",$time,reset,clk,in,present,next,out);
  end
  always #10 clk=~clk;
endmodule
    
