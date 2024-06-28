module real_ex;
  real value;
  initial begin
    $display("edfault value of real = %0d",value);
   
    value=9.84;
    $display("after assigning the value = %0f",value);
  end
endmodule
