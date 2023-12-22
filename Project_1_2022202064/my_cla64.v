module my_cla64(a, b, ci, s);

	input [63:0] a, b;	// 64bits input bus ports
	input ci; 				// input port
	output [63:0] s; 		// 64bits output bus port
	
	// Instance 32bits carry look ahead adder
	cla32 U0(.a(a[31:0]), .b(b[31:0]), .ci(ci), .s(s[31:0]), .co(w0));
	cla32 U1(.a(a[63:32]), .b(b[63:32]), .ci(w0), .s(s[63:32]), .co());
	
endmodule
