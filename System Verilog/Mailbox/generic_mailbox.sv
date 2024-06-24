module mail_box;
  mailbox mail=new(2);
  
  task process_a;
    int value=4;
    string name="EDA";
    mail.put(value);
    $display("put value=%0d",value);
    mail.put(name);
    $display("put string=%0s",name);
  endtask
  
  task process_b;
    int value;
    string name;
    mail.get(value);
    $display("get value=%0d",value);
    mail.get(name);
    $display("get string=%0s",name);
  endtask
  
  initial begin
    fork
      process_a;
      process_b;
    join
  end
endmodule
