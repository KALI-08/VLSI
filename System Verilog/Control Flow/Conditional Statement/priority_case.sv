module priority_case;
  int a;
  initial begin
    a=28;
    priority case(a)
      24: $display("value of a is not found");
      28: $display("value of a is found=%0d",a);
      31: $display("value of a is not found");
      28: $display("value of a is found=%0d",a);
      default: $display("value not found");
    endcase
  end
endmodule
