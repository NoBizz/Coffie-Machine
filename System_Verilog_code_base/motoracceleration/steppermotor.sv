module steppermotor(input dir,enable,pulse, input wire signed [31:0] distance,output reg [31:0] stp);



      //coils
reg A,B,C,D;
reg [31:0] steps = 0;
      //step position
reg [3:0] p = 0;
reg [31:0] truedistance = ((200 * 2) / (2 * 8));

  always @(pulse) begin
    
      
    if(steps != truedistance) begin

  

    if(p == 4 ) begin
    
        p = 0;
        steps = steps + 1;
        stp = steps;
    
    end

    if(enable && dir) begin
        
       case(p)
        
          0 : {A, B, C, D} = {1'd1,1'd0,1'd0,1'd1};
          1 : {A, B, C, D} = {1'd1,1'd1,1'd0,1'd0};
          2 : {A, B, C, D} = {1'd0,1'd1,1'd1,1'd0};
          3 : {A, B, C, D} = {1'd0,1'd0,1'd1,1'd1};

          default: {A, B, C, D} = {1'd0,1'd0,1'd0,1'd0};
       endcase
     end 
    
     if(enable && ~dir) begin
        
        case(p)
        
          0 : {D, C, B, A} = {1'd1,1'd0,1'd0,1'd1};
          1 : {D, C, B, A} = {1'd1,1'd1,1'd0,1'd0};
          2 : {D, C, B, A} = {1'd0,1'd1,1'd1,1'd0};
          3 : {D, C, B, A} = {1'd0,1'd0,1'd1,1'd1};
          
            default: {A, B, C, D} = {1'd0,1'd0,1'd0,1'd0};
        endcase
        
     end 
    end   
     if(~enable || steps == distance) begin
     
        {A ,B ,C ,D} = {1'd0,1'd0,1'd0,1'd0};
        p = 0;
        
     end 
    p = p+1;
  end

endmodule
