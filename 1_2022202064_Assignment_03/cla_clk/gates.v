module _nand2(y, a, b);
	//output port
	output y;
	// input ports
	input a, b;
	
	assign y = !(a&b); // y is the calculated negation of the AND function operated by 'a' and 'b'.
	
endmodule


module _inv(y, a); 

	output y; //output port
	input a; //input port
	
	assign y = !a; // y is the calculated negation of the NOT function operated by 'a'.
	
endmodule

module _and2(y, a, b);

	output y; //output port
	input a, b; //input ports
	
	assign y= a & b;  // y is the calculated the AND function operated by 'a' and 'b'.
	
endmodule

module _or2(y, a, b);
	
	output y; //output port
	input a, b; //input ports
	
	assign y = a | b; // y is the calculated the OR function operated by 'a' and 'b'.
	
endmodule

module _xor2(y, a, b);
	//output port
	output y;
	//input ports
	input a, b;
	
	_inv inv0(.y(w0), .a(a)); // w0 is the calculated negation of the NOT function operated by 'a'.
	_inv inv1(.y(w1), .a(b)); //  w1 is the calculated negation of the NOT function operated by 'b'.
	
	_and2 and20(.y(w2), .a(a), .b(w1)); // w2 is the calculated the AND function operated by 'a' and 'w1'.
	_and2 and21(.y(w3), .a(w0), .b(b)); // w3 is the calculated the AND function operated by 'w0' and 'b'.
	
	_or2 or20(.y(y), .a(w2), .b(w3));  // y is the calculated the OR function operated by 'w2' and 'w3'.
	
endmodule

module _and3(a, b, c, y);
	//output port
	output y;
	//intput ports
	input a, b, c;
	
	assign y = a & b & c; // y is the calculated the AND function operated by 'a', 'b', and 'c'.

endmodule

module _and4(a, b, c, d, y);
	//output port
	output y;
	//intput ports
	input a, b, c, d;
	
	assign y = a & b & c & d; // y is the calculated the AND function operated by 'a', 'b', 'c' and 'd'.

endmodule

module _and5(a, b, c, d, e, y);
	//output port
	output y;
	//intput ports
	input a, b, c, d, e;
	
	assign y = a & b & c & d & e; // y is the calculated the AND function operated by 'a', 'b', 'c', 'd' and 'e'.

endmodule

module _or3(y, a, b, c);
	
	output y; //output port
	input a, b, c; //input ports
	
	assign y = a | b | c; // y is the calculated the OR function operated by 'a', 'b' and 'c'.
	
endmodule

module _or4(y, a, b, c, d);
	
	output y; //output port
	input a, b, c, d; //input ports
	
	assign y = a | b | c | d; // y is the calculated the OR function operated by 'a', 'b', 'c' and 'd'.
	
endmodule


module _or5(y, a, b, c, d, e);
	
	output y; //output port
	input a, b, c, d, e; //input ports
	
	assign y = a | b | c | d | e; // y is the calculated the OR function operated by 'a', 'b', 'c', 'd' and 'e'.
	
endmodule
