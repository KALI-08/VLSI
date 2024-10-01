`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
//`include "monitor.sv"
`include "environment.sv"
`include "test.sv"



module top;
  mailbox mail;
  test tt;
  intf intff();
  
  sync_fifo(.clk(intff.clk),
            .reset(intff.reset),
            .w_en(intff.w_en),
            .r_en(intff.r_en),
            .data_in(intff.data_in),
            .data_out(intff.data_out),
            .full(intff.full),
            .empty(intff.empty)
           );
  
//   covergroup c_group @(posedge intff.clk);
//     cp1:coverpoint intff.w_en;
//     cp2:coverpoint intff.r_en;
//     cp3:coverpoint intff.data_in;
//     cp4:coverpoint intff.data_out;
//     cp5:coverpoint intff.full;
//     cp6:coverpoint intff.empty;
//   endgroup
  
//   initial begin
//     c_group cg=new();
//     cg.sample;
//     $display("coverage--%0f",cg.get_coverage);
//   end
  
  initial begin
    mail=new();
    tt=new(intff,mail);
    fork
      tt.mem();
      tt.t();
    join
  end
  
  initial begin
   intff.clk <=0;
    intff.reset <=1;
    intff.w_en <=0;
    intff.r_en <=0;
    #5;
     intff.reset <=0;
    intff.w_en <=1;
    intff.r_en <=0;
    #25;
    intff.reset <=0;
    intff.w_en <=0;
    intff.r_en <=1;
  end
  initial begin
    $monitor("t--%0d clk--%0d reset--%0d  w_en--%0d r_en--%0d data_in--%0d data_out--%0d full--%0d empty--%0d",$time,intff.clk,intff.reset,intff.w_en,intff.r_en,intff.data_in,intff.data_out,intff.full,intff.empty);
    #150
    $finish();
  end
  always #5intff.clk=~intff.clk;
endmodule
  
  
  
  
  
  
