module mx4(y, d0, d1, d2, d3, s);
	
	input d0, d1, d2, d3; 	// input ports
	input [1:0]	s;				// 2bits input port
	output y;
	
	mx2 U0 (.d0(d0), .d1(d1), .s(s[0]), .y(w0)); // Instance 2 to 1 mux
	mx2 U1 (.d0(d2), .d1(d3), .s(s[0]), .y(w1)); // Instance 2 to 1 mux
	
	mx2 U2 (.d0(w0), .d1(w1), .s(s[1]), .y(y));	// Instance 2 to 1 mux
	
endmodule
