module bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant);

	//input ports & output ports
	input clk, reset_n, m0_req, m1_req;
	output reg m0_grant, m1_grant;
	
	reg state, next_state;
	
	// parameters
	parameter M0 = 1'b0;
	parameter M1 = 1'b1;
	
	// sequential
	always @ (negedge reset_n or posedge clk) begin
		if(reset_n == 1'b0) state <= M0;
		else state <= next_state;
	end
	
	// combinational
	always @ (*) begin
		if(state == M0) begin
			// next_state logic
			if((m0_req == 1'b0 && m1_req == 1'b0) || (m0_req == 1'b1)) next_state <= M0;
			else if ((m0_req == 1'b0) && (m1_req == 1'b1)) next_state <= M1;
			
			// output
			m0_grant <= 1'b1;
			m1_grant <= 1'b0;
		end
		else begin
			// next_state logic
			if(m1_req == 1'b0) next_state <= M0;
			else if (m1_req == 1'b1) next_state <= M1;
			
			// output 
			m0_grant <= 1'b0;
			m1_grant <= 1'b1;
		end
	end
	

endmodule
