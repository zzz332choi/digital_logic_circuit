module cla8 (a, b, ci, s, co);
	
	input [7:0]	a, b;	// 8bits input ports
	input 		ci;	// input port
	output [7:0] s;	// 8bits output port
	output 		co; 	// output port
	
	wire c1;
		
	cla4 	cla40(.a(a[3:0]), .b(b[3:0]), .ci(ci), .co(c1), .s(s[3:0])); // Instance 4bits carry lookahead adder
	cla4	cla41(.a(a[7:4]), .b(b[7:4]), .ci(c1), .co(co), .s(s[7:4])); // Instance 4bits carry lookahead adder
			
endmodule
