class transaction;
  bit clk,reset;
  bit w_en,r_en;
  rand bit oper;
  rand bit [7:0]data_in;
  bit [7:0]data_out;
  bit full,empty;
  
  constraint c1{oper dist {1:/50,0:/50};}
  
  
endclass
