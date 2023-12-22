module _dff_en(clk, en, d, q);
	input clk, en, d; // input ports
	output q;			// output port
	
	wire w_d; 			// wire
	
	mx2 mx20(.d0(q), .d1(d), .s(en), .y(w_d)); // Instance 2 to 1 mux
	_dff _dff0(.d(w_d), .q(q), .clk(clk), .q_bar(w0)); // d_flip flop
	
endmodule
