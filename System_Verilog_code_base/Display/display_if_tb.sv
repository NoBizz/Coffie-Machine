`timescale 1ns/10ps 

module display_if_tb;

 reg [7:0] bcd = 0;
 reg [3:0] bcdtwo,enable_segment;
 wire [15:0] seg;
 wire [15:0] segtwo;
 wire connection;


 initial begin
 
  
   $dumpfile("display_if_tb.vcd");
   $dumpvars;

   enable_segment = 1;
    
   
   bcd = 2'd55;

   #50 $stop;
   
  
 end
  
 display_if display1(bcd[3:0],enable_segment,seg);
 display_if display2(bcd[7:4],enable_segment,segtwo);

 endmodule
