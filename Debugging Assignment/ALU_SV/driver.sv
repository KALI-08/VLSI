module driver(alu_if dr_if);
  
    task drive (alu_transaction txn);
        dr_if.a = txn.a;
        dr_if.b = txn.b;
        dr_if.op = txn.op;
        #10;
    endtask
endmodule
