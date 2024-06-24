module mail_box;
  mailbox #(int)mail=new();
  int value;
  
  task process_a;
    repeat(15) begin
      value=$urandom_range(1,25);
      mail.put(value);
      $display("put value =%0d",value);
    end
    $display("--------------");
  endtask
  
  task process_b;
    repeat(15) begin
      mail.get(value);
      $display("get value=%0d",value);
    end
  endtask
  
  initial begin
    fork
      process_a;
      process_b;
    join
  end
endmodule
    
