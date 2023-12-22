`timescale 1ns/100ps

module tb_dff_r;

	reg d, clk, reset_n;
	wire q;
	
	parameter T = 10;
	always #(T/2) clk = ~clk;
	always #(20) reset_n = ~reset_n;
	always #(4) d = ~d;
	
	_dff_r test_dff_r(.clk(clk), .d(d), .q(q), .reset_n(reset_n));
	
	initial begin
		reset_n = 0; clk = 0; d = 1;
		#80; $stop;
	end
	
endmodule
