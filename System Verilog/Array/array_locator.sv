module array_locator;
  int q[$]={1,3,5,7}, tq[$];
  int d[]={9,1,8,3,4};
  int f[6]={1,6,2,6,8,6};
  initial begin
    $display(q.sum, q.product);
    tq=q.min;
    $display(tq);
    tq=q.max;
    $display(tq);
    tq=d.max;
    $display(tq);
    tq=f.unique;
    $display(tq);
    tq=d.find with (item>3);
    $display(tq);
    tq=d.find_index with (item>4);
    $display(tq);
  end
endmodule
