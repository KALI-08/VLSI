class example;
  int a;
  bit[3:0]b;
  logic[3:0]c;
  constraint c1{a>8;a<20;}
  function display();
    if(randomize(a))
      $display("randomize(a):%0d",a);
    if(std::randomize(b))
      $display("std::randomize(b):%0d",b);
    if(std::randomize(b,c))
      $display("std::randomize(b,c):%0d",b,c);
    if(randomize(a)with{a>10;a<15;})
      $display("randomize(a):%0d",a);
    if(std::randomize(b,c)with{b>5;b<10;c>2;c<5;})
      $display("std::randomize(b,c):%0d",b,c);
  endfunction
endclass

module top;
  initial begin
    example ex=new();
    ex.display();
  end
endmodule
