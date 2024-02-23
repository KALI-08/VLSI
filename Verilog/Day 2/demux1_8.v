module demux1_8(
  input d,s0,s1,s2,
  output y1,y2,y3,y4,y5,y6,y7,y8);
  wire
  x,y,z;
  not (x,s0),(y,s1),(z,s2);
  and a1(y1,d,x,y,z);
  and a2(y2,d,x,y,s2);
  and a3(y3,d,x,s1,z);
  and a4(y4,d,x,s1,s2);
  and a5(y5,d,s0,y,z);
  and a6(y6,d,s0,y,s2);
  and a7(y7,d,s0,s1,z);
  and a8(y8,d,s0,s1,s2);
endmodule
