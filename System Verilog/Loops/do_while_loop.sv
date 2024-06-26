module dowhile_ex;
  int bike;
  initial begin
    $display("do while loop output");
    do begin
      $display("value of bike=%0d",bike);
      bike++;
    end
    while(bike<8);
  end
endmodule
