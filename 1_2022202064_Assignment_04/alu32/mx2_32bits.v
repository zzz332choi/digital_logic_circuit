module mx2_32bits(d0, d1, s, y);

	input [31:0] d0, d1; // 32bit input bus ports
	input s;				  // input port
	output [31:0] y;	  // 32bit output bus port
	
	
	// Gate instance
	assign y = (s==0)?d0:d1;
	
endmodule 
