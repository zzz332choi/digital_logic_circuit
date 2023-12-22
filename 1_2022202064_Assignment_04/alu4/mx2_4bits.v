module mx2_4bits(d0, d1, s, y);

	input [3:0] d0, d1; // 4bit input bus ports
	input s;				  // input port
	output [3:0] y;	  // 4bit output bus port
	
	
	// Gate instance
	mx2 U0_mx2(.d0(d0[0]), .d1(d1[0]), .s(s), .y(y[0])); // Instance 2-mux-1 'U0_mx2'
	mx2 U1_mx2(.d0(d0[1]), .d1(d1[1]), .s(s), .y(y[1])); // Instance 2-mux-1 'U1_mx2'
	mx2 U2_mx2(.d0(d0[2]), .d1(d1[2]), .s(s), .y(y[2])); // Instance 2-mux-1 'U2_mx2'
	mx2 U3_mx2(.d0(d0[3]), .d1(d1[3]), .s(s), .y(y[3])); // Instance 2-mux-1 'U3_mx2'
	
endmodule 
