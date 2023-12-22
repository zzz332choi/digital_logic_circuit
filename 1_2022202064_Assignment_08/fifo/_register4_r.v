module _register4_r(clk, d, q, reset_n);
	
	input 	reset_n, clk;	// input ports
	input		[3:0]	d;			// 8bit input port
	output	[3:0]	q;			// 8bit input port
	
	
    _dff_r _dff_r_0(.d(d[0]), .clk(clk), .q(q[0]), .reset_n(reset_n)); // Instance d flip flop with reset
    _dff_r _dff_r_1(.d(d[1]), .clk(clk), .q(q[1]), .reset_n(reset_n)); // Instance d flip flop with reset
    _dff_r _dff_r_2(.d(d[2]), .clk(clk), .q(q[2]), .reset_n(reset_n)); // Instance d flip flop with reset
    _dff_r _dff_r_3(.d(d[3]), .clk(clk), .q(q[3]), .reset_n(reset_n)); // Instance d flip flop with reset
	 
endmodule	// end
