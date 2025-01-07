class alu_driver extends uvm_driver #(alu_transaction);
  `uvm_component_utils(alu_driver)
  
  alu_transaction txn;  
  virtual alu_if vintf;
  

  function new(string name, uvm_component parent);
        super.new(name, parent);
      `uvm_info("DRV","const",UVM_MEDIUM)
    endfunction

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      txn=alu_transaction::type_id::create("txn");
      `uvm_info("DRV","build",UVM_MEDIUM)
      if (!uvm_config_db#(virtual alu_if)::get(this, "", "vintf", vintf)) begin
             `uvm_error("DRV_IF_NOT_SET", "Driver interface not set");
      end
    endfunction

   task run_phase(uvm_phase phase);
     super.run_phase(phase);
    forever begin
      wait(txn.randomize());
        vintf.a = txn.a;
        vintf.b = txn.b;
        vintf.op = txn.op;
        #10;
      $display("DRI: a=%0d b=%0d op=%0d ",vintf.a,vintf.b,vintf.op);
    end
     `uvm_info("DRV","run",UVM_MEDIUM)
endtask
endclass
