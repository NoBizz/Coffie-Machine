`timescale 1ns/10ps

module motor_if_tb;


reg clk;
reg emergancy;
reg move;
reg [63:0] distance;
wire c;
wire [31:0] steps;


integer i;

initial begin
    
    
    clk = 0;
    emergancy = 0;
    move = 1;
    distance = 5'd0800;
   
    
    $dumpfile("motor_if_tb.vcd");
    $dumpvars;

    for(i = 0; i <= 8000 ; i = i+1)begin
    
    clk = ~clk; #10;
    
    end    
    
end


    motor_if motoracceleration(move, emergancy, clk, 200,steps, c );
    steppermotor motor(move, move, c, 200, steps);


endmodule
