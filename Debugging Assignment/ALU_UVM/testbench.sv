`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface.sv"
`include "alu_transaction.sv"
//`include "sequence.sv"
//`include "sequencer.sv"
`include "alu_driver.sv"
`include "alu_monitor.sv"
`include "alu_env.sv"
`include "alu_test.sv"

//`include "agent.sv"
module tb_top_module;
  alu_test test;
  alu_if vintf();
    alu dut (
        .a(vintf.a),
        .b(vintf.b),
        .op(vintf.op),
        .result(vintf.result)
    );

initial begin
  uvm_config_db#(virtual alu_if)::set(null,"","vintf",vintf);
    run_test("alu_test");
end

endmodule

