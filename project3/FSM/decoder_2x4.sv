module decoder_2x4(input wire [1:0] ps, output wire[3:0]y);

assign y[0] = (~ps[0]) & (~ps[1]);
assign y[1] = (~ps[0]) & ps[1];
assign y[2] = ps[0] & (~ps[1]);
assign y[3] = ps[0] & ps[1];

endmodule
