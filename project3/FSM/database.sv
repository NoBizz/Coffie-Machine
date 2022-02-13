module database(input clk, enable, input [3:0] code, output reg done);

    reg [3:0] ROM[15:0];
    reg [3:0]checksum = 0;

    always @(clk) begin
      
      if(enable)begin
            ROM[0] = 4'b0000;   //wasser
            ROM[1] = 4'b0001;   //cola
            ROM[2] = 4'b0010;   //orange
            ROM[3] = 4'b0011;   //zitrone
            ROM[4] = 4'b0100;   //tee
            ROM[5] = 4'b0101;   //kaffe
            ROM[6] = 4'b0110;   //cappucino
            ROM[7] = 4'b0111;   //latte macchiato
            ROM[8] = 4'b1000;   //wasser mit eis
            ROM[9] = 4'b1001;   //cola mit eis
            ROM[10] = 4'b1010;  //orange mit eis
            ROM[11] = 4'b1011;  //zitrone mit ein
            ROM[12] = 4'b1100;  //tee mit zucker
            ROM[13] = 4'b1101;  //kaffe mit zucker
            ROM[14] = 4'b1110;  //cappucino mit zucker
            ROM[15] = 4'b1111;  //latte macchiato mit zucker
            
            
            if(checksum == 15) begin
                checksum <= 0;
            end 
            else begin
            
                checksum  = checksum + 1;
            end
            
            if(code == ROM[checksum]) done = 1;
            else done  = 0;
                
            
        end
    end

endmodule
