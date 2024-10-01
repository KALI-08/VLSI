class monitor;
  transaction tr;
  mailbox mail;
  virtual intf vintf;
  
  function new(virtual intf vintf,mailbox mail);
    this.vintf=vintf;
    this.mail=mail;
  endfunction
  
  task run();
   // forever begin
    tr=new();
    tr.w_en <= vintf.w_en;
    tr.r_en <= vintf.r_en;
    tr.full <= vintf.full;
    tr.empty <= vintf.empty;
    tr.data_in <= vintf.data_in;
    tr.data_out <= vintf.data_out;
    mail.put(tr);
    //$display("");
    $display("MONITOR  w_en--%0d r_en--%0d  full--%0d  empty--%0d  data_in--%0d  data_out--%0d",tr.w_en,tr.r_en,tr.full,tr.empty,tr.data_in,tr.data_out);
 //  end
  endtask
endclass
