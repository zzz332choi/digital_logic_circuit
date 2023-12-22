module o_logic(La, Lb, q);
	
	input [1:0] q;				// 2bit input port
	output [1:0] La, Lb;		// 2bit output ports
	
	assign La[1] = q[1];								
	_inv inv0	(.a(q[1]), .y(w0));					// w0 = ~q[1]
	_and2 and20 (.a(w0), .b(q[0]),. y(La[0]));	// La[0] = w0 & q[0]
	_inv inv1	(.a(q[1]), .y(Lb[1]));				// Lb[1] = ~q[1]
	_and2 and21	(.a(q[1]),. b(q[0]), .y(Lb[0]));	// Lb[0] = q[1] & q[0]

endmodule

