module moore_1010(
  input in,clk,reset,
  output out,present,next);
  reg out;
  reg [2:0]present,next;
  
  parameter [4:0] s0=3'b000,
                  s1=3'b001,
                  s2=3'b010,
                  s3=3'b011,
                  s4=3'b100;
  always @ (posedge clk)
    begin
    if(reset==1)
      present<=s0;
    else
      present<=next;
    end
  always @(present,in)
    begin
    case(present)
      s0:
        begin
          out=0;
          if(in==1)
            next=s1;
          else
            next=s0;
        end
      s1:
        begin
          out=0;
          if(in==0)
            next=s2;
          else
            next=s1;
        end
      s2:
        begin
          out=0;
          if(in==1)
            next=s3;
          else
            next=s0;
        end
      s3:
        begin
          out=0;
          if(in==0)
            next=s4;
          else
            next=s1;
        end
      s4:
        begin
          out=1;
          if(in==1)
            next=s1;
          else
            next=s0;
        end
    endcase
    end
endmodule
