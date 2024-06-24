module mail_box;
  mailbox #(string)mail=new(4);
  string name;
  
  task process_a;
    name="CADENCE";
    mail.put(name);
    $display("put name 1 =%0s",name);
    name="SAMSUNG";
    mail.put(name);
    $display("put name 2 =%0s",name);
    name="SYNOPSYS";
    mail.put(name);
    $display("put name 3 =%0s",name);
    name="QUALCOMM";
    mail.put(name);
    $display("put name 4 =%0s",name);

  endtask
 
  
  task process_b;
    string name;
    mail.get(name);
    $display("get name 1 =%0s",name);
        mail.get(name);
    $display("get name 2 =%0s",name);
        mail.get(name);
    $display("get name 3 =%0s",name);
        mail.get(name);
    $display("get name 4 =%0s",name);
  endtask
  
  initial begin
    fork
      process_a;
      process_b;
    join
  end
endmodule
