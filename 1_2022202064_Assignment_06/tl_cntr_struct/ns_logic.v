module ns_logic(Ta, Tb, d, q);
	
	input Ta, Tb;		// input ports
	input [1:0] q;		// 2bit input port
	output [1:0] d;	// 2bit output port

	_xor2 xor20	(.a(q[1]), .b(q[0]), .y(d[1]));	// d[1] = q[1] ^ q[0]
	_inv inv0	(.a(q[1]), .y(q1_bar));				// q1_bar = ~q[1]
	_inv inv1	(.a(q[0]), .y(q0_bar));				//	q0_bar = ~q[0]
	_inv inv2	(.a(Ta),	.y(Ta_bar));				// Ta_bar = ~Ta
	_inv inv3	(.a(Tb), .y(Tb_bar));				// Tb_bar = ~Tb
	
	_and3 and30(.a(q1_bar), .b(q0_bar), .c(Ta_bar), .y(w0));	// w0 = q1_bar & q0_bar & Ta_bar // w0 = ~q[1] & ~q[0] & Ta
	_and3 and31(.a(q[1]), .b(q0_bar), .c(Tb_bar), .y(w1));	// w1 = q[1] & q0_bar & Tb_bar	// w1	= q[1] & ~q[0] & ~Tb
	
	_or2 or20(.a(w0), .b(w1), .y(d[0]));							// d[0] = w0 | w1

endmodule
