module reg_ex;
  reg[2:0] value;
  initial begin
    $display("default value = %0d",value);
    value = 3'b101;
    $display("value is %0d",value);
  end
endmodule
