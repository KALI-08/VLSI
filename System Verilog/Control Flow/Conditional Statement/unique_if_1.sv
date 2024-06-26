module unique_if;
  bit[15:0]a;
  byte b;
  initial begin
    $display("size of a=%0d",$size(a));
    $display("size of b=%0d",$size(b));
    $display("--------------------------");
    unique if($size(a)>$size(b)) begin
      $display("inside unique block");
      $display("a is greater than b");
    end
    else if($size(a)==$size(b)) begin
      $display("inside 1st else if block");
      $display("a is equal to b");
    end
    else begin
      $display("out of statement");
    end
  end
endmodule
