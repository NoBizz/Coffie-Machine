module printsqrt (input RESET, PREVIOUS, NEXT,CLK, input [31:0] N , input [31:0] DELTA ,input [31:0] i);

    wire [63:0] m;
    
    sqrt math(RESET, PREVIOUS, NEXT, CLK, N, DELTA ,m);

    always @(posedge CLK) begin
   
    if(i < 200) begin
    
        $display("m = %f", m);
        
        end
    end
    
endmodule
