module demux1_2(
  input d,s0,
  output i0,i1);
  wire x;
  not (x,s0);
  and a1(i0,d,x);
  and a2(i1,d,s0);
endmodule
