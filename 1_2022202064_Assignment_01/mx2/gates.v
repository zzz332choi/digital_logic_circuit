module _nand2(y, a, b);
	//output port
	output y;
	// input ports
	input a, b;
	
	assign y = !(a&b); // y is the calculated negation of the AND function operated by 'a' and 'b'.
	
endmodule

module _inv(y, a); 
	
	//output port
	output y;
	//input port
	input a;
	
	assign y = !a; // y is the calculated negation of the NOT function operated by 'a'.
	
endmodule
