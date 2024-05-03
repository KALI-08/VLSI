class parent;
  bit [7:0]data;
  function void display();
    $display("parent value of data=%0d",data);
  endfunction
endclass

class child extends parent;
  bit [7:0]data;
  function void display();
    super.data=8;
    super.display;
    $display("child value of data=%0d",data);
  endfunction
endclass

module example;
  child ch;
  initial begin
    ch=new();
    ch.data=5;
    ch.display;
  end
endmodule
