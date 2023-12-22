module mx2(d0, d1, s, y);
	//input ports
	input d0, d1, s;
	// output port
	output y;
	
	_inv iv0 (.y(sb), .a(s));					// 'sb' is stored by inverting the value of 's' through an inverter
	_nand2 nd20 (.y(w0), .a(d0), .b(sb));	// The value of 'w0' is output of nandgate. nandgate's inputs are 'd0' and 'sb'.
	_nand2 nd21 (.y(w1), .a(d1), .b(s));	// The value of 'w1' is output of nandgate. nandgate's inputs are 'd1' and 's'.
	_nand2 nd22 (.y(y), .a(w0), .b(w1));	// The value of 'y' is output of nandgate. nandgate's inputs are 'w0' and 'w1'.
	
endmodule

