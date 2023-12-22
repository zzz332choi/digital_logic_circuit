module _register3_r(clk, reset_n, d, q);
	
	input clk, reset_n; 	// input ports
	input [2:0] d; 		// 3bit input port
	output [2:0] q;		// 3bit output port 
	
	_dff_r_async U0(.clk(clk), .reset_n(reset_n), .d(d[0]), .q(q[0])); 	// register
	_dff_r_async U1(.clk(clk), .reset_n(reset_n), .d(d[1]), .q(q[1]));	// register
	_dff_r_async U2(.clk(clk), .reset_n(reset_n), .d(d[2]), .q(q[2]));	// register
	

endmodule
