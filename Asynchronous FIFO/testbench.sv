module async_fifo_tb;
  reg reset;
  reg w_clk;
  reg r_clk;
  reg [4:0]wdata;
  reg w_en;
  reg r_en;
  
  wire [4:0]rdata;
  wire full;
  wire empty;
  
  async_fifo dut(.reset(reset),
                 .w_clk(w_clk),
                 .r_clk(r_clk),
                 .wdata(w_data),
                 .w_en(w_en),
                 .r_en(r_en),
                 .rdata(rdata),
                 .full(full),
                 .empty(empty)
                );
  
//   initial begin
//     reset = 1;
//     w_clk = 0;
//     r_clk = 0;
//     wdata = 0;
//     w_en = 0;
//     r_en = 0;
//     #15
//     reset = 0;
//     r_en = 0;
//     w_en = 1;
//     wdata = 5'b10000;
//     #10
//     wdata = 5'b10001;
//     #10
//     w_en = 0;
//    r_en = 1;
//     #30
//     r_en = 0;
//     #50
//     $finish();
//   end
      always #5 w_clk = ~w_clk;  // Write clock toggles every 5 time units
  always #7 r_clk = ~r_clk;  // Read clock toggles every 7 time units

  // Test procedure
  initial begin
    // Initialize signals
    w_clk = 0;
    r_clk = 0;
    reset = 1;
    w_en = 0;
    r_en = 0;
    wdata = 0;
    
    // Reset the FIFO
    #10 reset = 0;  // De-assert reset after 10 time units
    
    // Write some data into FIFO
    #10 w_en = 1;
    wdata = 5'b01101;  // Write 0xA5
    #10 wdata = 5'b01111;  // Write 0x5A
    #10 wdata =5'b10011;  // Write 0x3C
    #10 w_en = 0;  // Stop writing
    
    // Start reading data from FIFO
    #40 r_en = 1;
    #30 r_en = 0;  // Stop reading
    
    // End of simulation
    #100 $finish;
  end
  
  initial begin
    $monitor("time=%0d | reset=%0d | w_clk=%0d | r_clk=%0d | w_en=%0d | wdata=%0d | r_en=%0d | rdata=%0d | full=%0d | empty=%0d ",$time,reset,w_clk,r_clk,w_en,wdata,r_en,rdata,full,empty);
  end
  
//   always #5 w_clk = ~w_clk;
//   always #7 r_clk = ~r_clk;
  
endmodule




    
    
    
    
    
    
    
    
    
    
    
    
    
    
