class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
   virtual ha_intf intf;
  seq_item tx;
  uvm_analysis_port#(seq_item)item_collected_port;
  
  function new(string name="monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("MON","constructor",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MON","build phase",UVM_MEDIUM)
    item_collected_port=new("item_collected_port",this);
    if(!uvm_config_db#(virtual ha_intf)::get(this,"","vif",intf))
       `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    tx=seq_item::type_id::create("tx");
    tx.a <= intf.a;
    tx.b <= intf.b;
    tx.sum <= intf.sum;
    tx.carry <= intf.carry;
  endtask
endclass
  
  
