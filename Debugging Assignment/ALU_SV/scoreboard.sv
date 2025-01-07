module scoreboard;
  
    task compare(input alu_transaction txn);
      case(txn.op) 
        0: begin
          $display("op=%0d a=%0d b=%0d",txn.op,txn.a,txn.b);
          if (txn.expected_result == (txn.a+txn.b))
            $display("CORRECT: Expected %d, Got %d", txn.a+txn.b, txn.expected_result);
        else
          $display("Match: %d", txn.expected_result);
        end
        
        1: begin
          $display("op=%0d a=%0d b=%0d",txn.op,txn.a,txn.b);
          if (txn.expected_result == (txn.a-txn.b))
            $display("CORRECT: Expected %d, Got %d", txn.a-txn.b, txn.expected_result);
        else
          $display("Match: %d", txn.a-txn.b);
        end
        
        2: begin
          $display("op=%0d a=%0d b=%0d",txn.op,txn.a,txn.b);
          if (txn.expected_result == (txn.a & txn.b))
            $display("CORRECT: Expected %d, Got %d", txn.a & txn.b, txn.expected_result);
        else
          $display("Match: %d", txn.a & txn.b);
        end
        
        3: begin
          $display("op=%0d a=%0d b=%0d",txn.op,txn.a,txn.b);
          if (txn.expected_result == (txn.a|txn.b))
            $display("CORRECT: Expected %d, Got %d", txn.a|txn.b, txn.expected_result);
        else
          $display("Match: %d", txn.a|txn.b);
        end
      endcase
    endtask
endmodule
