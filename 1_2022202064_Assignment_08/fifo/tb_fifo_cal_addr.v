`timescale 1ns/100ps

module tb_fifo_cal_addr;

	reg [2:0] state, head, tail;	 	// 3bits regs
	reg [3:0] data_count;				// 4bits reg
	
	wire we, re;							// wire
	wire [2:0] next_head, next_tail;	// 3bits wires
	wire [3:0] next_data_count;		// 4bits wire
	
	// parameters
	parameter INIT = 3'b000;
	parameter NO_OP = 3'b001;
	parameter WRITE = 3'b011;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b110;
	parameter RD_ERROR = 3'b111;

	// instance module fifo_cal_addr
	fifo_cal_addr test_fifo_cal_addr(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);

	initial begin
		#0; {state, head, tail, data_count} = {INIT, 3'b000, 3'b000, 4'b0000};
		
		#5; {state, head, tail, data_count} = {NO_OP, 3'b010, 3'b100, 4'b0010};
		#5; {state, head, tail, data_count} = {NO_OP, 3'b011, 3'b111, 4'b0100};
		
		#5; {state, head, tail, data_count} = {WRITE, 3'b000, 3'b100, 4'b0100};
		#5; {state, head, tail, data_count} = {WRITE, 3'b001, 3'b111, 4'b0110};		

		#5; {state, head, tail, data_count} = {WR_ERROR, 3'b000, 3'b111, 4'b1000};

		#5; {state, head, tail, data_count} = {READ, 3'b000, 3'b100, 4'b0100};
		#5; {state, head, tail, data_count} = {READ, 3'b001, 3'b111, 4'b0110};	
		
		#5; {state, head, tail, data_count} = {RD_ERROR, 3'b010, 3'b010, 4'b0000};		
		
		#5;
	end

endmodule
