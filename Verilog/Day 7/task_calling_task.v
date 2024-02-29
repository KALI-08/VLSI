task add (input [7:0]a,b,output int c);
  begin
    c=a+b;
    $display("c=%0d",c);
  end
endtask
task multi (input [7:0]a,b,output int c);
      begin
        c=a*b;
        $display("c=%0d",c);
      end
endtask
task arithmetic;
  output int c;
 multi(5,7,c);
    add(4,7,c);
endtask

module sum;
  int c;
  initial begin
   
   // arithmetic;
    add(4,7,c);
  end
endmodule
