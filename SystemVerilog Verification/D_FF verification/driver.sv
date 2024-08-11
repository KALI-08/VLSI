class driver;
  transaction pkt;
  mailbox mail;
  virtual operation vintf;
  
  function new(virtual operation vintf,mailbox mail);
    this.vintf=vintf;
    this.mail=mail;
  endfunction
  
  task drive;
    repeat(8)begin
      pkt=new();
      mail.get(pkt);
      vintf.d=pkt.d;
      pkt.q=vintf.q;
      #5;
    end
  endtask
endclass
  
