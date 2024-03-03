module clock(
  output reg clock);
  initial begin
    clock=0;
    #10 $finish;
    end
   
  initial begin
    repeat(4) begin 
        #2 clock=~clock;
        end
  end
