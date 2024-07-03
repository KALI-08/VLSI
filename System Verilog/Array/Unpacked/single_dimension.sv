module unpacked;
  byte a[7:0];
  initial begin
    foreach(a[i]) begin
      a[i]=$random;
    end
    foreach(a[i]) begin
      $display("a[%0d]=%0p",i,a[i]);
    end
  end
endmodule
