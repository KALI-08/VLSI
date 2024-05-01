class H;
  static int variable;
  static function void display();
    variable++;
  endfunction
endclass

module increment;
  H h[5];
  
  initial begin
    foreach (h[i]) begin
      
    h[i].display();
   // h.display();
    $display("variable=%0d",h[i].variable);
    end
  end
endmodule
