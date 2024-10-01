module async_fifo(reset,w_clk,r_clk,wdata,rdata,w_en,r_en,full,empty);
  input reset;
  input w_clk;
  input r_clk;
  input [4:0]wdata;
  input w_en;
  input r_en;
  
  output reg [4:0]rdata;
  output reg full;
  output reg empty;
  
  wire [3:0]wr_ptr_g;
  wire [3:0]rd_ptr_g;
  
  reg [3:0] wr_pointer,wr_pointer_d1,wr_pointer_d2;
  reg [3:0] rd_pointer,rd_pointer_d1,rd_pointer_d2;
  
  reg [4:0]mem[4:0];
  
  always @(posedge w_clk) begin
    if(reset) begin
      wr_pointer <= 0;
    end
      else begin
        mem[wr_pointer] <= wdata;
        wr_pointer <= wr_pointer+1;
      end
    end
 
  
  always @(posedge r_clk) begin
    if(reset) begin
      rd_pointer <= 0;
    end
      else begin
             rd_pointer <= rd_pointer+1;
             rdata <= mem[rd_pointer];
      end
    end
  
  assign wr_ptr_g = wr_pointer ^ (wr_pointer >> 1);
  assign rd_ptr_g = rd_pointer ^ (rd_pointer >> 1);
  
  always @(posedge w_clk) begin
    if(reset) begin
      rd_pointer_d1 <= 0;
      rd_pointer_d2 <= 0;
    end
      else begin
        rd_pointer_d1 <= rd_ptr_g;
        rd_pointer_d2 <= rd_pointer_d1;
      end
    end
  
  
  always @(posedge r_clk) begin
    if(reset) begin
      wr_pointer_d1 <= 0;
      wr_pointer_d2 <= 0;
    end
    else begin
      wr_pointer_d1 <= wr_ptr_g;
      wr_pointer_d2 <= wr_pointer_d1;
    end
    end
  
  
  assign empty = (rd_ptr_g == wr_pointer_d2);
  assign full = (wr_ptr_g[3] != rd_pointer_d2[3] && wr_ptr_g[2] != rd_pointer_d2[2] && wr_ptr_g[1] == rd_pointer_d2[1]);
  
endmodule





//   rd = 0;
//     wdata = 0;
    
//     // Reset the FIFO
//     #10 rst = 0;  // De-assert reset after 10 time units
    
//     // Write some data into FIFO
//     #10 wr = 1;
//     wdata = 8'hA5;  // Write 0xA5
//     #10 wdata = 8'h5A;  // Write 0x5A
//     #10 wdata = 8'h3C;  // Write 0x3C
//     #10 wr = 0;  // Stop writing
    
//     // Start reading data from FIFO
//     #40 rd = 1;
//     #30 rd = 0;  // Stop reading
    
//     // End of simulation
//     #100 $finish;













        
