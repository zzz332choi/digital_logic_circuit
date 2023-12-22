`timescale 1ns/100ps

module tb_register3_r;

	reg clk, reset_n; // regs 
	reg [2:0] d; 		// 3bit reg 
	wire [2:0] q;		// 3bit wire

	// Instance resttable 3bits register
	_register3_r test_register3_r(.clk(clk), .reset_n(reset_n), .d(d), .q(q));
	
	parameter T = 10;
	always #(T/2) clk = ~clk;
	
	initial begin
		
		#0; clk = 0; reset_n = 0; d = 3'b000;
		#7; reset_n = 1; d = 3'b010;
		#T; d = 3'b110;
		#5; d = 3'b000;
		#5; d = 3'b001;
		#T; d = 3'b101;
		#T; d = 3'b111;
		#T; $stop;		
		
	end	
	
endmodule
