class scoreboard;
  mailbox mail;
  
  function new(mailbox mail);
    this.mail=mail;
  endfunction
  
  task main;
    transactions tr;
    forever 
      #10
      begin
        mail.get(tr);
        if(tr.out<10)
          $display("---TARGET PASSED----");
        else
          $display("---TARGET FAILED----");
      end
  endtask
endclass
