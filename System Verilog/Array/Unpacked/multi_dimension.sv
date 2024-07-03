module unpacked;
  byte a[7:0][2:0];
  initial begin
    foreach(a[i]) begin
    foreach(a[i][j]) begin
      a[i][j]=$random;
    
      $display("a[%0d][%0d]=%0p",j,i,a[i][j]);
    end
    end
    $display("a=%0p",a);
  end
endmodule
