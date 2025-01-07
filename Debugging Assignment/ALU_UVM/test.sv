class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)
    alu_env env;
  alu_transaction txn;

  function new(string name, uvm_component parent);
        super.new(name, parent);
      `uvm_info("TST","const",UVM_MEDIUM)
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = alu_env::type_id::create("env", this);
      `uvm_info("TST","build",UVM_MEDIUM)
    endfunction

    task run_phase(uvm_phase phase);
 	`uvm_info("TST","run",UVM_MEDIUM)
        
                 
      
        phase.raise_objection(this);
      forever begin
        for (int i = 0; i < 10; i++) begin
            txn = alu_transaction::type_id::create("txn");
            env.drv.txn.randomize();
          env.drv.txn.print();

        end
        #150;
        phase.drop_objection(this);
      `uvm_info("TST","run done",UVM_MEDIUM)
      $finish();
      end
    endtask
endclass
