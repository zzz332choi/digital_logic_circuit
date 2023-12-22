module fifo_cal_addr (state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);
	
	input [2:0] state, head, tail;	 	// 3bits input ports
	input [3:0] data_count;					// 4bits input port
	
	output we, re;								// output ports
	output [2:0] next_head, next_tail;	// 3bits output ports
	output [3:0] next_data_count;			// 4bits output port
	
	reg we, re;									// reg
	reg [2:0] next_head, next_tail;		// 3bits reg
	reg [3:0] next_data_count;				// 4bits reg
	
	// parameters
	parameter INIT = 3'b000;
	parameter NO_OP = 3'b001;
	parameter WRITE = 3'b011;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b110;
	parameter RD_ERROR = 3'b111;		
	
	// calculate address 
	always @ (state, data_count) begin
		casex({state, data_count})
			// Transition rules for state INIT
			{INIT, 4'bxxxx}: begin we <= 1'b0; re <= 1'b0; next_head <= head; next_tail <= tail; next_data_count <= data_count; end
			
			// Transition rules for state NO_OP
			{NO_OP, 4'bxxxx}: begin we <= 1'b0; re <= 1'b0; next_head <= head; next_tail <= tail; next_data_count <= data_count; end
			
			// Transition rules for state WRITE
			{WRITE, 4'b0xxx}: begin we <= 1'b1; re <= 1'b0; next_head <= head; next_tail <= tail + 1; next_data_count <= data_count + 1; end
			
			// Transition rules for state WR_ERROR
			{WR_ERROR, 4'b1000}: begin we <= 1'b0; re <= 1'b0; next_head <= head; next_tail <= tail; next_data_count <= data_count; end
			
			// Transition rules for state READ
			{READ, 4'b1xxx} : begin we <= 1'b0; re <= 1'b1; next_head <= head + 1; next_tail <= tail; next_data_count <= data_count - 1; end
			{READ, 4'b01xx} : begin we <= 1'b0; re <= 1'b1; next_head <= head + 1; next_tail <= tail; next_data_count <= data_count - 1; end
			{READ, 4'b0x1x} : begin we <= 1'b0; re <= 1'b1; next_head <= head + 1; next_tail <= tail; next_data_count <= data_count - 1; end
			{READ, 4'b0xx1} : begin we <= 1'b0; re <= 1'b1; next_head <= head + 1; next_tail <= tail; next_data_count <= data_count - 1; end
			
			// Transition rules for state RD_ERROR
			{RD_ERROR, 4'b0000}: begin we <= 1'b0; re <= 1'b0; next_head <= head; next_tail <= tail; next_data_count <= data_count; end

			default: begin we <= 1'bx; re <= 1'bx; next_head <= 3'bxxx; next_tail <= 3'bxxx; next_data_count <= 4'bxxxx; end
		endcase
	end
	
	
endmodule
