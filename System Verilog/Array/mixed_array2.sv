module mixed_array2;  
  logic [8:0]v[7:0];
  initial begin
    v[0]='ha8;
    $display(v);
    v[6][3:0]='h8;
    $display(v);
    v[5][3:0]='ha;
    $display(v);
    v[0][3:0]=1;
    $display(v);
    v[1]='b11111111;
    $display(v);
  end
endmodule
