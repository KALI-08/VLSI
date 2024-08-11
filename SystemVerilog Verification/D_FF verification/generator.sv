class generator;
  transaction pkt;
  mailbox mail;
  function new(mailbox mail);
    this.mail=mail;
  endfunction
  task gene;
    repeat(8)
      begin
        pkt=new();
        //pkt.randomize();
       pkt.d=1;
        
        mail.put(pkt);
        $display("packet is generated");
        #20;
        //$monitor("d=%0d",this.pkt.d);
        end
  endtask
endclass
