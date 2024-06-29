module top;
  bit[2:0]a;
  bit[2:0]b;
  bit[2:0]c;
  bit[2:0]d;
  logic[2:0]e;
  initial begin
    std::randomize(a);
    $display("value of a = %0d",a);
    std::randomize(b) with {b>5;};
    $display("value of b = %0d",b);
    std::randomize(c,d) with {c<5;d>6;};
    $display("value of c = %0d and d = %0d",c,d);
    std::randomize(e) with {e inside {[4:6]};};
    $display("value of e = %0d",e);
  end
endmodule
