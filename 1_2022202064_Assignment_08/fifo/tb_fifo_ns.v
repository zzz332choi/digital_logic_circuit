`timescale 1ns/100ps

module tb_fifo_ns;

	reg wr_en, rd_en;			// regs
	reg [2:0] state;			// 3bits reg
	reg [3:0] data_count;		// 4bits reg
	wire [2:0] next_state;	// 3bits wire
	
	fifo_ns U0(wr_en, rd_en, state, data_count, next_state); // Instance fifo ns
	
	// parameters
	parameter INIT = 3'b000;
	parameter NO_OP = 3'b001;
	parameter WRITE = 3'b011;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b110;
	parameter RD_ERROR = 3'b111;
	
	
	initial begin
		#0; {wr_en, rd_en, state, data_count} = {1'b0, 1'b0, INIT, 4'b0000};
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b1, INIT, 4'b0000};
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b0, INIT, 4'b0000};
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b1, INIT, 4'b0000};

		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b0, NO_OP, 4'b0110};		
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b1, NO_OP, 4'b0010};
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b0, NO_OP, 4'b0011};
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b1, NO_OP, 4'b0110};		
		
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b0, WRITE, 4'b0110};		
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b1, WRITE, 4'b0010};
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b0, WRITE, 4'b0100};
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b1, WRITE, 4'b0110};
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b0, WRITE, 4'b1000};		
		
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b0, READ, 4'b0110};		
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b1, READ, 4'b0010};
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b0, READ, 4'b0011};
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b1, READ, 4'b0000};
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b1, READ, 4'b0010};	
		
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b0, WR_ERROR, 4'b1000};		
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b1, WR_ERROR, 4'b1000};
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b0, WR_ERROR, 4'b1000};
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b1, WR_ERROR, 4'b1000};			
		
		
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b0, RD_ERROR, 4'b0000};		
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b1, RD_ERROR, 4'b0000};
		#5; {wr_en, rd_en, state, data_count} = {1'b1, 1'b0, RD_ERROR, 4'b0000};
		#5; {wr_en, rd_en, state, data_count} = {1'b0, 1'b1, RD_ERROR, 4'b0000};		
		
		#5;
		
	end
	
endmodule
