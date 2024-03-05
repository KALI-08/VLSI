module usr_tb;
  reg clk,reset;
  reg [7:0]d;
  reg [1:0]s;
  wire [7:0]q;
  usr ins(clk,reset,d,s,q);
  initial begin
   clk=0;
     d=8'b00011101;
    reset=0;
   #20 s=2'b01;
    #20 s=2'b00;
   #20 s=2'b10;
    #20 s=2'b11;
    #200$finish;
  end
  initial begin
    $dumpfile("usr.vcd");
    $dumpvars(1,usr_tb);
    $monitor("t=%d reset=%b clk=%b s=%b d=%b q=%b",$time,reset,clk,s,d,q);
  end
    always #10 clk=~clk;
endmodule
