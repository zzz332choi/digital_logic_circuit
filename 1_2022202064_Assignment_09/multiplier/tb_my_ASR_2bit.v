`timescale 1ns/100ps

module tb_my_ASR_2bit;

	reg [127:0] d_in;		// 128bits reg
	wire [127:0] d_out;	// 128bits wire
	
	// instance my asr (my asr is uncoditionlly 2bit shift)
	my_ASR_2bit test_my_ASR(d_in, d_out); 
	
	initial begin 
		#0; d_in = 128'hfffff_ffff_ffff_ffff_fffff_ffff_ffff_ffff;
		#5; d_in = 128'h88888_8888_8888_8888_88888_8888_8888_8888;
		#5; d_in = 128'h00000_0000_aaaa_aaaa_00000_0000_aaaa_aaaa;
		#5; d_in = 128'h1234_1234_1234_1234_1234_1234_1234_1234;
		#5;
	end

endmodule
