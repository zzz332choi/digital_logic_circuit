module bus_addr(address, s0_sel, s1_sel); // address decoder
	
	// input port & output ports
	input [7:0] address;
	output reg s0_sel, s1_sel;
	
	wire [2:0] upper_3bit;
	
	assign upper_3bit = address[7:5]; // Save upper 3 bits only
	
	always @ (*) begin
		if(upper_3bit == 3'b000) {s0_sel, s1_sel} = 2'b10;			// s0_sel = 1'b1, s1_sel = 1'b0
		else if (upper_3bit == 3'b001) {s0_sel, s1_sel} = 2'b01;	// s0_sel = 1'b0, s1_sel = 1'b1
		else {s0_sel, s1_sel} = 2'b00;									// s0_sel = 1'b0, s1_sel = 1'b0
	end
	
endmodule
