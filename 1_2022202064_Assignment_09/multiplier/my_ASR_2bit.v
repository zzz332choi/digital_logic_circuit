module my_ASR_2bit(d_in, d_out); // unconditionally 2bit arithmetic shift right

	input [127:0] d_in;		// 128bits input port
	output [127:0] d_out;	// 128bits output port
	
	assign d_out[125:0] = d_in[127:2];
	assign d_out[127:126] = {d_in[127], d_in[127]};

endmodule
