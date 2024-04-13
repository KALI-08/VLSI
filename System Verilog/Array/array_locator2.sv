module array_locator;
  int q[$]={1,2,3,4,5,6,7,8};
  int d[]={0,2,4,6,8};
  int f[8]={1,2,3,4,5,4,3,2};
  int tq[$];
  initial begin
    $display("1)queue sum is",q.sum);
    $display("2)queue sum is",q.product);
    $display("3)queue sum is",d.product);
    $display("4)queue sum is",d.sum);
    tq=q.min;
    $display("5)",tq);
    tq=q.max;
    $display("6)",tq);
    tq=d.min;
    $display("7)",tq);
    tq=d.max;
    $display("8)",tq);
    tq=d.find_index with(item>3);
    $display("9)",tq);
    tq=f.find_index with(item<3);
    $display("10)",tq);
    tq=d.unique;
    $display("11)",tq);
    tq=f.unique;
    $display("12)",tq);
  end
endmodule
