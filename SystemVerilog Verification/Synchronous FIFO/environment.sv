class environment;
  mailbox mail;
  generator gen;
  driver dr;
 // monitor mon;
  virtual intf vintf;
  
  function new(virtual intf vintf, mailbox mail);
    this.vintf=vintf;
    this.mail=mail;
  endfunction
  
  task memory();
    mail=new();
    gen=new(mail);
    dr=new(vintf,mail);
   // mon=new(vintf,mail);
  endtask
  
  task run();
    fork
      gen.gene();
      dr.driv();
   //   mon.run();
    join
  endtask
endclass
