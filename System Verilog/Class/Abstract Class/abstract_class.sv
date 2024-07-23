 virtual class parent;
  int a=5;
  function void display();
    $display("This is parent class");
    $display("a=%0d",a);
  endfunction
endclass

class child extends parent;
  int b;
  function display1();
    b=11;
    $display("b=%0d",b);
  endfunction
endclass
  

module example;
  child c;
  initial begin
    c=new();
    c.display();
    c.display1();
  end
 
    
endmodule
  
