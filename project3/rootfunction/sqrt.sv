module sqrt(input RESET, PREVIOUS, NEXT,CLK, input [31:0] N , input [31:0] DELTA , output reg [63:0] m);
//input [31:0] H, input [31:0] L , input [31:0] N , input [31:0] DELTA , output reg [63:0] m);

    //internal 

    reg done;    
    
    
    reg [31:0] sqrt;
    reg [31:0] h;
    reg [31:0] l;
    reg [31:0] n;
    reg [31:0] delta;
    reg [4:0]  iterations;
    reg [63:0] current_sqrt;
    //reg [63:0] m;
    always @(posedge CLK) begin
        
        // apply variables initialize when PREVIOUS and NEXT are both 1
        if(PREVIOUS && NEXT) begin
         
            n = N;
            delta = DELTA;    
            iterations = 0;
            done = 0;
            sqrt = n;
            
        end
        
        if(~done) begin
        
        current_sqrt = (h + l)/2;
        
        //begin logic
        if(delta >= 2*(-16)) begin
            
            if(current_sqrt * current_sqrt > n) begin
                        
                    h = current_sqrt;
                    n = N; 
                    delta = delta / 2;
            
            end else begin
                    
                    l = current_sqrt;
                    n = N; 
                    delta = delta / 2;    
                    
            end
      
        end
        
        
        //stops after 16 iterations
        if(iterations == 17) begin
  
            done = 1;
            iterations = 0;
            
        end
        
         //reset signal
        if(RESET) begin
            
            sqrt = 1;
            done = 1;
            delta = 1;
            current_sqrt = 1;
        
        end
             if(NEXT) begin
            
             h = sqrt + delta;
             l = sqrt;
             n = n+1;
             delta = delta;
             sqrt = (n+1);
             
        end
        
        if(PREVIOUS) begin
            
            h = sqrt;
            l = sqrt - delta;
            n = n - 1;
            delta = delta;
            
            sqrt = (n-1);
        
        end
         m = current_sqrt; 
            
         iterations = iterations +1; 
         
       end
              
    end

endmodule
