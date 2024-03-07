module mealy_11011(
  input clk,reset,in,
  output out,present,next);
  reg out;
  reg [2:0]present,next;
  
  
  parameter [4:0] s0=3'b000,
  s1=3'b001,
  s2=3'b010,
  s3=3'b011,
  s4=3'b100;
  
  
  always @ (posedge clk) begin
    if(reset==1)
      present<=s0;
  else
      present<=next;
  end
  
  
  always @(present,in) begin
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
          if(in==1)
            next=s2;
         else
            next=s0;
        end
      s2:
        begin
          out=0;
          if(in==0)
            next=s3;
         else
            next=s2;
          end
      s3:
        begin
          out=0;
          if(in==1)
            next=s4;
         else
        next=s0;
        end
      s4:
        begin
          if(in==1) begin
            next=s0;
          out=1;
        end
         else
           begin
            next=s0;
          out=0;
        end
      end
    endcase
  end
endmodule
