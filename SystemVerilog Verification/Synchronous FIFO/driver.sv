class driver;
  transaction tr;
  virtual intf vintf;
  mailbox mail;
  
  function new(virtual intf vintf, mailbox mail);
    this.vintf=vintf;
    this.mail=mail;
  endfunction
  
  task reset();
    @(posedge vintf.clk)
    vintf.reset <= 1;
    vintf.w_en <= 0;
    vintf.r_en <= 0;
    vintf.data_out <= 0;
    //#10;
    //vintf.reset <= 0;
    //$display("RESET CONDITION");
  endtask:reset
  
  task write();
    @(posedge vintf.clk)
    vintf.reset <= 0;
    vintf.w_en <= 1;
    vintf.r_en <=0;
//     #5;
    
    vintf.data_in <= tr.data_in;
//     vintf.w_en <= 0;
   // $display("WRITE CONDITION data is -- %0d oper--%0d",vintf.data_in,tr.oper);
    read();
  endtask:write
  
  task read();
     @(posedge vintf.clk)
    
    vintf.reset <= 0;
    vintf.w_en <= 0;
    
    vintf.r_en <=1;
 
    
    
    tr.data_out <= vintf.data_out;
    //#1;
   // $display("READ CONDITION data is -- %0d oper--%0d",tr.data_out,tr.oper);
  endtask:read
  
  task driv();
    
    forever begin
//     reset();
//     //forever begin
     tr=new();
    mail.get(tr);
    
    if(tr.oper==1)
        write();
    else if(tr.oper==0)
        read();
      else
        $display("driver failed");
      //#10;
    end
  endtask:driv
  
endclass
