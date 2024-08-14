class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item)
  
  logic clk;
  logic rst;
  rand logic d;
  logic q;
  
  function new(string name="seq_item");
    super.new(name);
    `uvm_info("SEQ_ITEM","constructor",UVM_MEDIUM)
  endfunction
  
endclass
