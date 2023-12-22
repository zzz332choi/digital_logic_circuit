module _dff_r(clk, reset_n, d, q);
	
	input		clk, reset_n, d;	// input ports
	output reg q;					// output port & reg type
	
		always @ (posedge clk or negedge reset_n) begin // asynchronous
			if(reset_n == 0)	q <= 1'b0;
			else q <= d;
		end
		
	
endmodule // end
