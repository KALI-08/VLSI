module unique_if;
  bit[15:0]a;
  byte b;
  initial begin
    a=12;
    b=10;
    $display("a=%0d",a);
    $display("b=%0d",b);
    $display("--------------------------");
    priority if(a>b) begin
      $display("inside priority block");
      $display("a is greater than b");
    end
    else if(a%2==0) begin
      $display("inside 1st else if block");
      $display("a modulo 2 is 0");
    end
   // else begin
      $display("out of statement");
   // end
  end
endmodule
