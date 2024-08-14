class environment extends uvm_env;
  `uvm_component_utils(environment)
  
  scoreboard sb;
  agent agt;
  
  function new(string name="environment",uvm_component parent);
    super.new(name,parent);
    `uvm_info("ENV","constructor",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV","build phase",UVM_MEDIUM)
    agt=agent::type_id::create("agt",this);
    sb=scoreboard::type_id::create("sb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV","connect phase",UVM_MEDIUM)
agt.mon.item_collected_port.connect(sb.item_collected_export);
  endfunction
endclass
