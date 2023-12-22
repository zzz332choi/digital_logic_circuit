`timescale 1ns/100ps

module tb_LSL8;

	reg [7:0]	d_in;		// 8bits reg
	reg [1:0]	shamt;	// 2bits reg
	wire	[7:0]	d_out;	// 8bits wire
	
	LSL8 test_LSL8(.d_in(d_in), .shamt(shamt), .d_out(d_out)); // Instance LSL8
		
	initial begin
		#0; d_in = 8'b1100_1100; shamt = 2'b11; // d_out = 8'b0110_0000
		#5; d_in = 8'b1000_1000; shamt = 2'b01; // d_out = 8'b0000_0000
		#5; d_in = 8'b0001_1111; shamt = 2'b00; // d_out = 8'b0001_1111
		#5; d_in = 8'b0101_0000; shamt = 2'b10;	// d_out = 8'b0100_0000
		#5;
		
	end
	
		

endmodule
