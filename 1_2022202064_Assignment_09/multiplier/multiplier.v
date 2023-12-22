module multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result);
	
	input clk, reset_n, op_start, op_clear;	// input ports
	input [63:0] multiplier, multiplicand;		// 64bits input ports
	
	output reg op_done;								// output port
	output [127:0]	result;							// 128bits output port
		
	wire [127:0] calculated_result;
	wire [7:0] added_cnt, added_added_cnt, added_added_added_cnt; // cnt + 1, cnt + 2, cnt + 3
	
	// encoded states
	parameter INIT = 1'b0;
	parameter START = 1'b1;
	
	// sequential circuit part
	reg [127:0] result, next_result;
	reg [7:0] cnt, next_cnt;
	reg [2:0] x, next_x;
	reg state, next_state;
	
	always @ ( negedge reset_n or posedge clk) begin
		if(reset_n == 1'b0) begin 
			result <= 128'h00;
			cnt <= 8'b0;
			x <= {multiplicand[1], multiplicand[0], 1'b0};
			state <= INIT;
		end
		else begin
			result <= next_result;
			cnt <= next_cnt;
			x <= next_x;
			state <= next_state;
		end	
	end	
	
	
	// combinational circuit part
	// ns_logic
	always @ (*) begin
		if(op_clear == 1'b1) begin // clear signal
			next_state <= INIT;
		end
		
		else if (op_start == 1'b1) begin
			next_state <= START; // start signal 
		end
	end
	
	always @ (*) begin
		if(next_state == INIT) begin
			next_x <= {multiplicand[1], multiplicand[0], 1'b0};
			next_cnt <= 8'b0;
			next_result <= 128'h00;
		end


		else if(next_state == START && cnt < 8'd64) begin 
			next_x <= {multiplicand[added_added_added_cnt], multiplicand[added_added_cnt], multiplicand[added_cnt]};	// multiplicand[cnt + 3 : cnt + 1];			
			next_cnt <= added_added_cnt;	// next_cnt = cnt + 2
			next_result <= calculated_result;
		end	

		// output op_done
		if(cnt == 8'd64) op_done <= 1'b1;
		else op_done <= 1'b0;
	end
	
	
	// Instance carry look ahead adder
	my_cla8	U0	(.a(cnt), .b(8'd1), .ci(1'b0), .co(), .s(added_cnt)); 				// added_cnt = cnt + 1
	my_cla8	U1	(.a(cnt), .b(8'd2), .ci(1'b0), .co(), .s(added_added_cnt)); 		// added_added_cnt = cnt + 2
	my_cla8	U2	(.a(cnt), .b(8'd3), .ci(1'b0), .co(), .s(added_added_added_cnt)); // added_added_added_cnt = cnt + 3
	
	// Inctance  module my_cla
	my_cal	U3	(.a(multiplier), .b(result), .x(x), .result(calculated_result), .cnt(cnt));
	
endmodule
