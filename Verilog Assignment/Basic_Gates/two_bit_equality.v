module top_module (input reg[1:0]A,
                   input reg[1:0]B, 
                   output reg z ); 
    always @(*) begin

        if(A==B)
            z=1;
        else
            z=0;
    end
    
endmodule
