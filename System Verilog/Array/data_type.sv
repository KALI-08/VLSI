module data_type;
  int a;
  integer b;
  shortint c;
  byte d;
  bit [3:0]e;
  reg [4:0]f;
  logic [4:0]l1;
  logic signed [4:0]l2;
  initial begin
    a='h xxxf_fxff;
    b='h ffff_ffff;
    c='h aaaa;
    d=251; 
    e=5;
    f=16;
    l1=5'b00011;
    l2=5'd16;
  end
  initial begin
    $display("a=%0h b=%0h c=%0h d=%0d e=%0h f=%0h l1=%0h l2=%0d",a,b,c,d,e,f,l1,l2);
  end
endmodule
