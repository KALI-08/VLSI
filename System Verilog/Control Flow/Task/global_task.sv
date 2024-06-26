task mul(input int a,input int b,output int c);
  c=a*b;
endtask

module example;
  int x=5,y=6,res;
  initial begin
    mul(x,y,res);
    $display("mul=%0d",res);
  end
endmodule

module example_2;
  int r;
  initial begin
    mul(3,9,r);
  end
endmodule
