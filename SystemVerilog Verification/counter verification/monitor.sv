class monitor;
  virtual operation vintf;
  mailbox mail;
  transactions tr;
  
  function new(virtual operation vintf,mailbox mail);
    this.mail=mail;
    this.vintf=vintf;
  endfunction
  
  task main;
    forever
      #10
      begin
        transactions tr;
        tr=new();
        
        tr.clk=vintf.clk;
        tr.reset=vintf.reset;
        tr.out=vintf.out;
        mail.put(tr);
        
        $display("t=%0d clk=%0b reset=%0b out=%0d",$time,tr.clk,tr.reset,tr.out);
      end
  endtask
endclass
