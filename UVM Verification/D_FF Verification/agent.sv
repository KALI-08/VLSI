class agent extends uvm_agent;
  `uvm_component_utils(agent)
  
  driver dr;
  monitor mon;
  sequencer sqr;
  
  function new(string name="agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("AGT","constructor",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dr=driver::type_id::create("driver",this);
    mon=monitor::type_id::create("monitor",this);
    sqr=sequencer::type_id::create("sequencer",this);
    `uvm_info("AGT","build_phase",UVM_MEDIUM)
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGT","connect",UVM_MEDIUM)
    dr.seq_item_port.connect(sqr.seq_item_export);
  endfunction
endclass
    
