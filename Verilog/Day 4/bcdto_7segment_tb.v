module bcdto_7segment_tb;
  reg [3:0] bcd;
  wire [6:0] seg;
  integer i;
  //instantiate the bcdto_7segment module
  bcdto_7segment bcdto_7segment(.bcd(bcd),.seg(seg));
  //ordered instant
  //dump waveform information
  initial begin
    $dumpfile("bcdto_7segment.vcd");
    $dumpvars(1,bcdto_7segment_tb);
    $monitor("bcd=%b seg=%b",bcd,seg);
  end
  initial begin
    for(i=0;i<16;i=i+1)
    
        bcd=1;
        #15
    bcd=2;
    #15
    bcd=3;
    #15
    bcd=4;
    #15
    bcd=5;
    #15
    bcd=6;
    #15
    bcd=7;
    #15
    bcd=8;
    #15
    bcd=9;
    #15
    bcd=0;
    #15
    bcd=12;
    #15
    
    $finish;
  end
endmodule
