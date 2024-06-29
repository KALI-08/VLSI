class example;
  rand int a;
  constraint c1{a>20;a<29;}
  function display();
    $display("constraint example");
  endfunction
endclass

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
