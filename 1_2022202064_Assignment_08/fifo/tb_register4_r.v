`timescale 1ns/100ps

module tb_register4_r;

	reg 	reset_n, clk;	// regs
	reg	[3:0]	d;			// 8bit reg
	wire	[3:0]	q;			// 8bit wire
	
	parameter T = 10;

	always #(T/2) clk = ~clk;
	
	// instance resettable 4bits register
	_register4_r test_register4_r(clk, d, q, reset_n);
	
	initial begin
		#0; reset_n = 0; clk = 0; d = 4'b0000;
		#T; reset_n = 1; d = 4'b0001;
		#T; d = 4'b1010;
		#T; d = 4'b1111;
		#T; d = 4'b0011;
		#T; d = 4'b0110;
		#T; $stop;
		
	end

endmodule
