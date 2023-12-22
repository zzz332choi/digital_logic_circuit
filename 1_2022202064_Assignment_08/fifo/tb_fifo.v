`timescale 1ns/100ps

module tb_fifo;

	reg clk, reset_n, rd_en, wr_en;							// regs
	reg [31:0] d_in;												// 32bits regs
	wire [31:0] d_out;											//	32bits wire
	wire full, empty, wr_ack, wr_err, rd_ack, rd_err;	// wires
	wire [3:0] data_count;										// 4bits wire
	
	parameter T = 10;
	always #(T/2) clk = ~clk;
	
	fifo	test_fifo (clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
	
	initial begin
		#0; clk = 0; reset_n = 0; 
		#0; {rd_en, wr_en, d_in} = {1'b0, 1'b0, 32'h0000_0110};
		#T; reset_n = 1;
		#0; {rd_en, wr_en, d_in} = {1'b0, 1'b1, 32'h0230_0000};  //1
		#T; {rd_en, wr_en, d_in} = {1'b0, 1'b1, 32'h1234_0000};	//2
		#T; {rd_en, wr_en, d_in} = {1'b0, 1'b1, 32'h5234_2345};	//3
		#T; {rd_en, wr_en, d_in} = {1'b0, 1'b1, 32'haaaa_eeee};	//4
		#T; {rd_en, wr_en, d_in} = {1'b0, 1'b1, 32'h1234_bbbb};	//5
		#T; {rd_en, wr_en, d_in} = {1'b0, 1'b1, 32'hcccc_cccc};	//6
		#T; {rd_en, wr_en, d_in} = {1'b0, 1'b1, 32'h1234_dd00};	//7
		#T; {rd_en, wr_en, d_in} = {1'b0, 1'b1, 32'h5234_2345};	//8	
		#T; {rd_en, wr_en, d_in} = {1'b0, 1'b1, 32'h1234_0120};	//8
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b1, 32'h5234_23c5};	//8
		#T; {rd_en, wr_en, d_in} = {1'b0, 1'b0, 32'haaaa_0000};	//8
		
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b0, 32'haaaa_0000}; 		//7
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b0, 32'haaaa_0000};	//6
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b0, 32'haaaa_0000};		//5
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b0, 32'haaaa_0000};		//4
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b0, 32'haaaa_0000};		//3
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b0, 32'haaaa_0000};		//2
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b0, 32'haaaa_0000};		//1
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b0, 32'haaaa_0000};		//0			
		#T; {rd_en, wr_en, d_in} = {1'b1, 1'b0, 32'haaaa_0000};		//0	
		
		#(T*2); $stop;
	end

endmodule
