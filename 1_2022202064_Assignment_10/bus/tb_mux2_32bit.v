`timescale 1ns/100ps

module tb_mux2_32bit;
	
	// regs & wire
	reg [31:0] a, b;
	reg s;
	wire [31:0] y;
	
	// instance mux2_32bit
	mux2_32bit test_mux2_32bit(a, b, s, y);
	
	initial begin
		#0; a = 32'h12341234; b = 32'hffffffff; s = 0;
		#5; a = 32'h55555555; b = 32'h99995959;
		#5; a = 32'haaaaaaaa; b = 32'h11111111; s = 1;
		#5; a = 32'hbbbb1111; b = 32'h77777333;
		#5;
	end
	
	
endmodule
