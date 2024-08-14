class sequencer extends uvm_sequencer#(seq_item);
  `uvm_component_utils(sequencer)
  
  function new(string name="sequencer",uvm_component parent);
    super.new(name,parent);
    `uvm_info("sequencer","constructor",UVM_MEDIUM)
  endfunction
  
//   function build_phase(uvm_phase phase);
//     super.build_phase(phase);
//     `uvm_info("sequencer","build_phase",UVM_MEDIUM)
//   endfunction
endclass
