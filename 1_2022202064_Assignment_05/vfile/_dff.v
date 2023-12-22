module _dff(clk, d, q, q_bar);

	input clk, d;			// input ports
	output q, q_bar;		// output ports
	wire clk_bar, w_q;	// wires
	
	_inv inv0(.a(clk), .y(clk_bar)); // Instance inverter clk_bar = ~clk
	_dlatch dlatch0(.clk(clk_bar), .d(d), .q(w_q), .q_bar(w0)); // Instance dlatch
	_dlatch dlatch1(.clk(clk), .q(q), .q_bar(q_bar), .d(w_q));	// Instance dlatch
	
	
endmodule
	