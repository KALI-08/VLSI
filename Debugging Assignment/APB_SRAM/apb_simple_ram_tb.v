`timescale 1ns/1ps

module tb_apb_simple_ram;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4; //we can give 10 here if repeat is 20

    // APB Signals
    reg PCLK;
    reg PRESETn;
    reg PSEL;
    reg PENABLE;
    reg PWRITE;
    reg [ADDR_WIDTH-1:0] PADDR;
    reg [DATA_WIDTH-1:0] PWDATA;
    wire [DATA_WIDTH-1:0] PRDATA;
    wire PREADY;
    wire PSLVERR;

    // Error tracking and verification variables
    integer error_count;
    reg test_passed;
    integer num_tests;
    integer i;

    // Arrays to store address/data for verification
    reg [ADDR_WIDTH-1:0] addr_store[0:19];  
    reg [DATA_WIDTH-1:0] data_store[0:19];  
    reg [DATA_WIDTH-1:0] read_data;

    // Expected data variable
    reg [DATA_WIDTH-1:0] expected_data;

    // Instantiate the DUT
    apb_simple_ram #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) dut (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(PREADY),
        .PSLVERR(PSLVERR)
    );

    // Clock generation
    always #5 PCLK = ~PCLK;

    // Task for write operation
    task apb_write(input [ADDR_WIDTH-1:0] address, input [DATA_WIDTH-1:0] data);
        begin
            PSEL = 1;
            PENABLE = 0;
            PWRITE = 1;
            PADDR = address;
            PWDATA = data;
            @(posedge PCLK);
            PENABLE = 1;
            @(posedge PCLK);
            while (!PREADY) @(posedge PCLK);
            PSEL = 0;
            PENABLE = 0;
            $display("DEBUG: Writing Addr=%h, Data=%h", address, data);
        end
    endtask

    // Task for read operation
    task apb_read(input [ADDR_WIDTH-1:0] address, output [DATA_WIDTH-1:0] data_out);
        begin
            PSEL = 1;
            PENABLE = 0;
            PWRITE = 0;
            PADDR = address;
            @(posedge PCLK);
            PENABLE = 1;
            @(posedge PCLK);
            while (!PREADY) @(posedge PCLK);
            data_out = PRDATA;
            PSEL = 0;
            PENABLE = 0;
            $display("DEBUG: Reading Addr=%h, Data=%h", address, data_out);
        end
    endtask

    // VCD Dump
    initial begin
        $dumpfile("tb_apb_simple_ram.vcd");
        $dumpvars;
    end

    initial begin
        // Initialization
        PCLK = 0;
        PRESETn = 0;
        PSEL = 0;
        PENABLE = 0;
        PWRITE = 0;
        PADDR = 0;
        PWDATA = 0;
        test_passed = 1;
        error_count = 0;
        num_tests = 5;

        // Reset the DUT
        #20 PRESETn = 1;
        
        // Test Case 1: Write and Read without wait states
        $display("Test Case 1: Write and Read without wait states");
        apb_write(4'h0, 8'hAA);
        @(posedge PCLK);
        @(posedge PCLK);

        apb_read(4'h0, expected_data);
        if (expected_data == 8'hAA) begin
            $display("PASS: Cycle=%0t | Addr=0x0 | Data=%h", $time, expected_data);
        end else begin
            $display("FAIL: Cycle=%0t | Addr=0x0 | Expected=0xAA | Received=%h", $time, expected_data);
            test_passed = 0;
        end

        // Test Case 2: Randomized Stimulus
        $display("Test Case 2: Randomized Stimulus");

        // Perform random writes
        for (i = 0; i < num_tests; i = i + 1) begin
            addr_store[i] = $random % (1 << ADDR_WIDTH);  // Generate random address
            data_store[i] = $random % (1 << DATA_WIDTH);  // Generate random data

            apb_write(addr_store[i], data_store[i]);  // Write operation
            repeat(2) @(posedge PCLK);  // Ensure stability before reading

            $display("DEBUG: Stored Addr=%h, Data=%h", addr_store[i], data_store[i]);
        end

        // Perform reads and compare
        for (i = 0; i < num_tests; i = i + 1) begin
            apb_read(addr_store[i], read_data);  // Read operation

            if (read_data !== data_store[i]) begin
                $display("FAIL: Cycle=%0t | Addr=%h | Expected=%h | Received=%h", 
                         $time, addr_store[i], data_store[i], read_data);
                $display("DEBUG: Re-reading Addr=%h", addr_store[i]);
                apb_read(addr_store[i], read_data);  // Read again to confirm issue
                $display("DEBUG: Re-read value: %h", read_data);
                error_count = error_count + 1;
            end else begin
                $display("PASS: Cycle=%0t | Addr=%h | Data=%h", $time, addr_store[i], read_data);
            end
        end

        // Final verification status
        if (error_count == 0) begin
            $display("Random Test: ALL TESTS PASSED!");
        end else begin
            $display("Random Test: %0d TESTS FAILED!", error_count);
            test_passed = 0;
        end

        $finish;
    end
endmodule
