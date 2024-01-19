module motor_if(input move, emergancy, clk, input [63:0] distance, input [31:0] steps, output clk_out);

reg [7:0] counter = 0;
reg pulse, next, previous, reset, enable;
reg [31:0] n;
reg [31:0] delta;

wire [63:0] delay;

//distance calculatios
reg [31:0] truedistance = ((200 * 2) / (2 * 8));

//reset timer
reg [7:0] resettime = 0;

    // the counter counts to 20 this is  a compleatly arbitrary number
    // it is just easier to work with it
    
    
    always @(posedge clk) begin

        //initializer
        if(move) begin
            
   
            
            // (steps per rebolution * microsteping factor) / (pitch * number of teeth) per milimeter
            
            // enable math
            n = 2'd01;
            delta = 4'b000_1;
            
            reset = 0;
            
        //calculate smothness
            if (resettime <= 5) begin
             next = 1; previous = 1;
             enable = 1;
            end 
            
            else begin
 
            if(steps > (truedistance)) begin 
                next = 0; previous = 1;
                end else begin
                 next = 1; previous = 0;
                end
                           
            end
                    
            if (counter <= 50) counter <= counter + 1; 
            else counter <= 0; 
            
            if (counter < delay) pulse = 1;
            else pulse = 0;
            
      end
      
      if(resettime < 6) begin
        resettime = resettime + 1;
      

      end
      
      if(steps == (truedistance - 5))begin
        resettime = 0;
      end
      
    end
    
      sqrt math(reset, previous,next, clk, n, delta, delay);
      assign clk_out = pulse;
    
endmodule
