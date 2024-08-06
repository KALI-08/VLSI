`include "uvm_macros.svh"
import uvm_pkg::*;

typedef enum{RED,BLUE,GREEN}colour_type;

class my_object extends uvm_object;
  colour_type c;
  
  function new(string name = "my_object");
    super.new(name);
    `uvm_info("NEW","inside constructor",UVM_LOW)
  endfunction
  
  function void display();
    for(int i=0;i<3;i++) begin
      `uvm_info("object created",$sformatf("colour=%0s",c.name()),UVM_LOW)
      c=c.next();
      end
  endfunction
endclass

module tb;
    my_object mb;
    initial begin
      mb=new();
      mb.display();
    end
endmodule
