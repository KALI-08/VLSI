// Code your testbench here
// or browse Examples
class process1;
  //string name;
  static bit[7:0] data;
  static string name;
  function void display();
    $display("data is %0d name is  %0s",data,name);
  endfunction
endclass

module top;
  initial begin
    process1 pr1;
    pr1=new();
    process1::data=8'b00001111;
    process1::name="ZYXW";
   // process1::name="ZYXW";
    pr1.display();
  end
endmodule
