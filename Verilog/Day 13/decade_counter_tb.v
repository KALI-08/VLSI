module decade_counter_tb;
  parameter N=4;
  reg clk, reset;
  wire [N-1:0]out;
  decade_counter decade_counter(.clk(clk),.reset(reset),.out(out));
   initial begin 
    $dumpfile("decade_counter.vcd");
    $dumpvars(1,decade_counter_tb);
    $monitor("clk=%d reset=%d out=%d", clk, reset, out);
  end
  
   initial begin
      clk = 0;
      reset = 1;
      #20
      reset = 0;
      #200
      $finish;
    end
   always #10 clk =~clk;
endmodule
