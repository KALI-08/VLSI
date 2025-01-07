module test;
   alu_transaction txn;
   
    initial begin
       
        for (int i = 0; i < 10; i++) begin
            txn = new();
            txn.randomize();
            env.run(txn);
        end
        $finish;
    end
endmodule
