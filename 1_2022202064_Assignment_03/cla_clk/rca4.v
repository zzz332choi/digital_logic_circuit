module rca4(a, b, ci, co, s);

	input [3:0] a, b; // 4bit input bus ports
	input ci; // input ports
	
	output [3:0] s; // 4bit output bus ports
	output co; // output ports
	
	wire [2:0] c; // 3bit wire bus 'c'
	

	fa fa0(.s(s[0]), .co(c[0]), .a(a[0]), .b(b[0]), .ci(ci)); // Instantiate a full adder 'fa0'
	fa fa1(.s(s[1]), .co(c[1]), .a(a[1]), .b(b[1]), .ci(c[0])); // Instantiate a full adder 'fa1' 
	fa fa2(.s(s[2]), .co(c[2]), .a(a[2]), .b(b[2]), .ci(c[1])); // Instantiate a full adder 'fa2'
	fa fa3(.s(s[3]), .co(co), .a(a[3]), .b(b[3]), .ci(c[2])); // Instantiate a full adder 'fa3'
	
endmodule
