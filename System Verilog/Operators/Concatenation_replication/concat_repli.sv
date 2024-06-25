module con_repli;
  string a,b,c;
  initial begin
    a="MADURAI";
    b="KAMBAM";
    $display("a=%0s | b=%0s",a,b);
    c={a,b}; //concatenation
    $display("c=%0s",c);
    c={{3{a}},b};//replication
    $display("c=%0s",c);
  end
endmodule
