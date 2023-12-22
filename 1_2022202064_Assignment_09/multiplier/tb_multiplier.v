`timescale 1ns/100ps

module tb_multiplier;

	reg clk, reset_n, op_start, op_clear;	// regs
	reg [63:0] multiplier, multiplicand;	// 64bits regs
	
	wire op_done;									// wire
	wire [127:0] result;							// 128bits owire
	//wire [7:0] cnt; // deleteetetete
	
	parameter T = 10;

	// Instance multiplier
	multiplier test_multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result); //, cnt); 
	
	always #(T/2) clk = ~clk;
	
	initial begin
		#0; reset_n = 0; clk = 0; op_start = 0; op_clear = 0; multiplier = 64'd5; multiplicand = 64'd7;
		#3; reset_n = 1; op_start = 1;
		#T; op_start = 0;
		#(35*T); op_clear = 1; multiplier = 64'd123412; multiplicand = 64'd1000;
		#T; op_clear = 0; 
		#(2*T) op_start = 1;
		#(15*T); op_clear = 1;
		#T; op_start = 1; op_clear = 0;
		#(40*T); op_clear = 1;
		#T; op_clear = 0; multiplier = 64'hffff_ffff_ffff_ffff_ffff_ffff_ffff_fff7; multiplicand = 64'd1000;
		#(40*T); op_clear = 1;
		#T; op_clear = 0; multiplier = 64'd1307674368000; multiplicand = 64'd16;
		#(40*T); op_clear = 1;
		#T; op_clear = 0; multiplier = 64'd16; multiplicand = 64'd1307674368000;
		#(40*T); $stop;
	end
	

endmodule
