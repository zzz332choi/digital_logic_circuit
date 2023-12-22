module fa_v2(a, b, ci, s); // for cla
	input a, b, ci; // input ports
	output s; // output ports
	
	ha ha0(.s(sm), .co(c1), .a(b), .b(ci)); 	// Instantiate a half adder 'ha0'
	ha ha1(.s(s), .co(c2), .a(a), .b(sm)); // Instantiate a half adder 'ha1'

endmodule

module modified_fa(a, b, ci, co, s); // for modified_cla  

	input a, b, ci; //input ports
	output co, s; // output ports

	ha ha0(.s(sm), .co(c1), .a(b), .b(ci)); 	// Instantiate a half adder 'ha0'
	ha ha1(.s(s), .co(c2), .a(a), .b(sm)); // Instantiate a half adder 'ha1'

	_or2 or20(.y(co), .a(c2), .b(c1)); // Instantiate an OR gate 'or20'

	
endmodule

