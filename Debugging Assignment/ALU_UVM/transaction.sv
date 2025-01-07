class alu_transaction extends uvm_sequence_item;
  `uvm_object_utils(alu_transaction)
  rand bit [3:0] a, b;
    rand bit [1:0] op;
  bit [3:0] expected_result;

    function new(string name = "alu_transaction");
        super.new(name);
      `uvm_info("TEST","CONSTRUCT",UVM_MEDIUM)
      $display("TRANS: a=%0d b=%0d op=%0d expected_result=%0d",a,b,op,expected_result);
    endfunction

endclass
