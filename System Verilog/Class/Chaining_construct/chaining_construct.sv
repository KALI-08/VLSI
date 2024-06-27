class chaining;
  int a;
  function new();
    a=5;
  endfunction
  extern function display();
    endclass
    
    class construct extends chaining;
      int b;
      function new();
        b=10;
      endfunction
      extern function display();
        endclass
        
        function chaining::display();
          $display("a is %0d",a);
        endfunction
        
        function construct::display();
          $display("b is %0d",b);
        endfunction
        
        module top;
          construct c1;
          initial begin
            c1=new();
            c1.display();
          end
        endmodule
