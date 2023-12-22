`timescale 1ns/100ps

module tb_mux2_8bit;
	
	// regs & wire
	reg [7:0] a, b;
	reg s;
	wire [7:0] y;
	
	// instance mux2_bit
	mux2_8bit test_mux2_8bit(a, b, s, y);
	
	initial begin
		#0; a = 8'hff; b = 8'h22; s = 0;
		#5; a = 8'haa; b = 8'h55;
		#5; a = 8'hba; b = 8'hcc; s = 1;
		#5; a = 8'h42; b = 8'h31;
		#5;
	end
	
	
endmodule
