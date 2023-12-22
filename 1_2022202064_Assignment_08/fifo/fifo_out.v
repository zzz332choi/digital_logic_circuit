module fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);

	input [2:0] state;												// 3bits input port
	input [3:0]	data_count;											// 4bits input port
	output full, empty, wr_ack, wr_err, rd_ack, rd_err;	// output ports
	reg full, empty, wr_ack, wr_err, rd_ack, rd_err;		// regs
	
	// parameters
	parameter INIT = 3'b000;
	parameter NO_OP = 3'b001;
	parameter WRITE = 3'b011;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b110;
	parameter RD_ERROR = 3'b111;	
	
	// define output
	always @ (data_count or state) begin
		if	(data_count == 4'b0000) 			begin full <= 1'b0; empty <= 1'b1; end	// case1. when queue is empty
		else if(data_count == 4'b1000)		begin full <= 1'b1; empty <= 1'b0; end	// case2. when queue is full
		else 											begin full <= 1'b0; empty <= 1'b0; end	// case3. the others

		// output for each states
		case(state)
			// Transition rules for state INIT
			INIT		: begin wr_ack <= 1'b0; wr_err <= 1'b0; rd_ack <= 1'b0; rd_err <= 1'b0; end
			// Transition rules for state NO_OP
			NO_OP		: begin wr_ack <= 1'b0; wr_err <= 1'b0; rd_ack <= 1'b0; rd_err <= 1'b0; end
			// Transition rules for state WRITE
			WRITE		: begin wr_ack <= 1'b1; wr_err <= 1'b0; rd_ack <= 1'b0; rd_err <= 1'b0; end
			// Transition rules for state WR_ERROR
			WR_ERROR	: begin wr_ack <= 1'b0; wr_err <= 1'b1; rd_ack <= 1'b0; rd_err <= 1'b0; full <= 1'b1; empty <= 1'b0; end
			// Transition rules for state READ
			READ		: begin wr_ack <= 1'b0; wr_err <= 1'b0; rd_ack <= 1'b1; rd_err <= 1'b0; end
			// Transition rules for state RD_ERROR
			RD_ERROR	: begin wr_ack <= 1'b0; wr_err <= 1'b0; rd_ack <= 1'b0; rd_err <= 1'b1; full <= 1'b0; empty <= 1'b1; end
		
			default: begin wr_ack <= 1'bx; wr_err <= 1'bx; rd_ack <= 1'bx; rd_err <= 1'bx; full <= 1'bx; empty <= 1'bx; end
		
		endcase
	end
	
endmodule
