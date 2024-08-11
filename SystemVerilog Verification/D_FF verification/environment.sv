`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"

class environment;
  virtual operation vintf;
  mailbox mail;
  generator gen;
  driver driv;
  function new(virtual operation vintf,mailbox mail);
    this.vintf=vintf;
    this.mail=mail;
  endfunction
  
  task memory;
    mail=new();
    gen=new(mail);
    driv=new(vintf,mail);
  endtask
  task run;
    fork
      gen.gene;
      driv.drive;
    join
  endtask
endclass
