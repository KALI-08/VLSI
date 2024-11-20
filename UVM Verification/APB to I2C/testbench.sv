`include "apb_2_i2c_pkg.svh"
`include "apb_interface.sv"
`include "i2c_interface.sv"
`timescale 1ns/1ps
module top;


apb_interface apb_intf();
  i2c_interface i2c_intf();



apb_i2c
#(
  .APB_ADDR_WIDTH(`APB_ADDR_WIDTH)  //APB slaves are 4KB by default)
)
DUT
(
    .HCLK            ( apb_intf.HCLK         ),
    .HRESETn         ( apb_intf.HRESETn      ),
    .PADDR           ( apb_intf.PADDR        ),
    .PWDATA          ( apb_intf.PWDATA       ),
    .PWRITE          ( apb_intf.PWRITE       ),
    .PSEL            ( apb_intf.PSEL         ),
    .PENABLE         ( apb_intf.PENABLE      ),
    .PRDATA          ( apb_intf.PRDATA       ),
    .PREADY          ( apb_intf.PREADY       ),
    .PSLVERR         ( apb_intf.PSLVERR      ),
    .interrupt_o     ( apb_intf.interrupt_o  ),
    .scl_pad_i       ( i2c_intf.scl_pad_i    ),
    .scl_pad_o       ( i2c_intf.scl_pad_o    ),
    .scl_padoen_o    ( i2c_intf.scl_padoen_o ),
    .sda_pad_i       ( i2c_intf.sda_pad_i    ),
    .sda_pad_o       ( i2c_intf.sda_pad_o    ),
    .sda_padoen_o    ( i2c_intf.sda_padoen_o )
);
    initial begin
      uvm_config_db#(virtual apb_interface#(.APB_ADDR_WIDTH(`APB_ADDR_WIDTH)))::set(null,"*","APB_INTF",apb_intf);
      uvm_config_db#(virtual i2c_interface)::set(null,"*","I2C_INTF",i2c_intf);
      run_test("apb_2_i2c_test");
    end

    initial begin
	    apb_intf.HCLK = 0;
	    apb_intf.HRESETn = 0;
      
	    #15 apb_intf.HRESETn = 1;
      

    end
    initial begin
      $dumpfile("apb_i2c.vcd");
      $dumpvars;
    
    end
   
    assign i2c_intf.scl_pad_i = i2c_intf.scl_padoen_o;
    always #5 apb_intf.HCLK = ~apb_intf.HCLK;
  

endmodule







