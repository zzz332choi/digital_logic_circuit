module my_cla8(a, b, ci, co, s);

	input[7:0] a, b; // 32bit input bus ports
	input ci; // input port

	output co; // output port
	output[7:0] s; // 32bit output bus ports

	wire[6:0] c; // 7bit wire

	cla4 cla40(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c[0])); // Instantiate 4bit Carry Look-ahead adder 'cla40'
	cla4 cla41(.a(a[7:4]), .b(b[7:4]), .ci(c[0]), .s(s[7:4]), .co(co)); // Instantiate 4bit Carry Look-ahead adder 'cla41'

endmodule
