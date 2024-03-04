module factorial_tb;
  reg [3:0]a;
  wire [20:0]fact;
  factorial b(a,fact);
  initial begin
    $dumpfile("factorial.vcd");
    $dumpvars(1);
   end
  initial begin
      #4 a=9;
      $display("a=%d ",a);
      #35 $finish;
  end
endmodule
