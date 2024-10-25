`include "transaction.sv"
class generator;
  mailbox mail;
  transaction tr;
  
  function new(mailbox mail);
    this.mail=mail;
  endfunction
  
  task gene;
    repeat(8) begin
    tr=new();
    tr.randomize;
      mail.put(tr);
      #5;
    end
  endtask
endclass
      
