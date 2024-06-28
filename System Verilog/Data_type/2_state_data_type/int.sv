module int_ex;
  int data;
  initial begin
    $display("before value assign =%0d",data);
    data=32'h0bcdefab;
    $display("after assigning = %0d",data);
    $display("after assigning = %0b",data);
  end
endmodule
