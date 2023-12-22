module _dff_r_async(clk, reset_n, d, q);
	
	input clk, reset_n, d; // input ports
	output q;				  // output port
	reg q;					  // reg
	
	always @(posedge clk or negedge reset_n) begin // when clk rising or reset_n falling
		if(reset_n == 0) 	q <= 1'b0; // q clear
		else 					q <= d;
		
	end
	
endmodule
