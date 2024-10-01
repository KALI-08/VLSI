class test;
  mailbox mail;
  virtual intf vintf;
  environment env;
  
  function new(virtual intf vintf,mailbox mail);
    this.vintf=vintf;
    this.mail=mail;
  endfunction
  
  task mem();
    mail=new();
    env=new(vintf,mail);
  endtask
  
  task t();
    fork
      env.memory();
      env.run();
    join
  endtask
endclass
