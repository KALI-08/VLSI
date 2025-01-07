`include "interface.sv"
`include "transaction.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"


module tb_top_module;
    logic clk;

    alu_if alu_if_inst(clk);

    alu dut (
        .a(alu_if_inst.a),
        .b(alu_if_inst.b),
        .op(alu_if_inst.op),
        .result(alu_if_inst.result)
    );

    environment env(alu_if_inst);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    
        test tb();
    
endmodule
