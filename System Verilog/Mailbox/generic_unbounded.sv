module mail_box;
  mailbox mail=new();
  
  task process_a;
    int value;
    repeat(8) begin
      value=$urandom_range(15,23);
    mail.put(value);
    $display("put value=%0d",value);
      $display("----------------");
    end
  endtask
  
  task process_b;
    int value;
    repeat(8) begin
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
