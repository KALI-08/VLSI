module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
 wire [7:0] minab,mincd;
    assign minab=(a>b)?b:a;
    assign mincd=(c>d)?d:c;
    assign min=(minab>mincd)?mincd:minab;
    // assign intermediate_result1 = compare? true: false;

endmodule
