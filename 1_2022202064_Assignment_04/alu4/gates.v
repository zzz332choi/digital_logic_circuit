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
	
	assign y = !a; // y is calculated the NOT function operated by 'a'.
	
endmodule

module _and2(y, a, b);

	output y; //output port
	input a, b; //input ports
	
	assign y= a & b;  // y is calculated the AND function operated by 'a' and 'b'.
	
endmodule

module _or2(y, a, b);
	
	output y; //output port
	input a, b; //input ports
	
	assign y = a | b; // y is calculated the OR function operated by 'a' and 'b'.
	
endmodule

module _xor2(y, a, b);
	//output port
	output y;
	//input ports
	input a, b;
	
	_inv inv0(.y(w0), .a(a)); // w0 is the calculated negation of the NOT function operated by 'a'.
	_inv inv1(.y(w1), .a(b)); //  w1 is the calculated negation of the NOT function operated by 'b'.
	
	_and2 and20(.y(w2), .a(a), .b(w1)); // w2 is calculated the AND function operated by 'a' and 'w1'.
	_and2 and21(.y(w3), .a(w0), .b(b)); // w3 is calculated the AND function operated by 'w0' and 'b'.
	
	_or2 or20(.y(y), .a(w2), .b(w3));  // y is calculated the OR function operated by 'w2' and 'w3'.
	
endmodule

module _and3(a, b, c, y);
	//output port
	output y;
	//intput ports
	input a, b, c;
	
	assign y = a & b & c; // y is calculated the AND function operated by 'a', 'b', and 'c'.

endmodule

module _and4(a, b, c, d, y);
	//output port
	output y;
	//intput ports
	input a, b, c, d;
	
	assign y = a & b & c & d; // y is calculated the AND function operated by 'a', 'b', 'c' and 'd'.

endmodule

module _and5(a, b, c, d, e, y);
	//output port
	output y;
	//intput ports
	input a, b, c, d, e;
	
	assign y = a & b & c & d & e; // y is calculated the AND function operated by 'a', 'b', 'c', 'd' and 'e'.

endmodule

module _or3(y, a, b, c);
	
	output y; //output port
	input a, b, c; //input ports
	
	assign y = a | b | c; // y is calculated the OR function operated by 'a', 'b' and 'c'.
	
endmodule

module _or4(y, a, b, c, d);
	
	output y; //output port
	input a, b, c, d; //input ports
	
	assign y = a | b | c | d; // y is calculated the OR function operated by 'a', 'b', 'c' and 'd'.
	
endmodule


module _or5(y, a, b, c, d, e);
	
	output y; //output port
	input a, b, c, d, e; //input ports
	
	assign y = a | b | c | d | e; // y is calculated the OR function operated by 'a', 'b', 'c', 'd' and 'e'.
	
endmodule

module _inv_4bits(a, y);
	input [3:0] a; // 4bit input bus port
	output [3:0] y; // 4bit output bus port
	
	assign y = ~a; // vector y is the calculated negation of the NOT function operated by vector 'a'.
	
endmodule

module _and2_4bits(a, b, y);
	input [3:0] a, b; // 4bit input bus ports
	output [3:0] y; // 4bit output bus port
	
	assign y = a & b; // vector y is calculated the AND function operated by vector 'a'.
	
endmodule

module _or2_4bits(a, b, y);
	input [3:0] a, b; // 4bit input bus ports
	output [3:0] y; // 4bit output bus port
	
	assign y = a | b; // vector y is calculated the OR function operated by vector 'a'.
	
endmodule

module _xor2_4bits(a, b, y);
	input [3:0] a, b; // 4bit input bus ports
	output [3:0] y; // 4bit output bus port
	
	_xor2 U0_xor2(.a(a[0]), .b(b[0]), .y(y[0])); // 'y[0]' is calculated the exclusive OR function operated by 'a[0]' and 'b[0]'.
	_xor2 U1_xor2(.a(a[1]), .b(b[1]), .y(y[1])); // 'y[1]' is calculated the exclusive OR function operated by 'a[1]' and 'b[1]'.
	_xor2 U2_xor2(.a(a[2]), .b(b[2]), .y(y[2])); // 'y[2]' is calculated the exclusive OR function operated by 'a[2]' and 'b[2]'.
	_xor2 U3_xor2(.a(a[3]), .b(b[3]), .y(y[3])); // 'y[3]' is calculated the exclusive OR function operated by 'a[3]' and 'b[3]'.
	
endmodule

module _xnor2_4bits(a, b, y);
	input [3:0] a, b; // 4bit input bus ports
	output [3:0] y; // 4bit output bus port
	wire[3:0] w0; // 4bit wire
	
	_xor2_4bits U0_xor2_4bits(.a(a), .b(b), .y(w0)); // vector w0 is calculated the exclusive OR function operated by vector 'a'.
	_inv_4bits U1_inv_4bits(.a(w0), .y(y)); // vector y is calculated the NOT function operaged by vector 'w0'.
	
endmodule
