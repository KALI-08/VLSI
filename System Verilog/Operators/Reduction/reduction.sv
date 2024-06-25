module reduction;
  bit[3:0] a,c;
  initial begin
    a=4'b0011;
    $display("Value of a=%0b",a);
    c=|a;
    $display("Value of c=%0b",c);
    c=&a;
    $display("Value of c=%0b",c);
    c=~|a;
    $display("Value of c=%0b",c);
    c=^a;
    $display("Value of c=%0b",c);
    c=~^a;
    $display("Value of c=%0b",c);
    c=~&a;
    $display("Value of c=%0b",c);
  end
endmodule
