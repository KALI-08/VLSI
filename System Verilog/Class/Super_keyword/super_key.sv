class parent;
  string place,food;
  
  function process1;
    food="abc";
    $display("process1 %0s",food);
  endfunction
  
endclass

class child extends parent;
  string place="xyz";
  
  function process2;
    super.process1;
    $display("process2 %0s",place);
  endfunction
endclass

module top;
  initial begin
    child c1;
    c1=new();
    c1.process2;
  end
endmodule
