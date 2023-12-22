module cla4(a, b, ci, co, s);
	input [3:0] a, b; // 4bit input bus ports
	input ci; // input port
	output co; // output port
	output [3:0] s; // 4bit output bus ports
	
	wire [3:0] c; // 4bit wire
	
	fa_v2 fa_v20(.a(a[0]), .b(b[0]), .ci(ci), .s(s[0]));	 // Instance fulladder_v2 'fa_v20'
	fa_v2 fa_v21(.a(a[1]), .b(b[1]), .ci(c[0]), .s(s[1])); // Instance fulladder_v2 'fa_v21'
	fa_v2 fa_v22(.a(a[2]), .b(b[2]), .ci(c[1]), .s(s[2])); // Instance fulladder_v2 'fa_v22'
	fa_v2 fa_v23(.a(a[3]), .b(b[3]), .ci(c[2]), .s(s[3])); // Instance fulladder_v2 'fa_v23'
	
	clb4 clb40(.a(a), .b(b), .ci(ci), .c1(c[0]), .c2(c[1]), .c3(c[2]), .co(co)); // Instance carry look ahead adder 4bit block 'clb40'

endmodule

module modified_cla4(a, b, ci, co, s);
	input [3:0] a, b; // 4bit input bus ports
	input ci; // input port
	output co; // output port
	output [3:0] s; // 4bit output bus ports
	
	wire [3:0] c; // 4bit wire
	
	modified_fa fa0(.s(s[0]), .co(c[0]), .a(a[0]), .b(b[0]), .ci(ci)); // Instantiate a full adder 'fa0'
	modified_fa fa1(.s(s[1]), .co(c[1]), .a(a[1]), .b(b[1]), .ci(c[0])); // Instantiate a full adder 'fa1' 
	modified_fa fa2(.s(s[2]), .co(c[2]), .a(a[2]), .b(b[2]), .ci(c[1])); // Instantiate a full adder 'fa2'
	fa_v2 fa3(.s(s[3]), .a(a[3]), .b(b[3]), .ci(c[2])); // Instantiate a full adder 'fa3'
	
	modified_clb4 clb40(.a(a), .b(b), .ci(ci), .co(co)); // Instance modified carry look ahead adder 4bit block 'clb40'

endmodule
