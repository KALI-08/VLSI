module ex_case;
  bit[1:0]x;
  initial begin
    x=2'b01;
    case(x)
      00: $display("case 00 value of x=%0d",x);
      //01: $display("case 01 value of x=%0d",x);
      10: $display("case 10 value of x=%0d",x);
      11: $display("case 11 value of x=%0d",x);
      default: $display("value of x is not known");
    endcase
  end
endmodule
