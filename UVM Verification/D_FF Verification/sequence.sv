class seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(seq)
  
  seq_item tx;
  
  function new(string name="seq");
    super.new(name);
    `uvm_info("seq","constructor",UVM_MEDIUM)
  endfunction
  
  task body();
    repeat(5) begin
    `uvm_info("seq","body",UVM_MEDIUM)
    tx=seq_item::type_id::create("tx");
    `uvm_do(tx)
    end
  endtask
endclass
