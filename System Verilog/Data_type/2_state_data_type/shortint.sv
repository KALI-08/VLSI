module longint_ex;
  shortint data;
  initial begin
    $display("before value assign =%0d",data);
    data=16'h7DCE;
    $display("after assigning = %0d",data);
    $display("after assigning = %0b",data);
  end
endmodule
