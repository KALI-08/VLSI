class room;
  bit fan;
  bit light;
  string name;
  
  task current;
    fan=0;
    light=1;
    name="room_no.12";
  endtask
endclass

module home;
  initial begin
  room r;
  r=new();
  r.current;
    $display("In room fan=%0d  light=%0d  room_no=%0s",r.fan,r.light,r.name);
  end
endmodule
