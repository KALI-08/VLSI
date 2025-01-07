module environment(alu_if en_if);
  
    alu_transaction txn=new();
  alu_transaction mon_txn=new();
    driver drv(en_if);
    monitor mon(en_if);
  scoreboard sb();

  task run(alu_transaction txn);
        drv.drive(txn);
    
        mon.monitor_output(mon_txn);
        sb.compare(mon_txn);
    endtask
endmodule
