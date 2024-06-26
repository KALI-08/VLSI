module unique_case;
  int x;
  initial begin
    x=2'b01;
    unique case(x)
      00: $display("1) value of x is=%0d",x);
      //01: $display("1) value of x is=%0d",x);
      10: $display("1) value of x is=%0d",x);
      11: $display("1) value of x is=%0d",x);
    endcase
  end
endmodule
