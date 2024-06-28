module bit_ex;
  bit[2:0]data;
  initial begin
    $display("value of data before assigning = %0d",data);
    data=3'b110;
    $display("value of data after assigning = %0d",data);
    data=3'bx1z;
    $display("value of data after assigning = %0d",data);
  end
endmodule
