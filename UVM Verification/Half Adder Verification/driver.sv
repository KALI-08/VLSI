class driver extends uvm_driver#(seq_item);
  `uvm_component_utils(driver)
  
  seq_item tx;
  virtual ha_intf intf;
  
  function new(string name="driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("DRV","constructor",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    `uvm_info("DRV","build_phase",UVM_MEDIUM)
    if(!uvm_config_db#(virtual ha_intf)::get(this,"","vif",intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    seq_item_port.get_next_item(tx);
    driv(tx);
    seq_item_port.item_done();
    `uvm_info("DRV","run_phase",UVM_MEDIUM)
  endtask
  
  task driv(seq_item tx);
    intf.a <= tx.a;
    intf.b <= tx.b;
    intf.sum <= tx.sum;
    intf.carry <= tx.carry;
  endtask
endclass
