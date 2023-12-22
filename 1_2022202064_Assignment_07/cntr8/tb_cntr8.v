`timescale 1ns/100ps

module tb_cntr8;
	
	reg clk, reset_n, inc, load; // regs
	reg [7:0]	d_in;	// 8bits reg
	wire [7:0]	d_out;	// 8bits wire
	wire [2:0]	o_state;	// 3bits wire
		
	parameter T = 4;
	always #(T/2) clk = ~clk;
	
	// Instance module cntr8
	cntr8 test_cntr8(.clk(clk), .reset_n(reset_n), .inc(inc), .load(load), .d_in(d_in), .d_out(d_out), .o_state(o_state));
	
	initial begin
		#0; clk = 0; reset_n = 0; inc = 0; load = 1; d_in = 8'hdd;
		#1; reset_n = 1;
		#T; inc = 1; load = 0;
		#T; inc = 1; 
		#T; inc = 1; 
		#T; inc = 1;
		#T; inc = 1;
		#T; inc = 0;
		#T; inc = 0;
		#T; inc = 0;
		#T; d_in = 8'h59; load = 1;
		#T; load = 0;
		#T; inc = 0;
		#T; inc = 0;
		#T; inc = 0;
		#(2*T); $stop;
	end

endmodule
