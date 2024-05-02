class address;
  bit [7:0]addr;
  bit [7:0]data;
  function new();
    addr=8'd23;
    data=8'd12;
  endfunction
  function address copy();
    copy=new();
    copy.addr=this.addr;
    copy.data=this.data;
  endfunction
endclass

class packet;
  bit [7:0]adr;
  bit[7:0]datas;
  address ar;
  function new();
    adr=8'hab;
    datas=8'd10;
    ar=new();
  endfunction
  function void display();
    $display("------------------------");
    $display("adr=%0d",adr);
    $display("datas=%0d",datas);
    $display("addr=%0d",ar.addr);
    $display("data=%0d",ar.data);
    $display("------------------------");
  endfunction
  function packet copy();
    copy=new();
    copy.adr=this.adr;
    copy.datas=this.datas;
  endfunction
endclass

module sample;
  packet pk1,pk2;
  initial begin
    pk1=new();
    pk1.display();
    pk2=new();
    pk2.display();
    pk2.ar.data=8'd14;
    pk2.display();
    pk1.adr=8'h10;
    pk1.display();
  end
endmodule
