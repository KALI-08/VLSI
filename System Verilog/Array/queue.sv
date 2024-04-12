// Code your testbench here
// or browse Examples
module queue;
  int q[$]={0,2,4,6};
  initial begin
    
    q.insert(1,1);
    $display(q);
    
    q.delete(3);
     $display(q);
    
    q.pop_back;
     $display(q);
    
    q.pop_front;
     $display(q);
    
    q.push_front(8);
     $display(q);
    
    q.push_back(9);
     $display(q);
    
    q.sort;
     $display(q);
    
    q.rsort;
     $display(q);
    
    q.shuffle;
     $display(q);
    
    q.reverse;
     $display(q);
  end
endmodule
