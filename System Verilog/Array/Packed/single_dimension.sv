module abc;
  bit [7:0]a;
  initial begin
    a=8'hab;
    for(int i=0;i<8;i++) begin
     
      
      $display("a[%0d]=%0b",i,a[i]);
    
    end
  end
endmodule
