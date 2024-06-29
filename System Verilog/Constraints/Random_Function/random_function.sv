module range_ex;
  int a;
  int b;
  int c;
  integer d;
  bit [31:0] e;
  initial begin
    a=$random;
    b=$urandom;
    c=$urandom_range(108,8);
    d=$random(8);
    e=$urandom(24);
    $display("value of a = %0d",a);
    $display("value of b = %0d",b);
    $display("value of c = %0d",c);
    $display("value of d = %0d",d);
    $display("value of e = %0d",e);
  end
endmodule
    
