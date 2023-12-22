module cal_flags32(op, result, co_add, co_prev_add, c, n, z, v);
	input [2:0] op;
	input [31:0] result;
	input co_add, co_prev_add;
	output c, n, z, v;
	
	assign c = (op[2:1] != 2'b11) ? 1'b0 : co_add; 				// 'c' is co_add When arithmetic opcode.
	assign n = result[31];												// 'n' MSB of result. ( sign bit )
	assign z = (result == 4'b0) ? 1'b1 : 1'b0;					// 'z' is 1 when result is correctly 4'b0000.
	assign v = (op[2:1] != 2'b11) ? 1'b0 : co_add ^ co_prev_add;	// 'v' is exclusive OR funtion by 'co_add' and 'c3_add'.

endmodule
