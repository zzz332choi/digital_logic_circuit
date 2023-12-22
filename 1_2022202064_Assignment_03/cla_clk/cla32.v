module cla32(a, b, ci, co, s);

	input[31:0] a, b; // 32bit input bus ports
	input ci; // input port

	output co; // output port
	output[31:0] s; // 32bit output bus ports

	wire[6:0] c; // 7bit wire

	cla4 cla40(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c[0])); // Instantiate 4bit Carry Look-ahead adder 'cla40'
	cla4 cla41(.a(a[7:4]), .b(b[7:4]), .ci(c[0]), .s(s[7:4]), .co(c[1])); // Instantiate 4bit Carry Look-ahead adder 'cla41'
	cla4 cla42(.a(a[11:8]), .b(b[11:8]), .ci(c[1]), .s(s[11:8]), .co(c[2])); // Instantiate 4bit Carry Look-ahead adder 'cla42'
	cla4 cla43(.a(a[15:12]), .b(b[15:12]), .ci(c[2]), .s(s[15:12]), .co(c[3])); // Instantiate 4bit Carry Look-ahead adder 'cla43'
	cla4 cla44(.a(a[19:16]), .b(b[19:16]), .ci(c[3]), .s(s[19:16]), .co(c[4])); // Instantiate 4bit Carry Look-ahead adder 'cla44'
	cla4 cla45(.a(a[23:20]), .b(b[23:20]), .ci(c[4]), .s(s[23:20]), .co(c[5])); // Instantiate 4bit Carry Look-ahead adder 'cla45'
	cla4 cla46(.a(a[27:24]), .b(b[27:24]), .ci(c[5]), .s(s[27:24]), .co(c[6])); // Instantiate 4bit Carry Look-ahead adder 'cla46'
	cla4 cla47(.a(a[31:28]), .b(b[31:28]), .ci(c[6]), .s(s[31:28]), .co(co)); // Instantiate 4bit Carry Look-ahead adder 'cla47'


endmodule

module modified_cla32(a, b, ci, co, s);

	input[31:0] a, b; // 32bit input bus ports
	input ci; // input port

	output co; // output port
	output[31:0] s; // 32bit output bus ports

	wire[6:0] c; // 7bit wire

	modified_cla4 cla40(.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c[0])); // Instantiate 4bit Carry Look-ahead adder 'cla40'
	modified_cla4 cla41(.a(a[7:4]), .b(b[7:4]), .ci(c[0]), .s(s[7:4]), .co(c[1])); // Instantiate 4bit Carry Look-ahead adder 'cla41'
	modified_cla4 cla42(.a(a[11:8]), .b(b[11:8]), .ci(c[1]), .s(s[11:8]), .co(c[2])); // Instantiate 4bit Carry Look-ahead adder 'cla42'
	modified_cla4 cla43(.a(a[15:12]), .b(b[15:12]), .ci(c[2]), .s(s[15:12]), .co(c[3])); // Instantiate 4bit Carry Look-ahead adder 'cla43'
	modified_cla4 cla44(.a(a[19:16]), .b(b[19:16]), .ci(c[3]), .s(s[19:16]), .co(c[4])); // Instantiate 4bit Carry Look-ahead adder 'cla44'
	modified_cla4 cla45(.a(a[23:20]), .b(b[23:20]), .ci(c[4]), .s(s[23:20]), .co(c[5])); // Instantiate 4bit Carry Look-ahead adder 'cla45'
	modified_cla4 cla46(.a(a[27:24]), .b(b[27:24]), .ci(c[5]), .s(s[27:24]), .co(c[6])); // Instantiate 4bit Carry Look-ahead adder 'cla46'
	modified_cla4 cla47(.a(a[31:28]), .b(b[31:28]), .ci(c[6]), .s(s[31:28]), .co(co)); // Instantiate 4bit Carry Look-ahead adder 'cla47'


endmodule