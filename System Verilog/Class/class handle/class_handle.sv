class room;
  bit light;
  int fan;
  string switch;
  task electricity;
    switch="OFF";
    $display("power supply is off");
  endtask
endclass
  
  module hotel;
    room r1;
    initial begin
     // r1=new();
      $display("handle is created");
      $display("lets check obeject is created or not");
      if(r1==null) begin
        $display("object is empty");
      end 
      else begin
        $display("object is full");
      end
    end
  endmodule
