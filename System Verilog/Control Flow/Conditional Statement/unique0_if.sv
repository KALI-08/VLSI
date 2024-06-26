module unique0_if;
  bit[15:0]a;
  byte b;
  initial begin
    a=12;
    b=10;
    $display("a=%0d",a);
    $display("b=%0d",b);
    $display("--------------------------");
    unique0 if(a<b) begin
      $display("inside unique block");
      $display("a is greater than b");
    end
    else if(a%2==0) begin
      $display("inside 1st else if block");
      $display("a is equal to b");
    end
   // else begin
      $display("out of statement");
   // end
  end
endmodule
