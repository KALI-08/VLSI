module half_adder_tb;
  reg A,B;
  wire s,c;  
//instantiate the half adder module
  half_adder halfadder(.A(A),.B(B),.sum(s),.carry(c)); //ordered instant
//dump waveform information
  initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(1, half_adder_tb);
    $monitor("A=%0d B=%0d s=%0d c=%0d",A,B,s,c);
  end
//apply input values
  initial begin
    A=1'b0 ; B=1'b0;
    #10
    A=1'b0 ; B=1'b1;
    #10
    A=1'b1 ; B=1'b0;
    #10
    A=1'b1 ; B=1'b1;
    #10
    $finish;
  end
endmodule
