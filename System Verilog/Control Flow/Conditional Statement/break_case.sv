module break_case;
  int a[10];
  initial begin
    foreach (a[i]) 
      if(i==8) begin
        $display("-----break-----");
        break;
      end
    else begin
    a[i]=i;
      $display("a[%0d]=%0d",i,a[i]);
    end
  end
endmodule
