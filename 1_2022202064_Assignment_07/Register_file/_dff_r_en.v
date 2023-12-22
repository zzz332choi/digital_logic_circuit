module _dff_r_en(clk, reset_n, en, d, q);
	
	input clk, reset_n, en, d; // input ports
	output reg 	q; 				// output port & reg
	
	always @ (posedge clk or negedge reset_n) begin
		if(reset_n == 0) 	q <= 1'b0;
		else if (en)		q <= d;
		else					q <= q;
	end
	
endmodule
