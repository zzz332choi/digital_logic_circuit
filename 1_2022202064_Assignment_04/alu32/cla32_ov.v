module cla32_ov(a, b, ci, s, co_prev, co);

	input [31:0] a, b; // 4bit input bus ports
	input ci; // input port
	output co, co_prev; // output port
	output [31:0] s; // 4bit output bus ports
	
	wire c1, c2, c3, c4, c5, c6, c7;
	
	cla4 cla40(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c1)); // Instantiate 4bit Carry Look-ahead adder 'cla40'
	cla4 cla41(.a(a[7:4]), .b(b[7:4]), .ci(c1), .s(s[7:4]), .co(c2)); // Instantiate 4bit Carry Look-ahead adder 'cla41'
	cla4 cla42(.a(a[11:8]), .b(b[11:8]), .ci(c2), .s(s[11:8]), .co(c3)); // Instantiate 4bit Carry Look-ahead adder 'cla42'
	cla4 cla43(.a(a[15:12]), .b(b[15:12]), .ci(c3), .s(s[15:12]), .co(c4)); // Instantiate 4bit Carry Look-ahead adder 'cla43'
	cla4 cla44(.a(a[19:16]), .b(b[19:16]), .ci(c4), .s(s[19:16]), .co(c5)); // Instantiate 4bit Carry Look-ahead adder 'cla44'
	cla4 cla45(.a(a[23:20]), .b(b[23:20]), .ci(c5), .s(s[23:20]), .co(c6)); // Instantiate 4bit Carry Look-ahead adder 'cla45'
	cla4 cla46(.a(a[27:24]), .b(b[27:24]), .ci(c6), .s(s[27:24]), .co(c7)); // Instantiate 4bit Carry Look-ahead adder 'cla46'
	cla4_ov cla4_ov1(.a(a[31:28]), .b(b[31:28]), .ci(c7), .s(s[31:28]), .co(co), .c3(co_prev)); // Instantiate 4bit Carry Look-ahead adder 'cla47'
	
endmodule
