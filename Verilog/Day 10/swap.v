module swap;
  int a,b,temp;
    initial begin
    a=24;
    b=10;
  end
  initial begin
    temp=a;
    a=b;
    b=temp;
  end

  initial 
    $display("a=%d b=%d",a,b);
endmodule
