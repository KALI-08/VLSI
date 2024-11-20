class apb_2_i2c_test extends uvm_test;
   `uvm_component_utils(apb_2_i2c_test)
   
   apb_2_i2c_env env;
   apb_sequence apb_seq;
  function new(string name="apb_2_i2c_test",uvm_component parent);
      super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
    env = apb_2_i2c_env::type_id::create("env",this);
     apb_seq = apb_sequence::type_id::create("apb_seq");
  endfunction

  virtual task run_phase(uvm_phase phase);
     super.run_phase(phase);
     phase.raise_objection(this);
       apb_seq.start(env.apb_agnt.sqr);
       //#500000;
     phase.drop_objection(this);
  endtask
endclass
