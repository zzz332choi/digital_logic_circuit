module _dff_r_sync_async(clk, reset_n, d, q_sync, q_async);
	
	input clk, reset_n, d;	// input ports
	output q_sync, q_async;	// output ports
	//reg q_sync, q_async;		// reg
	
	_dff_r_sync	U0_dff_r_sync(.clk(clk), .reset_n(reset_n), .d(d), .q(q_sync));		// Instance synchronous d flip flop with reset
	_dff_r_async U1_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d), .q(q_async));	// Instance asynchronous d flip flop with reset
	
endmodule
