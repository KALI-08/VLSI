module mixed;
  logic [31:0]v[7:0];
  initial begin
    v[0]='hffffffff;
    $display(v);
    v[6][31:8]='h11111111;
    $display(v);
    v[5][15:0]='hab_cd;
    $display(v);
    v[0][3:0]=1;
    $display(v);
  end
endmodule
