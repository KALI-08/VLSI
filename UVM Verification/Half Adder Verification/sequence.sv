class sequenc extends uvm_sequence#(seq_item);
  `uvm_object_utils(sequenc)
  
  seq_item tx;
  
  function new(string name="sequenc");
    super.new(name);
    `uvm_info("SEQ","constructor",UVM_MEDIUM)
  endfunction
  
  task body();
    repeat(5) begin
      
    tx=seq_item::type_id::create("tx");
      wait_for_grant();
      tx.randomize();
      send_request(tx);
      wait_for_item_done();
      `uvm_info("SEQ","body",UVM_MEDIUM)
    end
  endtask
endclass
