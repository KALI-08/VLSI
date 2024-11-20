class apb_sequence extends uvm_sequence#(apb_transaction);
   `uvm_object_utils(apb_sequence);

   apb_transaction apb_tr;
  int trans_count;

  function new(string name="apb_sequence");
      super.new(name);
    if ($value$plusargs("TRANS_COUNT=%d", trans_count))
      $display("trans_count");
        else
            trans_count = 1;
   endfunction

   virtual task body();
    apb_tr = apb_transaction::type_id::create("apb_tr");
    
     repeat(trans_count) begin
     start_item(apb_tr);
         assert(apb_tr.randomize()) 
	    //apb_tr.op = read;
        finish_item(apb_tr);
       #1000;
     end
   endtask

endclass



