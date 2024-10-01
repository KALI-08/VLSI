class generator;
  transaction tr;
  mailbox mail;
  
  function new(mailbox mail);
    this.mail=mail;
  endfunction
  
  task gene();
    
    repeat(5) begin
     #5;
       tr=new();
      tr.randomize;
      mail.put(tr);
     /* $display("--------------------------------------------");
      $display("t--%0d data_in--%0d",$time,tr.data_in);
      $display("tr completed");
      $display("--------------------------------------------");*/
      //#12;
    end
  endtask
endclass
