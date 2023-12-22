module _dlatch(clk, d, q, q_bar);
	input clk, d;		// input ports
	output q, q_bar;	// output ports
	reg q;				// reg
	
	always @ (clk or d) begin 
		if(clk == 1'b1) 
			q <= d; // non-blocking assign
	end	
	
	assign q_bar = ~q;

	
endmodule

