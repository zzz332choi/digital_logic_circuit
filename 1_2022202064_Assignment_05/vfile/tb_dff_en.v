`timescale 1ns/100ps

module tb_dff_en;
	reg clk, d, en;	// reg type variable
	wire q;				// wire
	
	parameter T = 3;
	
	always #(T/2) clk = ~clk; // clk = ~clk every 1.5seconds 
	always #4 d = ~d;			  // d = ~d every 4 seconds
	always #18 en = ~en;

	_dff_en test_dff_en(.clk(clk), .en(en), .d(d), .q(q)); // Instance enable d flip flop
	
	initial begin
		clk = 0; d= 0;
		#1 en = 1;
		#100 $stop;
	end

endmodule
