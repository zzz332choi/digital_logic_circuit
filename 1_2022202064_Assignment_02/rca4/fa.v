module fa(a, b, ci, co, s);

	input a, b, ci; //input ports
	output co, s; // output ports

	ha ha0(.s(sm), .co(c1), .a(b), .b(ci)); 	// Instantiate a half adder 'ha0'
	ha ha1(.s(s), .co(c2), .a(a), .b(sm)); // Instantiate a half adder 'ha1'

	_or2 or20(.y(co), .a(c2), .b(c1)); // Instantiate an OR gate 'or20'

	
endmodule
