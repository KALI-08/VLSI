class i2c_agent extends uvm_agent;
   `uvm_component_utils(i2c_agent);

   i2c_monitor  mon;

  function new(string name ="apb_agent",uvm_component parent);
     super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     mon = i2c_monitor::type_id::create("mon",this);
   endfunction


 endclass 
