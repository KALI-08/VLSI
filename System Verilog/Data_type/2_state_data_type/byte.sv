module bit_ex;
  byte data;
  initial begin
    $display("value of data before assigning = %0d",data);
    data=8'b01001011;
    $display("value of data after assigning = %0d",data);
     data=8'b11001011;
    $display("\n value of data in binary after assigning = %0b",data);
    $display("\n value of data decimal in 2s complementafter assigning = %0d",data);
  end
endmodule
