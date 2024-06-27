class cls_room;
  string name;
  int roll_no;
  task students;
    name="RAGHUL";
    roll_no=1234;
  endtask
endclass

module school;
  initial begin
    cls_room cls1=new();
    cls1.students;
    $display("student_name=%0s  roll_no=%0d",cls1.name,cls1.roll_no);
    cls1.name="AGARAN";
    cls1.roll_no=231;
    $display("student_name=%0s  roll_no=%0d",cls1.name,cls1.roll_no);
  end
endmodule
