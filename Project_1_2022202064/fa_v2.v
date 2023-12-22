module fa_v2(a, b, ci, s);
	input a, b, ci; // input ports
	output s; // output ports
	
	ha ha0(.s(sm), .co(c1), .a(b), .b(ci)); 	// Instantiate a half adder 'ha0'
	ha ha1(.s(s), .co(c2), .a(a), .b(sm)); // Instantiate a half adder 'ha1'

endmodule
