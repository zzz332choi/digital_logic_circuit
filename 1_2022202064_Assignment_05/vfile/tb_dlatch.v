`timescale 1ns/100ps

module tb_dlatch;
	reg clk, d;		// reg type variable
	wire q, q_bar;	// wire
	
	parameter T = 8;
	
	always #(T/2) clk = ~clk; // clk = ~clk every 5seconds
	
	_dlatch test_dlatch(.q(q), .clk(clk), .d(d), .q_bar(q_bar)); // Instance d latch
	
	initial begin
		clk = 0;
		#3 d = 1;
		#2 d = 0;
		#1 d = 1;
		#2 d = 0;
		#1 d = 1;
		#2 d = 0;
		#2 d = 1;
		#3 d = 0;
		#1 d = 1;
		#2 d = 0;
		#1 d = 1;
		#1 d = 0;
		#1 d = 1;
		#2 d = 0;
		#3 d = 1;
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
