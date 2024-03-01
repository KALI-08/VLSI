module even(
  input [7:0]a);
  always @(*) begin
    if(a%2==0)
      $display("It is a even number");
  else
    $display("It is not even number");
  end
endmodule
