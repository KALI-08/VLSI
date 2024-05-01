class school;
  int sl_no;
  string name;
  function new();
    sl_no=8'h12;
    name="LENOVO";
  endfunction
endclass

class section;
  bit [7:0]roll_no;
  string names;
  school sch;
  function new();
    roll_no=8'd23;
    names="ACER";
    sch=new();
  endfunction
  function void display();
    $display("roll_no=%0d",roll_no);
    $display("names=%0s",names);
    $display("sl_no=%0d",sch.sl_no);
    $display("name=%0s",sch.name);
    
  endfunction
endclass

module sample;
  section sec1,sec2;
  initial begin
    sec1=new();
    sec1.display();
    sec2=new sec1;
    $display("*******************");
    sec2.display();
    sec2.sch.name="DELL";
    $display("*******************");
    sec2.display();
      end
endmodule
