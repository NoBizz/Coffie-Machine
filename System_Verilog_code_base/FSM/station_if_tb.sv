`timescale 1ns/10ps
module station_if_tb;

reg [3:0] code;
reg clk,reset,enable;
wire Y;

integer i;

    initial begin
    
        code = 4'b1101;
        clk = 0;
        reset = 0;
        enable = 1;
        
        $dumpfile("station_if_tb.vcd");
        $dumpvars;
    
        for(i = 0 ; i < 500 ; i = i +1)begin
            clk = ~clk; #10;
        end
    
       
    end
    
   
    station_if uut(reset,clk,enable,code,Y);

endmodule
