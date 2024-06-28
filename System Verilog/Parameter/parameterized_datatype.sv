class para_data#(a=7,type name=string);
  bit[a-1:0] value;
  name place;
  function display();
    value=60;
    place="goa";
    $display("value is %0d and place is %0s",value, place);
  endfunction
endclass

module top;
  para_data pd;
  initial begin
    pd=new();
    pd.display();
  end
endmodule
