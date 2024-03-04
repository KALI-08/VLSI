module small_num;
  reg [7:0]z[0:9];
  reg [7:0]smal;
  integer i;
  initial
  begin
    z[0]=8'b11110000;
    z[1]=8'b11001100;
    z[2]=8'b10101010;
    z[3]=8'b10010010;
    z[4]=8'b11001110;
    z[5]=8'b10011000;
    z[6]=8'b11111100;
    z[7]=8'b00000010;
    z[8]=8'b00110010;
    z[9]=8'b00111110;
    smal=z[0];
    for(i=0;i<9;i=i+1)
      begin
        if(z[i]<smal)
          smal=z[i];
        end
  end
  initial begin
    $display("The Smallest Number in the given Array is:%b",smal);
  end
endmodule
