class driver;
  mailbox mail;
  transaction tr;
  virtual operation vintf;
  
  function new(virtual operation vintf,mailbox mail);
    this.vintf=vintf;
    this.mail=mail;
  endfunction
  
  task driv;
    repeat(8) begin
      tr=new();
      mail.get(tr);
      vintf.a=tr.a;
      vintf.b=tr.b;
      tr.sum=vintf.sum;
      tr.carry=vintf.carry;
      #5;
    end
  endtask
endclass
