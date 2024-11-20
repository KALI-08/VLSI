class apb_monitor extends uvm_monitor;
  `uvm_component_utils(apb_monitor);

   virtual apb_interface vif ;
   apb_transaction apb_tr;

   uvm_analysis_port#(apb_transaction) apb_mon_to_sb;

  function new(string name="apb_monitor",uvm_component parent);
	   super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
        super.build_phase(phase);
	apb_tr = apb_transaction::type_id::create("apb_tr");
     if(!(uvm_config_db#(virtual apb_interface)::get(this,"","APB_INTF",vif)))
		`uvm_error("drv","Unable to access the Interface");

	apb_mon_to_sb = new("apb_mon_to_sb",this);
   endfunction

   virtual task run_phase(uvm_phase phase);

      super.run_phase(phase);
       
      forever begin
	      wait(vif.HRESETn);
              @(posedge vif.HCLK);
	      if(vif.PENABLE && vif.PREADY && vif.PSEL) begin
                //`uvm_info("apb_mon",$sformatf("The apb_mon tiggered"),UVM_NONE);
		   apb_tr.PADDR = vif.PADDR;
		   apb_tr.PSEL = vif.PSEL;
	           apb_tr.PWRITE = vif.PWDATA;
                   if(vif.PWRITE && (vif.PADDR == 'h10)) begin
		      apb_tr.PWDATA = vif.PWDATA;
                     apb_mon_to_sb.write(apb_tr);
                     //`uvm_info("apb_mon",$sformatf("The write data was sent to sb addr = %h data = %h",apb_tr.PADDR,apb_tr.PWDATA),UVM_NONE);
		      apb_tr.op = write; //write
	       	      
		   end
                   else if(!vif.PWRITE && (vif.PADDR=='h08)) begin
 	      	      apb_tr.PRDATA = vif.PRDATA;
                      //`uvm_info("apb_mon",$sformatf("The write data was sent to sb addr = %h data = %h",apb_tr.PADDR,apb_tr.PRDATA),UVM_NONE);
		      apb_tr.op = read; //read
		      
	       	      apb_mon_to_sb.write(apb_tr);
	       	   end
	      end
      end


   endtask


endclass


