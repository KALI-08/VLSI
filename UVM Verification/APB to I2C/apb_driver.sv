class apb_driver extends uvm_driver#(apb_transaction);
  `uvm_component_utils(apb_driver);

  virtual apb_interface vif;
  apb_transaction apb_tr;
  
  function new(string name="apb_driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    apb_tr = apb_transaction::type_id::create("apb_tr");
    if (!(uvm_config_db#(virtual apb_interface)::get(this, "", "APB_INTF", vif)))
      `uvm_error("drv", "Unable to access the Interface");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive_trans();
      seq_item_port.item_done();
    end
  endtask

  task drive_trans();
    wait(vif.HRESETn);
    //updating prescale register//
    @(posedge vif.HCLK);
    vif.PWRITE <= 1;
    vif.PWDATA <= req.prescalue_value;
    vif.PADDR <= req.prescale_register;
    vif.PENABLE <= 1;
    vif.PSEL <= 1;
    req.reg_t = prescale_reg;
    `uvm_info("drv_drive_trans", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h",  reg_type_to_string(req.reg_t), req.prescale_register, req.prescalue_value), UVM_NONE); 
    //updating prescale register//

    //updating control register//
    @(posedge vif.HCLK);
    vif.PWDATA <= req.ctl_en;
    vif.PADDR <= req.control_register;
    req.reg_t = control_reg;
    `uvm_info("drv_drive_trans", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h",reg_type_to_string(req.reg_t), req.control_register, req.ctl_en), UVM_NONE); 
    //updating control register//

    if(req.op == write) begin
       drive_write_transaction();
    end
    else if(req.op == read) begin
       drive_read_transaction();
    end
  endtask
// I2C write Sequence

//1) generate start command 
//2) write slave address + write bit 
//3) receive acknowledge from slave 
//4) write data 
//5) receive acknowledge from slave 
//6) generate stop command




//i2c_read_sequence//

//1) generate start signal 
//2) write slave address + write bit 
//3) receive acknowledge from slave 
//4) write memory location 
//5) receive acknowledge from slave 
//6) generate repeated start signal 
//7) write slave address + read bit 
//8) receive acknowledge from slave 
//9) read byte from slave 
//10) write no acknowledge (NACK) to slave, indicating end of transfer 
//11) generate stop signal



  task drive_write_transaction();
       `uvm_info("write","The write_transaction initiated",UVM_NONE);
      send_write_address();
      @(posedge vif.HCLK);
      vif.PADDR <= 0;
      vif.PWDATA <= 0;
      vif.PWRITE <= 0;
      vif.PENABLE <= 0;
  endtask
 
//////send_write_address///////
  task send_write_address();	  
    @(posedge vif.HCLK);
    vif.PWDATA <= req.start_with_write;
    vif.PADDR <= req.command_register;
    req.reg_t = command_reg;
    `uvm_info("drv_send_write_address", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h",reg_type_to_string(req.reg_t), req.command_register, req.start_with_write), UVM_NONE); 

    @(posedge vif.HCLK);
    vif.PWDATA <= req.address_to_write;
    vif.PADDR <= req.transmit_register;
    req.reg_t = transmit_reg;
    `uvm_info("drv_send_write_address", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h", reg_type_to_string(req.reg_t), req.transmit_register, req.address_to_write), UVM_NONE); 

    @(posedge vif.HCLK);
    vif.PWRITE <= 0;
    vif.PADDR <= req.status_register;
    req.reg_t = status_reg;
    `uvm_info("drv_send_write_address", $sformatf("The type of trans = %s, PADDR = %0h ",reg_type_to_string(req.reg_t), req.status_register), UVM_NONE); 

    // Continuously monitor the status register until req.sts_read_data[0] == 1'b1 i.e interrupt
    do begin
      @(posedge vif.HCLK);
      req.sts_read_data = vif.PRDATA;
    end while (!(req.sts_read_data[0] == 1'b1 && req.sts_read_data[7] == 1'b0));
    
    `uvm_info("drv_send_write_address", "The interrupt received for the write_address from the status_reg", UVM_NONE);

    //calling_write_data task
    send_write_data();
   endtask
//////send_address///////



//////send_write_data///////
task send_write_data();
    @(posedge vif.HCLK);
    vif.PWRITE <= 1;
    vif.PWDATA <= req.write_cmd;
    vif.PADDR <= req.command_register;
    req.reg_t = command_reg;
    `uvm_info("drv_send_write_data", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h",reg_type_to_string(req.reg_t), req.command_register, req.write_cmd), UVM_NONE); 

    @(posedge vif.HCLK);
    vif.PWRITE <= 1;
    //if read means need to send the mem_location
    vif.PWDATA <= (req.op == write) ? req.data_to_write : req.rd_mem_loc; //if read means need to send the mem_location
    vif.PADDR <= req.transmit_register;
    req.reg_t = transmit_reg;
    `uvm_info("drv_send_write_data", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h", reg_type_to_string(req.reg_t), req.transmit_register, req.data_to_write), UVM_NONE); 

    @(posedge vif.HCLK);
    vif.PWRITE <= 0;
    vif.PADDR <= req.status_register;
    req.reg_t = status_reg;
    `uvm_info("drv_send_write_data", $sformatf("The type of trans = %s, PADDR = %0h", reg_type_to_string(req.reg_t), req.status_register), UVM_NONE); 

    do begin
      @(posedge vif.HCLK);
      req.sts_read_data = vif.PRDATA;
    end while (!(req.sts_read_data[0] == 1'b1 && req.sts_read_data[7] == 1'b0));
    
   `uvm_info("drv_send_write_data", "The interrupt received for the write_data from the status_reg", UVM_NONE);
   
   //if it was write call send_stop task else send_address
   if(req.op == write)
       send_stop();
    else 
       send_read_address();

endtask
//////send_write_data///////


//////stop///////
 task send_stop();
   @(posedge vif.HCLK);
    vif.PENABLE <= 1;
    vif.PWRITE <= 1;
    vif.PWDATA <= req.stop_cmd;
    vif.PADDR <= req.command_register;
    req.reg_t = command_reg;
    `uvm_info("drv_send_stop", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h", reg_type_to_string(req.reg_t), req.command_register, req.stop_cmd), UVM_NONE); 
    //calling send_ack task
    send_ack();
 endtask

 //////stop///////


 //////send_ack///////
 task send_ack();
    @(posedge vif.HCLK);
    @(posedge vif.HCLK);
    vif.PWRITE <= 0;
    vif.PADDR <= req.status_register;
    req.reg_t = status_reg;
    `uvm_info("drv_send_ack", $sformatf("The type of trans = %s, PADDR = %0h", reg_type_to_string(req.reg_t), req.status_register), UVM_NONE); 

    do begin
      @(posedge vif.HCLK);
      req.sts_read_data = vif.PRDATA;
      //if it was write check the ack i.e. 7th bit of sts_reg will be zero or else if read means check ack bit was one 
    end while (!(req.sts_read_data[0] == 1'b1 && (((req.sts_read_data[7] == 1'b1) && (req.op==read)) || ( (req.sts_read_data[7] == 1'b0) && (req.op==write)))));
    
    `uvm_info("drv_send_ack", "The interupt received for the stop from the status_reg", UVM_NONE);

    @(posedge vif.HCLK);
    vif.PWRITE <= 1;
    vif.PWDATA <= req.intr_ack;
    vif.PADDR <= req.command_register;
    req.reg_t = command_reg;
    `uvm_info("drv_send_ack", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h", reg_type_to_string(req.reg_t), req.command_register, req.stop_cmd), UVM_NONE); 
    `uvm_info("drv_send_ack", "The acknowledgement was send from the master", UVM_NONE);
 endtask

 //////send_ack///////

//////drive_read_transaction//////
  task drive_read_transaction();
    `uvm_info("read","The read_transaction initiated",UVM_NONE);
     send_write_address();
     @(posedge vif.HCLK);
      vif.PADDR <= 0;
      vif.PWDATA <= 0;
      vif.PWRITE <= 0;
      vif.PENABLE <= 0;
  endtask
//////drive_read_transaction//////

 ///////send_read_address////////
 task send_read_address();
    @(posedge vif.HCLK);
    vif.PWDATA <= req.start_with_write;
    vif.PADDR <= req.command_register;
    vif.PWRITE <= 1;
    req.reg_t = command_reg;
    `uvm_info("drv_send_read_address", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h", reg_type_to_string(req.reg_t), req.command_register, req.start_with_read), UVM_NONE); 

    @(posedge vif.HCLK);
    vif.PADDR <= req.transmit_register;
    vif.PWDATA <= req.address_to_read;
    req.reg_t = transmit_reg;
    `uvm_info("drv_send_read_address", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h",reg_type_to_string(req.reg_t), req.transmit_register, req.address_to_read), UVM_NONE); 

    @(posedge vif.HCLK);
    vif.PWRITE <= 0;
    vif.PADDR <= req.status_register;
    req.reg_t = status_reg;
    `uvm_info("drv_send_read_address", $sformatf("The type of trans = %s, PADDR = %0h", reg_type_to_string(req.reg_t), req.status_register), UVM_NONE); 

    // Continuously monitor the status register until req.sts_read_data[0] == 1'b1
    do begin
      @(posedge vif.HCLK);
      req.sts_read_data = vif.PRDATA;
    end while (!(req.sts_read_data[0] == 1'b1 && req.sts_read_data[7] == 1'b0));
    
    `uvm_info("drv_send_read_address", "The interrrupt received for the send_read_address from the status_reg", UVM_NONE);

    //calling send_read_data_task
    get_read_data();
    endtask
  
 ///////send_read_address////////


 ///////get_read_data////////
  task get_read_data();
    @(posedge vif.HCLK);
    @(posedge vif.HCLK);
    vif.PWRITE <= 1;
    vif.PWDATA <= req.read_cmd;
    vif.PADDR <= req.command_register;
    req.reg_t = command_reg;
    `uvm_info("drv_get_read_data", $sformatf("The type of trans = %s, PADDR = %0h, PWDATA = %0h",reg_type_to_string(req.reg_t), req.command_register, req.stop_cmd), UVM_NONE); 
    @(posedge vif.HCLK);
    vif.PWRITE <= 0;
    @(posedge vif.HCLK);
    vif.PWRITE <= 0;
    vif.PADDR <= req.status_register;
    req.reg_t = status_reg;
    `uvm_info("drv_get_read_data", $sformatf("The type of trans = %s, PADDR = %0h",reg_type_to_string(req.reg_t), req.status_register), UVM_NONE); 

    // Continuously monitor the status register until req.sts_read_data[0] == 1'b1

     do begin
      @(posedge vif.HCLK);
      req.sts_read_data = vif.PRDATA;
     end while (!(req.sts_read_data[0] == 1'b1 && req.sts_read_data[7] == 1'b1));
    
     `uvm_info("drv_get_read_data", "The interrupt received for the read_data from the status_reg", UVM_NONE);


    @(posedge vif.HCLK);
    vif.PWRITE <= 0;
    vif.PADDR <= req.recieve_register;
    
    req.reg_t = receive_reg;
    @(posedge vif.HCLK);
    vif.PENABLE <= 0;
    `uvm_info("drv_read_data", $sformatf("The type of trans = %s, PADDR = %0h, PRDATA = %0h", reg_type_to_string(req.reg_t), req.recieve_register, vif.PRDATA), UVM_NONE); 
    send_stop();
 endtask
 //////get_read_data///////////


endclass








