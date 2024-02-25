module comparator_tb;
reg [3:0] A, B;
wire AeqB, AgtB, AltB;
comparator comparator(A, B, AeqB, AgtB, AltB);
  always #5 B=$random%16;
always #5 A=$random%16;

  initial begin
    $dumpfile("comparator.vcd");
    $dumpvars(1,comparator_tb);
    $monitor($time, "A=%b , B=%b, AeqB=%b, AgtB=%b, AltB=%b", A,B, AeqB, AgtB, AltB);
  end
  initial begin
    A=4'b0000;
    B=4'b0000;
    #20 
    $finish;
  end
endmodule
