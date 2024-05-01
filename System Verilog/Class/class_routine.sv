class bustran;
  bit [7:0]addr;
  string name;
  
  function new();
    addr=8'h23;
    name="ABCD";
  endfunction
  
  function void display();
    $display("addr=%0d name=%0s",addr,name);
  endfunction
  
endclass

class pcitran;
  bit [7:0]addr;
  string name;
  
  function new();
    addr=8'h12;
    name="EFGH";
  endfunction
  
  function void display();
    $display("addr=%0d name=%0s",addr,name);
  endfunction
  
endclass

module class_ex;
  bustran b;
  pcitran pc;
  initial begin
    b=new();
    b.display();
    pc=new();
    pc.display;
  end
endmodule
