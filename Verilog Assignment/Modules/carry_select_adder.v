module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0]x,y,z;
    wire cin,cin1,cin2,cout,cout1,cout2;
    assign cin=1'b0;
    assign cin1=1'b0;
    assign cin2=1'b1;
    add16 inst1(a[15:0],b[15:0],cin,x,cout);
    add16 inst2(a[31:16],b[31:16],cin1,y,cout1);
    add16 inst3(a[31:16],b[31:16],cin2,z,cout2);
    always @(*) begin
        case(cout)
            1'b0:sum={y,x};
            1'b1:sum={z,x};
        endcase
    end
endmodule
