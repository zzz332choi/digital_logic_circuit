module mx8_4bits(a, b, c, d, e, f, g, h, s0, s1, s2, y);
	
	input[3:0] a, b, c, d, e, f, g, h; // 4bit input bus ports
	input s2, s1, s0;					// input ports
	output[3:0] y;							// 4bit output bus port
	
	wire[3:0] w0, w1, w2, w3, w4, w5;	// wire bus
	
	mx8 U0_mx8(.a(a[0]), .b(b[0]), .c(c[0]), .d(d[0]), .e(e[0]), .f(f[0]),
				  .g(g[0]), .h(h[0]), .s2(s2), .s1(s1), .s0(s0), .y(y[0])); // Instance 4bit 8-mux-1 'U0_mx8'
	mx8 U1_mx8(.a(a[1]), .b(b[1]), .c(c[1]), .d(d[1]), .e(e[1]), .f(f[1]),
				  .g(g[1]), .h(h[1]), .s2(s2), .s1(s1), .s0(s0), .y(y[1])); // Instance 4bit 8-mux-1 'U1_mx8'
	mx8 U2_mx8(.a(a[2]), .b(b[2]), .c(c[2]), .d(d[2]), .e(e[2]), .f(f[2]),
				  .g(g[2]), .h(h[2]), .s2(s2), .s1(s1), .s0(s0), .y(y[2])); // Instance 4bit 8-mux-1 'U2_mx8'
	mx8 U3_mx8(.a(a[3]), .b(b[3]), .c(c[3]), .d(d[3]), .e(e[3]), .f(f[3]),
				  .g(g[3]), .h(h[3]), .s2(s2), .s1(s1), .s0(s0), .y(y[3])); // Instance 4bit 8-mux-1 'U3_mx8'
	

endmodule
