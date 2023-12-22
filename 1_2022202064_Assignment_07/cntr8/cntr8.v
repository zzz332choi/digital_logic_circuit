module cntr8(clk, reset_n, inc, load, d_in, d_out, o_state);
	
	input				clk, reset_n, inc, load; 	// input ports
	input  [7:0]	d_in;								// 8bits input port
	output [7:0]	d_out;							// 8bits output port
	output [2:0]	o_state;						   // 3bits output port

	wire	 [2:0]	next_state, state;			// 3bits wires
	
	assign o_state = state;
	
	os_logic U0 (.state(state), .d_in(d_in), .d_out(d_out));								// Instance output state logic
	ns_logic U1 (.load(load), .inc(inc), .state(state), .next_state(next_state));	// Instance next state logic
	
	_register3_r U2(.clk(clk), .d(next_state), .q(state), .reset_n(reset_n));		// Instance 3bits register with reset
	
endmodule
