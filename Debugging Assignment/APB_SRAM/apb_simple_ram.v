module apb_simple_ram #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 4) (
    // APB Interface
    input wire PCLK,                  // APB Clock
    input wire PRESETn,               // APB Reset (Active Low)
    input wire PSEL,                  // APB Select
    input wire PENABLE,               // APB Enable
    input wire PWRITE,                // APB Write Enable
    input wire [ADDR_WIDTH-1:0] PADDR, // APB Address
    input wire [DATA_WIDTH-1:0] PWDATA, // APB Write Data
    output reg [DATA_WIDTH-1:0] PRDATA, // APB Read Data
    output reg PREADY,                // APB Ready Signal
    output wire PSLVERR               // APB Slave Error (Always 0 for simplicity)
);

    // Internal Signals for RAM Interface
    wire wr_en;                        // Write Enable for RAM
    wire [ADDR_WIDTH-1:0] addr;        // Address for RAM
    wire [DATA_WIDTH-1:0] din;         // Data input to RAM
    wire [DATA_WIDTH-1:0] dout;        // Data output from RAM

    // Assign RAM signals
    assign wr_en = PSEL && PENABLE && PWRITE; // Assert write enable when APB write transaction is active
    assign addr = PADDR;                      // Map APB address to RAM address
    assign din = PWDATA;                      // Map APB write data to RAM data input

    // APB Read and Write Logic
    always @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn) begin
            PRDATA <= 0; // Clear read data on reset
            PREADY <= 0; // Default not ready on reset
        end else begin
            if (PSEL && PENABLE) begin
                if (PWRITE) begin
                    // Write transaction
                    PREADY <= 1; // Indicate ready for write transaction
                end else begin
                    // Read transaction
                    PRDATA <= dout; // Capture data from RAM
                    PREADY <= 1;    // Indicate ready for read transaction
                end
            end else begin
                PREADY <= 0; // Default not ready when no transaction is active
            end
        end
    end

    // No Slave Error
    assign PSLVERR = 0; // Always indicate no error

    // Instantiate the Simple SRAM
    simple_sram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) u_simple_sram (
        .clk(PCLK),        // Connect APB clock to RAM clock
        .rst(~PRESETn),    // Convert active low reset to active high
        .wr_en(wr_en),     // Connect write enable signal
        .addr(addr),       // Connect address signal
        .din(din),         // Connect data input
        .dout(dout)        // Connect data output
    );

endmodule
