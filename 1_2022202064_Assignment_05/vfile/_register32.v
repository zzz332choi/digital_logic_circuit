module _register32(clk, d, q);

	input 			clk; 	// input port
	input	[31:0]	d;	  	// 32bit input port
	output [31:0]	q;		//	32bit output port
	
    _register8 _register8_0(.d(d[7:0]), .clk(clk), .q(q[7:0]));		// Instance 8bit register 
    _register8 _register8_1(.d(d[15:8]), .clk(clk), .q(q[15:8]));		// Instance 8bit register 
    _register8 _register8_2(.d(d[23:16]), .clk(clk), .q(q[23:16]));	// Instance 8bit register 
    _register8 _register8_3(.d(d[31:24]), .clk(clk), .q(q[31:24]));	// Instance 8bit register 
		
endmodule
