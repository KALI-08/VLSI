class example;
  rand int a;
 extern constraint c1;
  function display();
    $display("constraint example");
  endfunction
endclass
constraint example::c1{a>18;}
module top;
  initial begin
    example ex=new();
    for(int i=0;i<6;i++) begin
      ex.randomize;
      $display("value of a = %0d",ex.a);
      $display("____________________");
    end
  end
endmodule
