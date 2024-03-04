module factorial(input reg[3:0]a,output reg [20:0]fact);
 integer i;
  always @(*) begin
  fact=1;
    for( i=a;i>0;i=i-1)begin
      fact=fact*i;
    $display("The factorial value is=%d",fact);
    end
    end
endmodule
