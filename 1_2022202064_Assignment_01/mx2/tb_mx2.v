`timescale 1ns/100ps

module tb_mx2;
	reg d0, d1, s; // reg type 
	wire y; // wire type
	
	mx2 mx20(.y(y), .d0(d0), .d1(d1), .s(s)); // module mx2 test
	
	initial
	begin 
		#0	d0 = 0; d1 = 0; s = 0; // d0 = 0, d1 = 0, s = 0	
		#5	s = 1;					  // d0 = 0, d1 = 0, s = 1
		#5	d1 = 1; s = 0;			  // d0 = 0, d1 - 1, s = 0
		#5 d1 = 1; s = 1;			  // d0 = 0, d1 = 1, s = 1
		#5 d0 = 1; d1 = 0; s = 0; // d0 = 1, d1 = 0, s = 0
		#5	s = 1;					  // d0 = 1, d1 = 0, s = 1
		#5	d1 = 1; s = 0;			  // d0 = 1, d1 = 1, s = 0
		#5 d1 = 1; s = 1;			  // d0 = 1, d1 = 1, s = 1
		#5 $finish; // program shut down command
		
	end
	
endmodule
		