module ripple_counter_tb;
  reg clk,reset;
  wire [3:0]out;
  ripple_counter rc(.clk(clk),.reset(reset),.out(out));
  
  initial begin
    $dumpfile("ripple_counter.vcd");
    $dumpvars(1);
    $monitor("clk=%d reset=%d out=%d", clk, reset, out);
  end
  initial begin
    clk <= 0;
    reset <= 0;
    #10
    reset = 1;
    #20
    reset = 0;
    #10
    reset = 1;
    #30
    $finish;
  end
  always#10 clk=~clk;
endmodule
