module bus_addr(address, s0_sel, s1_sel, m_req); // address decoder
	
	// input port & output ports
	input [15:0] address;
	input m_req;
	output reg s0_sel, s1_sel;
	
	wire [7:0] upper_8bit;
	
	assign upper_8bit = address[15:8]; // Save upper 8 bits only
	
	always @ (*) begin		
		if(m_req) begin		
			if(8'h00 <= upper_8bit && upper_8bit < 8'h08) 		{s0_sel, s1_sel} = 2'b10;	// s0_sel = 1'b1, s1_sel = 1'b0
			else if(8'h70 <= upper_8bit && upper_8bit < 8'h72) {s0_sel, s1_sel} = 2'b01;	// s0_sel = 1'b0, s1_sel = 1'b1
			else 																{s0_sel, s1_sel} = 2'b00;	// s0_sel = 1'b0, s1_sel = 1'b0
		end
		else {s0_sel, s1_sel} = 2'b00;
	end
	
endmodule
