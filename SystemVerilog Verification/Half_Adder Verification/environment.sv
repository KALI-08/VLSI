`include "generator.sv"
`include "driver.sv"
//`include "transaction.sv"

class environment;
  generator gen;
  driver dri;
 // transaction tr;
  mailbox mail;
  virtual operation vintf;
  
  function new(virtual operation vintf, mailbox mail);
    this.vintf=vintf;
    this.mail=mail;
  endfunction
  
  task memory;
    mail=new();
    gen=new(mail);
    dri=new(vintf,mail);
  endtask
  
  task run;
    fork
      gen.gene;
      dri.driv;
    join
  endtask
endclass
