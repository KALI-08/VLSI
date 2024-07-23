class parent;
  int a=5;
  virtual function void display();
    $display("This is parent class");
    $display("a=%0d",a);
  endfunction
endclass

class child1 extends parent;
  int b;
  function void display();
    b=3;
    a=2;
    $display("This is child 1");
    $display("b=%0d a=%0d",b,a);
  endfunction
endclass

class child2 extends parent;
  int c;
  function void display();
    c=10;
    a=11;
    $display("This is child 2");
    $display("c=%0d a=%0d",c,a);
  endfunction
endclass

module example;

  parent p[1:0];
  child1 c1;
  child2 c2;
  initial begin

    c1=new();
    p[0]=c1;
    p[1]=new();
    p[0].display();
    p[1].display();
  end
    
endmodule
  
