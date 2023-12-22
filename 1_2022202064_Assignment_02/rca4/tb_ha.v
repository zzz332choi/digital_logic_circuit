`timescale 1ns/100ps

module tb_ha;

	reg a, b; // Declare registers 'a' and 'b'
	wire co, s; // Declare wires 'co' and 's'
	
	ha tb(.s(s), .co(co), .a(a), .b(b)); // Instantiate a half adder module 'ha'
	
	initial
	begin
		#0 a = 0; b = 0;
		#5 a = 0; b = 1;
		#5 a = 1; b = 0;
		#5 a = 1; b = 1;
		#5;
	
	end
	
endmodule
