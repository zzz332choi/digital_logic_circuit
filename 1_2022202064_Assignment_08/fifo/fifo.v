module fifo(clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
	
	input clk, reset_n, rd_en, wr_en;							// input ports
	input [31:0] d_in;												// 32bits input port
	output [31:0] d_out;												//	32bits output port
	output full, empty, wr_ack, wr_err, rd_ack, rd_err;	// output ports
	output [3:0] data_count;										// 4bits output port

	wire [31:0] wire_d_out1, wire_d_out2;									// 32bits wires	
	wire [3:0] next_data_count;												// 4bits wire
	wire[2:0] state, next_state, head, next_head, tail, next_tail;	// 3bits wires
	wire we, re;																	// wires

	
	// Instance module register file
	Register_file	U0	(.clk(clk), .reset_n(reset_n), .wAddr(tail), .wData(d_in), .we(we), .rAddr(head), .rData(wire_d_out1));
	
	// Instance module fifo next state
	fifo_ns			U1	(.wr_en(wr_en), .rd_en(rd_en), .state(state), .data_count(data_count), .next_state(next_state));
	
	// Insatnce module fifo output state
	fifo_out			U2	(.state(state), .data_count(data_count), .full(full), .empty(empty), .wr_ack(wr_ack), .wr_err(wr_err), .rd_ack(rd_ack), .rd_err(rd_err));
	
	// Instance module fifo calculate address
	fifo_cal_addr	U3	(.state(next_state), .head(head), .tail(tail), .data_count(data_count), .we(we), .re(re), .next_head(next_head), .next_tail(next_tail), .next_data_count(next_data_count));
	
	// Instacne 2 to 1 mux32bits
	mx2_32bits		U4 (.d0(32'h0000_0000), .d1(wire_d_out1), .s(re), .y(wire_d_out2));
	
	
	// Instance registers
	_register3_r state_register(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
	_register4_r data_count_register(.clk(clk), .reset_n(reset_n), .d(next_data_count), .q(data_count));
	_register3_r head_register(.clk(clk), .reset_n(reset_n), .d(next_head), .q(head));
	_register3_r tail_register(.clk(clk), .reset_n(reset_n), .d(next_tail), .q(tail));
	register32_r_en	d_out_register(.clk(clk), .reset_n(reset_n), .en(1'b1), .d(wire_d_out2), .q(d_out));	
	
endmodule
