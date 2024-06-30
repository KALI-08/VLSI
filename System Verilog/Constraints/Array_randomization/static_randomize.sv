class static_rand;
  rand byte a[8];
endclass
module ex;
  static_rand sr;
  initial begin
    sr=new();
    sr.randomize();
    $display("a:%0p",sr.a);
  end
endmodule
