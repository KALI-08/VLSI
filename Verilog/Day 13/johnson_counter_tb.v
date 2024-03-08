module johnson_counter_tb;
  parameter N=4;
  reg clk,reset;
  wire [N-1:0] out;
  johnson_counter dut(.clk(clk),.reset(reset),.out(out));
  always #10 clk=~clk;
  initial begin
    $dumpfile("johnson_counter.vcd");
    $dumpvars(1,johnson_counter_tb);
    clk=0;
    reset=0;
    #50
    reset=1;
    #200
    $finish;
  end
  always @(*)
    $monitor ("t=%d clk=%b reset=%b out=%b",$time,clk,reset,out);
endmodule
