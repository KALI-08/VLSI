module integer_ex;
  integer value;
  initial begin
    $display("default value = %0d",value);
    value = 32'h6ab9cdef;
    $display("value is %0d",value);
  end
endmodule
