module packed_array;
  bit [3:0][3:0]data;
  initial begin
    data=16'hf35a;
    $display("data=%0h",data);
    for(int i=3;i>=0;i--)
      begin
        $display("data[%0d]=%0h",i,data[i]);
      end
  end
endmodule
