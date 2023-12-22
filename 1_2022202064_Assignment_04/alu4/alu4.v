module alu4(a, b, op, result, n, z, c, v);
	
	input [3:0] a, b; 	// 4bit input bus ports
	input [2:0] op; 		// 3bit input bus port
	output [3:0] result; // 4bit output bus port
	output c, n, z, v; 	// output ports
	
	wire [3:0] w_add_b;																// 4bit wire
	wire [3:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add;	// 4bit wire
	wire c3_add, co_add;																// wire
	
	_inv_4bits 		U0_inv_4bits(.a(a), .y(w_not_a)); // Instance vector 'a' operated by _inv_4bits.
	_inv_4bits 		U1_inv_4bits(.a(b), .y(w_not_b)); // Instance vector 'b' operated by _inv_4bits.
	_and2_4bits 	U2_and2_4bits(.a(a), .b(b), .y(w_and)); // Instance operated AND function by vector 'a' and 'b'.
	_or2_4bits 		U3_or2_4bits(.a(a), .b(b), .y(w_or));	 // Instance operated OR function by vector 'a' and 'b'.
	_xor2_4bits 	U4_xor2_4bits(.a(a), .b(b), .y(w_xor)); // Instance operated exlusive OR function by vector 'a' and 'b'.
	_xnor2_4bits	U5_xnor2_4bits(.a(a), .b(b), .y(w_xnor)); // Instance operated negative of the exclusive OR function by vector 'a' and 'b'.
	
	mx2_4bits		U6_mx2_4bits(.d0(b), .d1(w_not_b), .s(op[0]), .y(w_add_b)); // Instance 2 input mux operated by 'b' and 'w_not_b'. sel is 'op[0]'.
	cla4_ov			U7_cla4_ov(.a(a), .b(w_add_b), .ci(op[0]), .s(w_add), .c3(c3_add), .co(co_add)); // Instance carry look ahead by 'a' and 'w_add_b'.
	mx8_4bits		U8_mx8_4bits(.a(w_not_a), .b(w_not_b), .c(w_and), .d(w_or), .e(w_xor), .f(w_xnor),
										 .g(w_add), .h(w_add), .s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result));
	cal_flags4		U9_cal_flags4(.op(op), .result(result), .co_add(co_add), .c3_add(c3_add), .c(c), .n(n), .z(z), .v(v));
	
endmodule
