`timescale 1ns/10ps

module steppermotor_tb;

reg clk,dir,enable,reset;
integer i;

initial begin
  
  $dumpfile("steppermotor_tb.vcd");
  $dumpvars;
    
  clk = 0;
  dir = 1;
  enable = 0;

  for(i = 0; i < 1000; i = i+1) begin
    if(i > 9)begin
      enable = 1;
    end 
    if(i > 111) begin
        dir = 0;
        if( i < 131 && i > 111)begin
            enable = 0;
        end
    end
    clk = ~clk; #10;
    
  end
end
  steppermotor motor(dir,enable,clk,200);

endmodule
