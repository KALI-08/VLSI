// Code your testbench here
// or browse Examples
module sparse;
  bit assoc[byte];
  byte idx;
  initial begin
    idx=1;
    repeat(4)
      begin
        assoc[idx]=idx;
        idx=idx<<1;
      end
     $display("First value");  //display first value of idx
        if(assoc.first(idx))
	  $display(idx,",",assoc[idx]);
       
        $display("next value"); // display next value
        if(assoc.next(idx))
	  $display(idx,",",assoc[idx]);
          
        $display("last value"); // display last value
        if(assoc.last(idx))
	  $display(idx,",",assoc[idx]);

        $display("previous value"); // display previous value
        if(assoc.prev(idx))
	  $display(idx,",",assoc[idx]);
      end
    endmodule  
