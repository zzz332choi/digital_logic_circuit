`timescale 1ns/100ps

module tb_register3_r;
	
	reg clk, reset_n; // regs
	reg [2:0]	d;		// 3bits reg
	wire [2:0]	q;		// 3bits wire
	
	//Instance module _register3_r
	_register3_r test_register3_r(.clk(clk), .d(d), .q(q), .reset_n(reset_n));
	
	parameter T = 10;
	always #(T/2) clk = ~clk;
	
	initial begin
		#0; clk = 0; reset_n = 0; // q = 3'b000
		#7; reset_n = 1; d = 3'b111; // q = 3'b111
		#T; d = 3'b101; // q = 3'101
		#5; d = 3'b000; // q = 3'101
		#5; d = 3'b001; // q = 3'001
		#T; d = 3'b010; // q = 3'010
		#T; $stop;
		
		
	end

endmodule
