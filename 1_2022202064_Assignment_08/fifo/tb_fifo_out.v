`timescale 1ns/100ps

module tb_fifo_out;

	reg [2:0] state;												// 3bits input port
	reg [3:0] data_count;										// 4bits input port
	wire full, empty, wr_ack, wr_err, rd_ack, rd_err;	// output ports
	
	
	// parameters
	parameter INIT = 3'b000;
	parameter NO_OP = 3'b001;
	parameter WRITE = 3'b011;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b110;
	parameter RD_ERROR = 3'b111;	
	
	// instance module fifo_out 
	fifo_out test_fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);
	
	initial begin
		#0; {state, data_count} = {INIT, 4'b0110};
		#5; {state, data_count} = {INIT, 4'b0100};
		
		#5; {state, data_count} = {NO_OP, 4'b0100};		
		#5; {state, data_count} = {NO_OP, 4'b1000};

		#5; {state, data_count} = {WRITE, 4'b0100};		
		#5; {state, data_count} = {WRITE, 4'b0011};

		#5; {state, data_count} = {WR_ERROR, 4'b1000};		
	
		#5; {state, data_count} = {READ, 4'b0010};		
		#5; {state, data_count} = {READ, 4'b1000};
	
		#5; {state, data_count} = {RD_ERROR, 4'b0000};			
		#5;
	end

endmodule
