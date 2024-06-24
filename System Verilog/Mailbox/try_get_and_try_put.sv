module mail_box;
  mailbox mail=new(4);
  
  task process_a;
    int value;
    repeat(7) begin
      value=$urandom_range(1,50);
      if(mail.try_put(value)) begin
      $display("put value =%0d",value);
    end
    else begin
      $display("failed to put value =%0d",value);
      $display("Number of value in mailbox=%0d",mail.num());
    end
    end
    $display("-------------------");
  endtask
  
  task process_b;
    int value;
    repeat(7) begin
      if(mail.try_get(value)) begin
        $display("get value =%0d",value);
      end
      else begin
        $display("failed to get value =%0d",value);
        $display("Number of value in mailbox=%0d",mail.num());
      end
    end
  endtask
  
  initial begin
    fork
      process_a;
      process_b;
    join
  end
endmodule
