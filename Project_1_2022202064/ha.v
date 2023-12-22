module ha(a, b, co, s);

	input a, b; // input ports
	output co, s; // output ports
	
	_and2 and20(.y(co), .a(a), .b(b)); // Instantiate an AND gate 'and20'
	_xor2 xor20(.y(s), .a(a), .b(b)); // Instantiate an XOR gate 'xor20' 
	
endmodule
