class data;
  const int a;
  string name;
  function new();
    a=5;
    name="XYZ";
  endfunction
  function void display();
    $display("a is =%0d and name is %0s",a,name);
  endfunction
endclass
    
   
    module top;
      data in;
      initial begin
        in=new();
        //in.a=7;
        in.display();
      end
    endmodule
