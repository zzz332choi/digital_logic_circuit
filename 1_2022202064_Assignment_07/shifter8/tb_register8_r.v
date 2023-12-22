`timescale 1ns/100ps

module tb_register8_r;
	
	reg clk, reset_n;	// regs
	reg [7:0]	d;		// 8bit reg
	wire [7:0]	q;		// 8bits wire
	
	_register8_r test_register8_r(.clk(clk), .d(d), .q(q), .reset_n(reset_n));	// Instance 8bit register with reset
	
	parameter T = 10;
	always #(T/2) clk = ~clk;
	
	initial begin
		clk = 0; reset_n = 1; d = 8'h00;
		#1 reset_n = 0;
		#1 reset_n = 1; 
		#5 d = 8'hff;
		#T d = 8'hf0;
		#5 d = 8'h30;
		#5 d = 8'h19;
		#T d = 8'haa;
		#T $stop;
	end
	
endmodule
