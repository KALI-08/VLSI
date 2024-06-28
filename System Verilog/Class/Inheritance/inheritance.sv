class parent;
  int data_1=5;
  function display1();
    $display("value of data_1 is %0d",data_1);
  endfunction
endclass

class child1 extends parent;
  int data_2=4;
  function display2();
    $display("value in data_2 is %0d",data_2);
  endfunction
endclass

class child2 extends parent;
  byte data_3=3;
  function display3();
    $display("value in data_3 is %0d",data_3);
  endfunction
endclass

module top;
  initial begin
    parent p=new();
    child1 c1=new();
    child2 c2=new();
    c2.display3();
    c1.display2();
    p.display1();
    c2.data_1=7;
    c2.display1();
  end


endmodule
