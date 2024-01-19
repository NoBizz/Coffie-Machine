module display_if(input [3:0] bcd,enable_segment, output reg [15:0] seg);


always @(bcd,enable_segment) begin

  if(enable_segment) begin
    case(bcd)
  
      0: seg = 16'b111111110000110;
      1: seg = 16'b011000000000000; 
      2: seg = 16'b110111011100000;
      3: seg = 16'b111110011000000;
      4: seg = 16'b011000101100000;
      5: seg = 16'b101110111100000;
      6: seg = 16'b101111111100000;
      7: seg = 16'b111000100000000;
      8: seg = 16'b111111111100000;
      9: seg = 16'b111110111100000;

      default : seg = 16'b0000000000000000;
    endcase
  end
end

endmodule
