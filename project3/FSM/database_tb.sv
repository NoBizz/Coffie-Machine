`timescale 1ns/10ps

module database_tb;


    reg[3:0] code;
    reg clk;
    integer i ;
    wire out;
    reg enable;
    
    initial begin
    
        clk = 0;
        enable  = 0;
        
        $dumpfile("database_tb.vcd");
        $dumpvars;
        
   
        code = 4'b1110;     
    
    
        for(i = 0 ; i < 100 ; i++)begin
         clk = ~clk; #10;
        end
    
    end
        
        database db( clk,enable,code,out);

endmodule
