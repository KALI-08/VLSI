
`include "uvm_macros.svh";
import uvm_pkg::*;

`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"
`include "test.sv"

module top;
  ha_intf vif();
  //ha_test test(vif);
  
  half_adder ha(
    .a(vif.a),
    .b(vif.b),
    .sum(vif.sum),
    .carry(vif.carry)
  );
  
  initial begin
    vif.a=0;vif.b=0;
    #10
     vif.a=0;vif.b=1;
    #10
     vif.a=1;vif.b=0;
    #10
     vif.a=1;vif.b=1;
    #10;
  end
    
  initial
    $monitor("a--%0b b--%0b sum--%0b carry--%0b",vif.a,vif.b,vif.sum,vif.carry);
endmodule
