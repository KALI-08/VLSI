// Code your testbench here
// or browse Examples
module sync_fifo_tb;
  reg clk,reset,w_en,r_en;
  reg [7:0]data_in;
  reg [2:0]w_ptr,r_ptr;
  reg [7:0]fifo[7:0];
  wire [7:0]data_out;
  wire full,empty;
  
  sync_fifo inst(clk,reset,w_en,r_en,data_in,data_out,full,empty);
  
  initial begin
    $dumpfile("sync_fifo.vcd");
    $dumpvars(1,sync_fifo_tb);
    $monitor("time=%d reset=%d clk=%d w_en=%d r_en=%d data_in=%d data_out=%d full=%d empty=%d",$time,reset,clk,w_en,r_en,data_in,data_out,full,empty);
  end
  
  initial begin
    reset=1;
    clk=0;
    w_en=0;
    r_en=0;
    #11 reset=0;
    
    w_en=1;
    r_en=0;
    data_in=8'b00000011;
    #20
    data_in=8'b00001001;
    #20
    data_in=8'b00000111;
    #20
     data_in=8'b00000011;
    #20
    data_in=8'b00001001;
    #20
    data_in=8'b00000111;
    #20
     data_in=8'b00000011;
    #20
  //  data_in=8'b00001001;
   // #20
  //  data_in=8'b00010111;
    #20
    
    r_en=1;
    w_en=0;
    #200
    $finish;
  end
  always #10 clk=~clk;
endmodule
    
    
