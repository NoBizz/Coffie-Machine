module beep(input clk, enable, output reg Y);

reg [5:0] delay;

always @(posedge clk) begin
    
    if(enable) begin
        
        delay = delay + 1;
        
        if(delay == 50) Y = 1;
        
    end
    
    else begin
     
    delay = 0; 
    Y = 0;
    
    end
    
end

endmodule
