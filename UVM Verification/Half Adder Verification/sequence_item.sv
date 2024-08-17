class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item)
  
  rand logic a;
  rand logic b;
  logic sum;
  logic carry;
  
  function new(string name="seq_item");
    super.new(name);
    `uvm_info("SEQ_ITEM","constructor",UVM_MEDIUM)
  endfunction
  
endclass
