module foreach_ex;
  int array[10];
  initial begin
    foreach(array[i]) begin
      array[i]=i;
      $display("count of array=%0d",i);
    end
  end
endmodule
