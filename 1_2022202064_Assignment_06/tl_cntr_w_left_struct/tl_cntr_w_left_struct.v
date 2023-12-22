module tl_cntr_w_left_struct(clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);

	input clk, reset_n, Ta, Tal, Tb, Tbl;	// input ports
	output [1:0] La, Lb;							// output ports
	
	wire [2:0] d, q;								// wire
	
	_register3_r	U0(.clk(clk), .reset_n(reset_n), .d(d), .q(q));					// instance 3bits register with reset
	ns_logic			U1(.Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .d(d), .q(q));	// instance next state logic
	o_logic			U2(.La(La), .Lb(Lb), .q(q));											// instance ouput logic


endmodule
