module simple_sram #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 4) (
    input wire clk,                   // Clock signal
    input wire rst,                   // Reset signal
    input wire wr_en,                 // Write enable signal
    input wire [ADDR_WIDTH-1:0] addr, // Address input
    input wire [DATA_WIDTH-1:0] din,  // Data input
    output reg [DATA_WIDTH-1:0] dout  // Data output
);

    // Memory array
    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    // Synchronous read and write operations
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dout <= 0; // Reset the output
        end else if (wr_en) begin
            mem[addr] <= din; // Write data to memory
        end else begin
            dout <= mem[addr]; // Read data from memory
        end
    end

endmodule
