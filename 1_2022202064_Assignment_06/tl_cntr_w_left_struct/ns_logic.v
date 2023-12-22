module ns_logic(Ta, Tal, Tb, Tbl, d, q);
	
	input Ta, Tal, Tb, Tbl; // input ports
	input [2:0] q;				// 3bit input port
	output [2:0] d;			// 3bit output port
	
	_inv	inv0	(.a(q[0]), 	.y(q0_bar));
	_inv	inv1	(.a(q[1]), 	.y(q1_bar));
	_inv	inv2	(.a(q[2]), 	.y(q2_bar));
	_inv	inv3	(.a(Ta), 	.y(Ta_bar));
	_inv	inv4	(.a(Tal), 	.y(Tal_bar));
	_inv	inv5	(.a(Tb), 	.y(Tb_bar));
	_inv	inv6	(.a(Tbl), 	.y(Tbl_bar));
	
	// next state logic
	//assign d[2] = ((~q[2])&q[1]&q[0]) | (q[2]&(~q[1])) | (q[2]&(~q[0]));
	_and3	U0	(.a(q2_bar), .b(q[1]), .c(q[0]), .y(w0_0));
	_and2	U1	(.a(q[2]), .b(q1_bar), .y(w0_1));
	_and2	U2	(.a(q[2]), .b(q0_bar), .y(w0_2));
	_or3	U3	(.a(w0_0), .b(w0_1), .c(w0_2), .y(d[2]));
	
	//assign d[1] = q[1]^q[0];
	_xor2	U4	(.a(q[1]), .b(q[0]), .y(d[1]));
	
	//assign d[0] = ((~q[2])&(~q[1])&(~q[0])&(~Ta)) | ((~q[2])&q[1]&(~q[0])&(~Tal)) | (q[2]&(~q[1])&(q[0])&(~Tb)) | (q[2]&q[1]&(~q[0])&(~Tbl));
	_and4	U5	(.a(q2_bar), .b(q1_bar), .c(q0_bar), .d(Ta_bar), .y(w2_0));
	_and4	U6	(.a(q2_bar), .b(q[1]), .c(q0_bar), .d(Tal_bar), .y(w2_1));
	_and4	U7	(.a(q[2]), .b(q1_bar), .c(q0_bar), .d(Tb_bar), .y(w2_2));
	_and4	U8	(.a(q[2]), .b(q[1]), .c(q0_bar), .d(Tbl_bar), .y(w2_3));
	_or4	U9	(.a(w2_0), .b(w2_1), .c(w2_2), .d(w2_3), .y(d[0]));
	
endmodule
