module odd(
  input [7:0]a);
  always @(*) begin
    if(a%2==1)
      $display("It is a odd number");
  else
    $display("It is not odd number");
  end
endmodule
  
