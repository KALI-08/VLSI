module coverage_ex;
  bit [2:0]a;
  bit [2:0]b;
  bit [7:0]c;
  
  covergroup cover_gp;
    option.per_instance = 1;
    cp1:coverpoint a;
    cp2:coverpoint b;
    cp1_X_cp2:cross cp1,cp2;
     option.auto_bin_max = 256;
  endgroup
  
  initial begin
    cover_gp cg=new();
    repeat(8) begin
      {a,b}=$random;
      c=a*b;
      cg.sample;
     
      
      $display("a--%0d  b--%0d c--%0d",a,b,c);
    end
    
      $display("coverage--%0f",cg.get_coverage);
    //end
  end
  
endmodule
