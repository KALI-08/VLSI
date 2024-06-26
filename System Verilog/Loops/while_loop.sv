module while_ex;
  int bike;
  initial begin
    $display("while loop output");
    while(bike<8) begin
      $display("value of bike=%0d",bike);
      bike++;
    end
  end
endmodule
