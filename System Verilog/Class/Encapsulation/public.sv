class A;
  bit [3:0]a;
  bit [3:0]b;
  
  function display1();
    a=4; b=10;
    $display("a--%0d b--%0d",a,b);
  endfunction
endclass

class B extends A;
  function display();
    a=15;
    b=3;
    $display("a--%0d b--%0d",a,b);
  endfunction
endclass

module ex;
  B bb;
  initial begin
    bb=new();
    bb.display();
    bb.display1();
  end
endmodule
