`timescale 1ns/100ps

module tb_fa;
	
	reg a, b, ci; // Declare registers 'a', 'b', and 'ci'
	wire co, s; // Declare wires 'co' and 's'

	fa tb(.s(s), .co(co), .a(a), .b(b), .ci(ci)); // Instantiate module 'fa' and connect its inputs and outputs

	
	initial
	begin // run every 5ns
		#0 a = 0; b = 0; ci = 0; 
		#5 a = 0; b = 0; ci = 1;
		#5 a = 0; b = 1; ci = 0;
		#5 a = 0; b = 1; ci = 1;
		#5 a = 1; b = 0; ci = 0;
		#5 a = 1; b = 0; ci = 1;
		#5 a = 1; b = 1; ci = 0;
		#5 a = 1; b = 1; ci = 1;
		#5;
	end
	
endmodule
