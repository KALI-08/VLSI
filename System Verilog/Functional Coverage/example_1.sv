module coverage_ex;
  bit [1:0]a;
  bit [1:0]b;
  
  covergroup cover_gp;
    
    cp1:coverpoint a;
    cp2:coverpoint b;
  endgroup
  
  initial begin
    cover_gp cg=new();
    repeat(4) begin
      {a,b}=$random;
      cg.sample;
      
      $display("a--%0d  b--%0d",a,b);
    end
    
      $display("coverage--%0f",cg.get_coverage);
    //end
  end
  
endmodule
