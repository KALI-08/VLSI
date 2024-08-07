`include "environment.sv"

class dfftest;
  environment env;
  virtual operation vintf;
  mailbox mail;
  mailbox m1;
  
  function new(virtual operation vintf,mailbox mail,mailbox m1);
    this.vintf=vintf;
    this.mail=mail;
    this.m1=m1;
  endfunction
  
  task memory;
    mail=new();
    m1=new();
    env=new(vintf,mail,m1);
  endtask
  
  task run;
    fork
      env.memory;
      env.run;
    join
  endtask
endclass
