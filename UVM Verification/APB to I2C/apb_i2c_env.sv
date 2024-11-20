class apb_2_i2c_env extends uvm_env;
  `uvm_component_utils(apb_2_i2c_env);
   apb_agent apb_agnt;
   i2c_agent i2c_agnt;
   apb_2_i2c_sb sb;



  function new(string name="apb_i2c_env",uvm_component parent);
    super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     apb_agnt = apb_agent::type_id::create("apb_agnt",this);
     i2c_agnt = i2c_agent::type_id::create("i2c_agnt",this);
     sb = apb_2_i2c_sb::type_id::create("sb",this);
   endfunction

   function void connect_phase(uvm_phase phase);
	   super.connect_phase(phase);
	   apb_agnt.mon.apb_mon_to_sb.connect(sb.apb_mon_to_sb_export);
	   i2c_agnt.mon.i2c_mon_to_sb.connect(sb.i2c_mon_to_sb_export);

   endfunction


endclass
