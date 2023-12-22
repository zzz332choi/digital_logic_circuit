module fa_v2(a, b, ci, s); // for cla
	input a, b, ci; // input ports
	output s; // output ports
	
	assign s = a ^ b ^ ci; 
	
endmodule
