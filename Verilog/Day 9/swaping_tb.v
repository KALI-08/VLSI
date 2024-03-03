module swaping_tb;
  reg [7:0]a,b;
  wire [7:0]swaped_a,swaped_b;
  swaping swaping(.a(a),.b(b),.swaped_a(swaped_a),.swaped_b(swaped_b));
  always @(*) begin
    $monitor("a=%d b=%d swaped_a=%d swaped_b=%d",a,b,swaped_a,swaped_b);
  end
  initial begin
   
    repeat(8) begin
      #1;
    a=$random;
    b=$random;
    end
    #15$finish;

  end
endmodule
