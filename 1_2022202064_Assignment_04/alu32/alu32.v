module alu32(a, b, op, result, c, n, z, v);
	
	input [31:0] a, b; 	// 31bit input bus ports
	input [2:0] op; 		// 3bit input bus port
	output [31:0] result; // 4bit output bus port
	output c, n, z, v; 	// output ports
	
	wire [31:0] w_add_b;																// 31bit wire
	wire [31:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add;	// 31bit wire
	wire co_prev_add, co_add;																// wire
	
	_inv_32bits 		U0_inv_32bits(.a(a), .y(w_not_a)); // Instance vector 'a' operated by _inv_4bits.
	_inv_32bits 		U1_inv_32bits(.a(b), .y(w_not_b)); // Instance vector 'b' operated by _inv_4bits.
	_and2_32bits 		U2_and2_32bits(.a(a), .b(b), .y(w_and)); // Instance operated AND function by vector 'a' and 'b'.
	_or2_32bits 		U3_or2_32bits(.a(a), .b(b), .y(w_or));	 // Instance operated OR function by vector 'a' and 'b'.
	_xor2_32bits 		U4_xor2_32bits(.a(a), .b(b), .y(w_xor)); // Instance operated exlusive OR function by vector 'a' and 'b'.
	_xnor2_32bits		U5_xnor2_32bits(.a(a), .b(b), .y(w_xnor)); // Instance operated negative of the exclusive OR function by vector 'a' and 'b'.
	
	mx2_32bits		U6_mx2_32bits(.d0(b), .d1(w_not_b), .s(op[0]), .y(w_add_b)); // Instance 2 input mux operated by 'b' and 'w_not_b'. sel is 'op[0]'.
	cla32_ov			U7_cla32_ov(.a(a), .b(w_add_b), .ci(op[0]), .s(w_add), .co_prev(co_prev_add), .co(co_add)); // Instance carry look ahead by 'a' and 'w_add_b'.
	mx8_32bits		U8_mx8_32bits(.a(w_not_a), .b(w_not_b), .c(w_and), .d(w_or), .e(w_xor), .f(w_xnor),
										 .g(w_add), .h(w_add), .s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result));
	cal_flags32		U9_cal_flags32(.op(op), .result(result), .co_add(co_add), .co_prev_add(co_prev_add), .c(c), .n(n), .z(z), .v(v));
	
endmodule
