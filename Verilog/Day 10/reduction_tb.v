module reduction_tb;
  reg [3:0]a;
  wire y0,y1,y2,y3,y4,y5;
  reduction reduction(.a(a),.y0(y0),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5));
  initial begin
    a=4'b0011;
    #5
    a=4'b1111;
    #5
    a=4'bx001;
    #5
    a=4'b001x;
    #5
    $finish;
  end
  initial
    $monitor("a=%b y0=%b y1=%b y2=%b y3=%b y4=%b y5=%b",a,y0,y1,y2,y3,y4,y5);
endmodule
