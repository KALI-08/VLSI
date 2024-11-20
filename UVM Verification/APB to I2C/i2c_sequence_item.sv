class i2c_transaction extends uvm_sequence_item;

   bit start;
   bit [7:0] addr;
   bit stop;
   bit [7:0] input_data_monitor;
   bit repeated_start;
   bit write, read;
   rand bit [7:0] data  ;
   int addr_q [$];
  int monitor_data_q [$];


   function new(string name = "i2c_transaction");
      super.new(name);
   endfunction

   // Register the class with the factory
   `uvm_object_utils_begin(i2c_transaction)
      `uvm_field_int(start, UVM_ALL_ON)
      `uvm_field_int(addr, UVM_ALL_ON)
      `uvm_field_int(stop, UVM_ALL_ON)
      `uvm_field_int(input_data_monitor, UVM_ALL_ON)
      `uvm_field_int(repeated_start, UVM_ALL_ON)
      `uvm_field_int(write, UVM_ALL_ON)
      `uvm_field_int(read, UVM_ALL_ON)
      `uvm_field_int(data, UVM_ALL_ON)
   `uvm_object_utils_end

// randomize the varible calling from the i2c_monitor
   function void custom_randomize();
     assert(this.randomize());
   endfunction


endclass

