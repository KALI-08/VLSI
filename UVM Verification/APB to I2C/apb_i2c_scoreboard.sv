`uvm_analysis_imp_decl(_apb)
`uvm_analysis_imp_decl(_i2c)

class apb_2_i2c_sb extends uvm_scoreboard;
   `uvm_component_utils(apb_2_i2c_sb);

   apb_transaction apb_trans;
   i2c_transaction i2c_trans;
   uvm_analysis_imp_apb#(apb_transaction, apb_2_i2c_sb) apb_mon_to_sb_export;
   uvm_analysis_imp_i2c#(i2c_transaction, apb_2_i2c_sb) i2c_mon_to_sb_export;

   bit [7:0] apb_data;
   bit [7:0] i2c_data;
   bit [7:0] read_data;
   bit trans_type;
   bit [31:0] total_size;
   bit [7:0] apb_data_compare;
   bit [31:0] apb_write_monitor_queue[$];
   bit [31:0] apb_read_monitor_queue[$];

   function new(string name = "apb_2_i2c_sb", uvm_component parent);
      super.new(name, parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      apb_mon_to_sb_export = new("apb_mon_to_sb_export", this);
      i2c_mon_to_sb_export = new("i2c_mon_to_sb_export", this);

      apb_trans = apb_transaction::type_id::create("apb_trans");
      i2c_trans = i2c_transaction::type_id::create("i2c_trans");
   endfunction

   function void write_apb(apb_transaction apb_tr);
      apb_trans = apb_tr;
     if (apb_trans.PADDR == 'h10) begin
         apb_data = apb_trans.PWDATA;
         apb_write_monitor_queue.push_front(apb_data);
       `uvm_info("SB", $sformatf(" The write data/address was updated in the scoreboard = %h", apb_trans.PWDATA), UVM_NONE);
     end else if (apb_trans.PADDR == 'h8 ) begin
         apb_data = apb_trans.PRDATA;
         apb_read_monitor_queue.push_front(apb_data);
       `uvm_info("SB", $sformatf("The read_data was updated in the scoreboard %h", apb_trans.PRDATA), UVM_NONE);
      end
      trans_type = apb_trans.op;
      total_size = apb_write_monitor_queue.size();
   endfunction

   function void write_i2c(i2c_transaction i2c_tr);
      i2c_trans = i2c_tr;

      for (int i = 0; i < total_size; i++) begin
         if (i % 2 == 0) begin
            i2c_data = i2c_trans.addr_q.pop_back();
            apb_data_compare = apb_write_monitor_queue.pop_back();
            if (i2c_data == apb_data_compare) begin
               `uvm_info("SB_MATCH", $sformatf("The address matched apb_data = %h, i2c_data = %h", apb_data_compare, i2c_data), UVM_NONE);
            end else begin
               `uvm_error("SB_MISMATCH", $sformatf("The address mismatched apb_data = %h, i2c_data = %h", apb_data_compare, i2c_data));
            end
         end else begin
            i2c_data = i2c_trans.monitor_data_q.pop_back();
            apb_data_compare = apb_write_monitor_queue.pop_back();
            if (i2c_data == apb_data_compare) begin
		    if (trans_type == 0)  begin
              `uvm_info("SB_MATCH", $sformatf("The write_memory data location matched apb_data = %h, i2c_data = %h", apb_data_compare, i2c_data), UVM_NONE);
	  end
		  else begin
                  `uvm_info("SB_MATCH", $sformatf("The write_data matched apb_data = %h, i2c_data = %h", apb_data_compare, i2c_data), UVM_NONE);
	  end
            end else begin
		    if (trans_type == 0) begin
              `uvm_error("SB_MISMATCH", $sformatf("The write_memory data location  mismatched apb_data = %h, i2c_data = %h", apb_data_compare, i2c_data));
	  end
		  else begin
                  `uvm_error("SB_MISMATCH", $sformatf("The write_data mismatched apb_data = %h, i2c_data = %h", apb_data_compare, i2c_data));
	  end
	  end
         end
      end

      if (apb_read_monitor_queue.size() != 0) begin
         read_data = apb_read_monitor_queue.pop_back();
         if (i2c_trans.data == read_data) begin
            `uvm_info("SB_MATCH", $sformatf("The read data matched apb_data = %h, i2c_data = %h", read_data, i2c_trans.data), UVM_NONE);
         end else begin
            `uvm_error("SB_MISMATCH", $sformatf("The read data mismatched apb_data = %h, i2c_data = %h", read_data, i2c_trans.data));
         end
      end
   endfunction
endclass


