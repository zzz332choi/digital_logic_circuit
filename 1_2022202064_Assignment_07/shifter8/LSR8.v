module LSR8(d_in, shamt, d_out);
	
	input		[7:0]	d_in;		//	8bits input port
	input 	[1:0]	shamt;	// 2bits input port
	output 	[7:0]	d_out;	// 8bit output port
		
   mx4 U0(.y(d_out[7]), .d0(d_in[7]), .d1(0), .d2(0), .d3(0), .s(shamt));					 		// Instance 4-to-1 mux
   mx4 U1(.y(d_out[6]), .d0(d_in[6]), .d1(d_in[7]), .d2(0), .d3(0), .s(shamt)); 					// Instance 4-to-1 mux
   mx4 U2(.y(d_out[5]), .d0(d_in[5]), .d1(d_in[6]), .d2(d_in[7]), .d3(0), .s(shamt)); 			// Instance 4-to-1 mux
   mx4 U3(.y(d_out[4]), .d0(d_in[4]), .d1(d_in[5]), .d2(d_in[6]), .d3(d_in[7]), .s(shamt)); 	// Instance 4-to-1 mux
   mx4 U4(.y(d_out[3]), .d0(d_in[3]), .d1(d_in[4]), .d2(d_in[5]), .d3(d_in[6]), .s(shamt)); 	// Instance 4-to-1 mux
   mx4 U5(.y(d_out[2]), .d0(d_in[2]), .d1(d_in[3]), .d2(d_in[4]), .d3(d_in[5]), .s(shamt)); 	// Instance 4-to-1 mux
   mx4 U6(.y(d_out[1]), .d0(d_in[1]), .d1(d_in[2]), .d2(d_in[3]), .d3(d_in[4]), .s(shamt)); 	// Instance 4-to-1 mux
   mx4 U7(.y(d_out[0]), .d0(d_in[0]), .d1(d_in[1]), .d2(d_in[2]), .d3(d_in[3]), .s(shamt)); 	// Instance 4-to-1 mux

endmodule
