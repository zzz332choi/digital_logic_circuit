module mx8_32bits(a, b, c, d, e, f, g, h, s0, s1, s2, y);
	
	input[31:0] a, b, c, d, e, f, g, h; // 32bit input bus ports
	input s2, s1, s0;					// input ports
	output[31:0] y;							// 32bit output bus port
	
	wire[31:0] w0, w1, w2, w3, w4, w5;	// 32bit wire bus
	
	mx2_32bits U0_mx2_32bits(.d0(a), .d1(b), .s(s0), .y(w0)); // Instance 32bit 2-mux-1 'U0_mx2_32bits'
	mx2_32bits U1_mx2_32bits(.d0(c), .d1(d), .s(s0), .y(w1)); // Instance 32bit 2-mux-1 'U1_mx2_32bits'
	mx2_32bits U2_mx2_32bits(.d0(e), .d1(f), .s(s0), .y(w2)); // Instance 32bit 2-mux-1 'U2_mx2_32bits'
	mx2_32bits U3_mx2_32bits(.d0(g), .d1(h), .s(s0), .y(w3)); // Instance 32bit 2-mux-1 'U3_mx2_32bits'
	
	mx2_32bits U4_mx2_32bits(.d0(w0), .d1(w1), .s(s1), .y(w4)); // Instance 32bit 2-mux-1 'U4_mx2_32bits'
	mx2_32bits U5_mx2_32bits(.d0(w2), .d1(w3), .s(s1), .y(w5)); // Instance 32bit 2-mux-1 'U5_mx2_32bits'
	
	mx2_32bits U6_mx2_32bits(.d0(w4), .d1(w5), .s(s2), .y(y)); // Instance 32bit 2-mux-1 'U6_mx2_32bits'
	

endmodule
