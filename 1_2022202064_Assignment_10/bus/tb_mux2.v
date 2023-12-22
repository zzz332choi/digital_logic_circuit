`timescale 1ns/100ps

module tb_mux2;
	
	// regs & wire
	reg a, b, s;
	wire y;
	
	// instance mux2
	mux2 test_mux2(a, b, s, y);
	
	initial begin
		#0; a = 0; b= 0; s = 0;
		#5; a = 0; b = 1;
		#5; a = 1; b = 0;
		#5; a = 1; b = 1;
		#0; a = 0; b= 0; s = 1;
		#5; a = 0; b = 1;
		#5; a = 1; b = 0;
		#5; a = 1; b = 1;		
		#5;
	end

endmodule
