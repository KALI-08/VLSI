class pr_a;
  const int b=1;
  string name;
  function new();
    name="ABC";
  endfunction
  
  function void display();
    $display("bis %0d  name is %0s",b,name);
  endfunction
  
endclass

module top;
  pr_a p1;
  initial begin
    p1=new();
   // p1.b=8;
    p1.display();
  end
endmodule
