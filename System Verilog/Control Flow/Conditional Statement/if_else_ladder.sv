module ifelse_ladder;
  int a,b,c;
  initial begin
    a=11;
    b=20;
    c=1;
    $display("a=%0d   b=%0d    c=%0d",a,b,c);
    if(a>b) begin
      $display("a is greater than b");
    end
    else if(c<a) begin
      $display("c is less than a");
    end
    else begin
      $display("out of statement");
    end
  end
endmodule
      
