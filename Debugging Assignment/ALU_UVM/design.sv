module alu (
  input [3:0] a, b,
    input [1:0] op,
  output reg [3:0] result
);
    always @(*) begin
        case (op)
            2'b00: result = a + b; // Addition
            2'b01: result = a - b; // Subtraction
            2'b10: result = a & b; // AND
            2'b11: result = a | b; // OR
            default: result = 8'b0;
        endcase
    end
endmodule


