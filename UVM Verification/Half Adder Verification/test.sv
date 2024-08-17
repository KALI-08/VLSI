class ha_test extends uvm_test;
  `uvm_component_utils(ha_test)
  
  environment env;
  sequenc s;
  
  function new(string name="dff_test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("TEST","constructor",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST","build phase",UVM_MEDIUM)
    env=environment::type_id::create("env",this);
    s=sequenc::type_id::create("s",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST","connect phase",UVM_MEDIUM)
   // print();
  endfunction
  
  virtual function void end_of_elaboration;
    `uvm_info("TEST","elob phase",UVM_MEDIUM)
    print();
  endfunction
  
  task run_phase(uvm_phase phase);
    `uvm_info("TEST","run phase",UVM_MEDIUM)
    phase.raise_objection(this);
    s.start(env.agt.sqr);
    phase.drop_objection(this);
  endtask
  
endclass
