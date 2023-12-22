`timescale 1ns/100ps

module tb_dff;
	reg clk, d;		// reg type variables
	wire q, q_bar;	// wire
	
	parameter T = 7;
	
	always #(T/2) clk = ~clk; // clk = ~clk every 3.5 seconds
	
	_dff test_dff(.q(q), .clk(clk), .d(d), .q_bar(q_bar)); // Instance d flip flop
	
	initial begin
		clk = 0;
		#2 d = 1;
		#2 d = 0;
		#1 d = 1;
		#2 d = 0;
		#1 d = 1;
		#2 d = 0;
		#2 d = 0;
		#3 d = 0;
		#1 d = 1;
		#2 d = 0;
		#1 d = 1;
		#1 d = 0;
		#1 d = 1;
		#2 d = 0;
		#3 d = 0;
		#2 d = 0;
		#2 d = 1;
		#1 d = 0;
		#1 d = 1;
		#3 d = 0;
		#2 d = 1;
		#1 d = 0;
		#(T) $stop;
	end

endmodule
