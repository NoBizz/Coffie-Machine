`timescale 1ns/10ps

module sensor_if_tb;

reg sens_active,reset,clk;
wire passed;

integer i;

initial begin

  $dumpfile("sensor_if_tb.vcd");
  $dumpvars;


  sens_active = 1;
  reset = 0;
  clk = 0;

  for(i = 0 ; i < 5000 ; i = i+1) begin
    clk = ~clk; #10;
    if(i >= 400 && i <= 410)begin
        reset = 1;
      end else begin
        reset = 0;
      end
      if (i >= 1000)begin
        sens_active = 0;
      end

  end
  
end

sensor_if sensor(sens_active,reset,clk,passed);

endmodule
