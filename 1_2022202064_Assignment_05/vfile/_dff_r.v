module _dff_r(clk, reset_n, d, q);
	
	input clk, reset_n, d; // input ports
	output q;				  // output port
	
	wire w_d;
	
	_and2 and20(.a(d), .b(reset_n), .y(w_d));				// Instance and gate
	_dff 	dff(.clk(clk), .d(w_d), .q(q), .q_bar(w0));	// Instance d flip flop 
	
endmodule
