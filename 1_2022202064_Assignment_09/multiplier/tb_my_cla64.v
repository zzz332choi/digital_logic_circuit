`timescale 1ns/100ps

module tb_my_cla64;

	reg [63:0] a, b;	// 64bits regs
	reg ci; 				// wire
	wire [63:0] s; 	// 64bits wire
	
	// Instance module 64bits carry look ahead adder
	my_cla64 test_my_cla64(a, b, ci, s);

	initial begin
		#0; ci = 1'b0; a = 64'haaaa_aaaa_aaaa; b = 64'h1111_1111_1111_1111;
		#5; a = 64'haaaa_0000_aaaa; b = 64'h1111_0000_1111_1111;
		#5; a = 64'hffff_0000_ffff; b = 64'h1111_0000_1111_1111;
		#5; a = 64'h0; b = 64'habcd_abcd_abcd_abcd;
		
		#5;
	end
	

endmodule
