class cls_room;
  string name;
  int roll_no;
  function void students();
     string name="RAGHUL";
     int roll_no=1234;
    this.name=name;
    this.roll_no=roll_no;
   
  endfunction
  //function xyz();
endclass

module school;
  initial begin
    cls_room cls1=new();
    
   cls1.students;
    $display("student_name=%0s  roll_no=%0d",cls1.name,cls1.roll_no);


   end
endmodule
