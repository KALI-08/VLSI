module addition;
  bit[3:0] value[5];
  int total;
  initial begin
    foreach(value[i])
      value[i]=i;
    $display(value.sum);
    total=value.sum;
    $display(total);
  end
endmodule
