module dynamic;
  int d1[];
  int d2[];
  int d3[]={2,4,6};
  
  initial begin
    d1=new[9];
    d2=new[7];
    foreach (d1[i])
      begin
        d1[i]=i;
      end
    foreach(d2[i])
      begin
        d2[i]=i;
      end
    $display(d1,d2);
    $display(d1.size);
    $display(d2.size);
    d3.sort;
    $display(d3);
    d1.sort;
    $display(d1);
    d2.reverse;
    $display(d2);
    d3.rsort;
    $display(d3);
    d3.shuffle;
    $display(d3);
  end
endmodule
    
