module prime_check(
  input reg [7:0]a);
  always @(*) begin
    if((a==2)||(a%2==1)&&(a%3==1)||(a%3==2))
    $display("prime number");
      else 
        $display("not prime number");
    end
endmodule
