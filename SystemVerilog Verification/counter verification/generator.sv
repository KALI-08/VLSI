class generator;
  transactions tr;
  mailbox mail;
  function new(mailbox mail);
    this.mail=mail;
  endfunction
  
  task gene;
    repeat(10) begin
      tr=new();
      tr.randomize;
      //#5 tr.d=0;
      mail.put(tr);
      $display("********PACKET IS GENERATED********");
      #20;
    end
  endtask
endclass
