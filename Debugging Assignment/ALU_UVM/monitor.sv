class alu_monitor extends uvm_monitor;
  `uvm_component_utils(alu_monitor)
    virtual alu_if vintf;
  alu_transaction txn;

  function new(string name, uvm_component parent);
        super.new(name, parent);
      `uvm_info("MON","const",UVM_MEDIUM)
    endfunction
  
  function void build_phase(uvm_phase phase);
    `uvm_info("MON","build",UVM_MEDIUM)
    if (!uvm_config_db#(virtual alu_if)::get(this, "", "vintf", vintf)) begin
            `uvm_fatal("DRV_IF_NOT_SET", "Driver interface not set");
    end

    endfunction

    
    task run_phase(uvm_phase phase);
      super.run_phase(phase);
      `uvm_info("MON","run",UVM_MEDIUM)
        forever begin
           txn = alu_transaction::type_id::create("txn",this);
            txn.a = vintf.a;
            txn.b = vintf.b;
            txn.op = vintf.op;
            txn.expected_result = vintf.result;

            #10;
          $display("MON: a=%0d b=%0d op=%0d result=%0d ",txn.a,txn.b,txn.op,txn.expected_result);
        end
    endtask
endclass
