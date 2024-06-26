module if_only;
  bit [3:0]a;
  initial begin
    a=4'b1111;
    $display("Value of a=%0d",a);
    $display("----------------------------");
    if (a==14) begin
      $display("Value of a is correct=%0d",a);
      $display("----------------------------");
    end
    else begin
      $display("Value of a is incorrect");
  end
  end
endmodule
