class driver;
  transactions tr;
  mailbox mail;
  
  virtual operation vintf;
  function new(virtual operation vintf,mailbox mail);
    this.vintf=vintf;
    this.mail=mail;
  endfunction
  
  task drive;
    repeat(8) begin
      tr=new();
      mail.get(tr);
      //vintf.d=tr.d;
      tr.out=vintf.out;
      #5;
    end
  endtask
endclass
      
