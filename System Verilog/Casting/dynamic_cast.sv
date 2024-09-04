// Code your testbench here
// or browse Examples
class parent;
  string a;
  int i_d=10;
  function display1();
    $display("a=%0s i_d=%0d",a,i_d);
  endfunction
endclass

class child1 extends parent;
  string c;
  function display2();
    a="CHENNAI";
    $display("c=%0s",c);
    display1();
  endfunction
endclass

module example;
  parent p;
  child1 c1,c2;
  initial begin
     p=new();
//     p.display1();
    c1=new();
    c1.c="CBE";
    //c1.display2();
    p=c1;
    $cast(c2,c1);
    c2.display2();
  end
endmodule
