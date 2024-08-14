// Code your testbench here
// or browse Examples
`include "uvm_macros.svh";
import uvm_pkg::*;

`include "interface.sv"
`include "seq_item.sv"
`include "seq.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"
`include "test.sv"

module top;
  logic clk;
  dff_intf intf(.clk(clk));
  
  dff dut(.clk(intf.clk),
          .rst(intf.rst),
          .d(intf.d),
          .q(intf.q)
         );
  
  initial begin
    uvm_config_db#(virtual dff_intf)::set(null,"*","vif",intf);
  end
  
  initial begin
    clk=0;
//     intf.rst=1;
//     #10
//     intf.rst=0;
//     intf.d=0;
//     #50
//     intf.d=1;
    $monitor("t--%0d,clk--%0b d--%0b q--%0b",$time,intf.clk,intf.d,intf.q);
    #500
    $finish;
  end
  
  always #10 clk=~clk;
  
  initial begin
    run_test("dff_test");
  end
  
endmodule
