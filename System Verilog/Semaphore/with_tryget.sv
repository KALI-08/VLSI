module semaphore;
  semaphore rental_bike=new(5);
  task person_a;
    $display("time=%0d before person_1 got bike",$time);
    rental_bike.get(5);
    $display("time=%0d after person_1 got bike",$time);
    #10
    $display("time=%0d before person_1 return bike",$time);
    rental_bike.put(5);
    $display("time=%0d after person_1 return bike",$time);
  endtask
  
   task person_b;
    $display("time=%0d before person_2 got bike",$time);
    rental_bike.get(4);
    $display("time=%0d after person_2 got bike",$time);
    #5
    $display("time=%0d before person_2 return bike",$time);
    rental_bike.put(4);
    $display("time=%0d after person_2 return bike",$time);
  endtask
  
  task person_c;
    $display("time=%0d before person_3 got bike",$time);
    rental_bike.try_get(5);
    $display("time=%0d after person_3 got bike",$time);
    #7
    $display("time=%0d before person_3 return bike",$time);
    rental_bike.put(5);
    $display("time=%0d after person_3 return bike",$time);
  endtask
  initial begin
    fork
    person_a;
    person_b;
    person_c;
    join
  end
endmodule
