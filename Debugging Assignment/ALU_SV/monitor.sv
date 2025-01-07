module monitor (alu_if mon_if);
  
    task monitor_output(alu_transaction txn);
        txn.a = mon_if.a;
        txn.b = mon_if.b;
        txn.op = mon_if.op;
        txn.expected_result = mon_if.result;
        #10;
    endtask
endmodule
