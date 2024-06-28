class static_ex;
  //byte data;
  static byte name;
   
  function new();
    name++;
    //data=name;
  endfunction
  static function display();
    $display("value in data = %0d",name);
  endfunction
endclass
  
  module top;
    static_ex st[8];
    initial begin
      
      foreach(st[i]) begin
        st[i]=new();
        st[0].display;
      end
    end
  endmodule
