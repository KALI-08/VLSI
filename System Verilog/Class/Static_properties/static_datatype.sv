class static_ex;
  byte data;
  static byte name;
   
  function new();
    name++;
    data=name;
  endfunction
  function display();
    $display("value in data = %0d",data);
  endfunction
endclass
  
  module top;
    static_ex st[5];
    initial begin
      
      foreach(st[i]) begin
        st[i]=new();
        st[i].display;
      end
    end
  endmodule
