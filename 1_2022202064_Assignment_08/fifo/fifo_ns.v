module fifo_ns(wr_en, rd_en, state, data_count, next_state);

	input wr_en, rd_en;			// input ports
	input [2:0] state;			// 3bits input port
	input [3:0] data_count;		// 4bits intput port
	output [2:0] next_state;	// 3bits output port
	reg [2:0] next_state;
	
	// parameters
	parameter INIT = 3'b000;
	parameter NO_OP = 3'b001;
	parameter WRITE = 3'b011;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b110;
	parameter RD_ERROR = 3'b111;
	
	// define next state 
	always @ (state, data_count, wr_en, rd_en) begin
		casex({state, data_count, wr_en, rd_en})
			// Transition rules for state INIT
			{INIT, 4'b0000, 1'b0, 1'b1}: next_state <= RD_ERROR;
			{INIT, 4'b0000, 1'b1, 1'b0}: next_state <= WRITE;
			{INIT, 4'b0000, 1'b0, 1'b0}: next_state <= NO_OP;
			{INIT, 4'b0000, 1'b1, 1'b1}: next_state <= NO_OP;
			
			// Transition rules for state WRITE
			{WRITE, 4'b0xxx, 1'b0, 1'b1}: next_state <= READ;
			{WRITE, 4'b0xxx, 1'b1, 1'b0}: next_state <= WRITE;
			{WRITE, 4'b1000, 1'b1, 1'b0}: next_state <= WR_ERROR;
			{WRITE, 4'bxxxx, 1'b0, 1'b0}: next_state <= NO_OP;
			{WRITE, 4'bxxxx, 1'b1, 1'b1}: next_state <= NO_OP;
			
			// Transition rules for state WR_ERROR
			{WR_ERROR, 4'b1000, 1'b0, 1'b1}: next_state <= READ;
			{WR_ERROR, 4'b1000, 1'b1, 1'b0}: next_state <= WR_ERROR;
			{WR_ERROR, 4'b1000, 1'b0, 1'b0}: next_state <= NO_OP;			
			{WR_ERROR, 4'b1000, 1'b1, 1'b1}: next_state <= NO_OP;
			
			// Transition rules for state NO_OP
			{NO_OP, 4'b0000, 1'b0, 1'b1}: next_state <= RD_ERROR;
			{NO_OP, 4'b0000, 1'b1, 1'b0}: next_state <= WRITE;
			{NO_OP, 4'b1000, 1'b0, 1'b1}: next_state <= READ;
			{NO_OP, 4'b1000, 1'b1, 1'b0}: next_state <= WR_ERROR;
			{NO_OP, 4'bxxxx, 1'b1, 1'b0}: next_state <= WRITE;
			{NO_OP, 4'bxxxx, 1'b0, 1'b1}: next_state <= READ;
			{NO_OP, 4'bxxxx, 1'b0, 1'b0}: next_state <= NO_OP;
			{NO_OP, 4'bxxxx, 1'b1, 1'b1}: next_state <= NO_OP;

			// Transition rules for state READ
			{READ, 4'b0000, 1'b0, 1'b1}: next_state <= RD_ERROR;
			{READ, 4'bxxxx, 1'b0, 1'b1}: next_state <= READ;
			{READ, 4'bxxxx, 1'b1, 1'b0}: next_state <= WRITE;
			{READ, 4'bxxxx, 1'b0, 1'b0}: next_state <= NO_OP;
			{READ, 4'bxxxx, 1'b1, 1'b1}: next_state <= NO_OP;
			
			// Transition rules for state RD_ERROR
			{RD_ERROR, 4'b0000, 1'b0, 1'b1}: next_state <= RD_ERROR;
			{RD_ERROR, 4'b0000, 1'b1, 1'b0}: next_state <= WRITE;
			{RD_ERROR, 4'b0000, 1'b0, 1'b0}: next_state <= NO_OP;			
			{RD_ERROR, 4'b0000, 1'b1, 1'b1}: next_state <= NO_OP;			
			default: next_state <= 3'bxxx;
		endcase
	end
	
endmodule
