`timescale 1ns/100ps

module tb_dff_r;
	
	reg clk, reset_n, d;	// reg type variable
	wire q;					// wire
	
	parameter T = 6;
	
	always #(T/2) clk = ~clk; // clk = ~clk every 3seconds 
	always #4 d = ~d;			  // d = ~d every 4 seconds
	
	_dff_r _dff_r_0(.clk(clk), .d(d), .reset_n(reset_n), .q(q)); // Instance d flip flop 
	
	initial begin
		clk = 0; reset_n =0; d = 0;
		#20; reset_n = 1;
		#60; reset_n = 0;
		#20; $stop;
	end
		
		
endmodule
