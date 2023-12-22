`timescale 1ns/100ps

module tb_dff_r_en;

	reg clk, reset_n, en, d;// regs
	wire q;						// wire
	
	parameter T = 4;
	always #(T/2) clk = ~clk;
	always #17 en = ~en;
	always #3 d = ~d;
	
	_dff_r_en test_dff_r_en(.clk(clk), .reset_n(reset_n), .en(en), .d(d), .q(q)); 
	
	initial begin
		reset_n = 0; d = 1; clk = 0; en = 1;
		#3; reset_n = 1;
		#50; $stop;
		
	end
	
endmodule
