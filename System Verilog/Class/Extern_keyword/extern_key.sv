class cls;
  int data=8'hae;
  string name="SPEED";
  extern function display();
endclass
    function cls::display();
      $display("dat is %0d and name is %0s",data,name);
    endfunction
    
    module top;
      cls c1;
      initial begin
        c1=new();
        c1.display;
      end
    endmodule
      
