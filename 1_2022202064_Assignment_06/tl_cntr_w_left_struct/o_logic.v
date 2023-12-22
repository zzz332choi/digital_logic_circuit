module o_logic(La, Lb, q);
	
	input [2:0] q;			// 3bit input port
	output [1:0] La, Lb; // 2bit output ports
	
	// output logic
	
	//assign La[1] = q[2] | (q[1]&(~q[0]));
	_inv	inv0	(.a(q[0]), .y(q0_bar));
	_and2	and20	(.a(q0_bar), .b(q[1]), .y(w0));
	_or2	or20	(.a(w0), .b(q[2]), .y(La[1]));
	
	
	//assign La[0] = q[2] | q[0];
	_or2	or21	(.a(q[2]), .b(q[0]), .y(La[0]));
	
	//assign Lb[1] = (~q[2]) | (q[1]&(~q[0]));
	_inv	inv1	(.a(q[2]), .y(q2_bar));
	_and2	and21	(.a(q[1]), .b(q0_bar), .y(w1));
	_or2	or22	(.a(w1), .b(q2_bar), .y(Lb[1]));
	
	//assign Lb[0] = (~q[2]) | q[0];
	_or2	or23	(.a(q[0]), .b(q2_bar), .y(Lb[0]));

endmodule

