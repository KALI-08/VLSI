class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  uvm_analysis_imp#(seq_item,scoreboard)
  item_collected_export;
  seq_item tx_q[$];
  
  function new(string name="scoreboard",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SB","constructor",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export=new("item_collected_export",this);
    `uvm_info("SB","build_phase",UVM_MEDIUM)
  endfunction
  
  
  virtual function void write(seq_item tx);
    tx_q.push_back(tx);
  endfunction
endclass
