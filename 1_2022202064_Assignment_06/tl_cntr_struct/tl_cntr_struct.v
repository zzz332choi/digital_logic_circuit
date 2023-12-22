module tl_cntr_struct(clk, reset_n, Ta, Tb, La, Lb);

	input clk, reset_n, Ta, Tb; // input ports
	output [1:0] La, Lb; // 2bit output ports
	
	wire [1:0] d, q; // 2bit wire
	

	_dff_r_async U0(.clk(clk), .reset_n(reset_n), .d(d[1]), .q(q[1])); 	// instance register with reset 1
	_dff_r_async U1(.clk(clk), .reset_n(reset_n), .d(d[0]), .q(q[0]));	// instance register with reset 2

	o_logic U3(.La(La), .Lb(Lb), .q(q));											// instance output logic
	
	ns_logic U2(.Ta(Ta), .Tb(Tb), .d(d), .q(q));									// instance next state logic


endmodule
