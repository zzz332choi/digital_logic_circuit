module _register8(clk, d, q);
	
	input 			clk;	// input port
	input		[7:0]	d;		// 8bit input port
	output	[7:0]	q;		// 8bit input port
	
	
    _dff _dff_0(.d(d[0]), .clk(clk), .q(q[0]), .q_bar(w0)); // Instance d flip flop
    _dff _dff_1(.d(d[1]), .clk(clk), .q(q[1]), .q_bar(w1)); // Instance d flip flop
    _dff _dff_2(.d(d[2]), .clk(clk), .q(q[2]), .q_bar(w2)); // Instance d flip flop
    _dff _dff_3(.d(d[3]), .clk(clk), .q(q[3]), .q_bar(w3)); // Instance d flip flop
    _dff _dff_4(.d(d[4]), .clk(clk), .q(q[4]), .q_bar(w4)); // Instance d flip flop
    _dff _dff_5(.d(d[5]), .clk(clk), .q(q[5]), .q_bar(w5)); // Instance d flip flop
    _dff _dff_6(.d(d[6]), .clk(clk), .q(q[6]), .q_bar(w6)); // Instance d flip flop
    _dff _dff_7(.d(d[7]), .clk(clk), .q(q[7]), .q_bar(w7)); // Instance d flip flop
	 
endmodule
