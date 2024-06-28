class para_ex #(laptop,tab);
  bit[laptop-2:0] data;
  bit[tab-1:0] value;
  function assigning;
    data=4;
    value=8;
  endfunction
endclass

module top;
  para_ex#(7,10) p;
  initial begin
    //para_ex
    p=new();
    p.assigning;
    $display("data is %0d and value is %0d",p.data,p.value);
  end
endmodule
