module longint_ex;
  longint data;
  initial begin
    $display("before value assign =%0d",data);
    data=64'h0bcdefab_0bcdefab;
    $display("after assigning = %0d",data);
    $display("after assigning = %0b",data);
  end
endmodule
