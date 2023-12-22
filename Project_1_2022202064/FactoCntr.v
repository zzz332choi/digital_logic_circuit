module FactoCntr(s_sel, s_wr, s_din, state, start, clear, done, 
					opstart, opclear, opdone, intrEn, operand, result_h, result_l, result,
					next_opstart, next_opclear, next_opdone, next_intrEn, next_state, next_result_h, next_result_l, next_operand,
					offset_upper, reset_n);

	// input ports & output ports
	input s_sel, s_wr, done, reset_n;
	input [2:0] state;
	input [63:0] s_din, opstart, opclear, opdone, intrEn, operand, result_h, result_l;
	input [4:0] offset_upper;
	
	input [127:0] result;
	
	output reg start, clear;
	output reg [2:0] next_state;
	output reg [63:0] next_opstart, next_opclear, next_opdone, next_intrEn, next_result_h, next_result_l, next_operand;
	
	// parameters 
	parameter INIT = 3'b000;
	parameter CLEAR = 3'b001;
	parameter START = 3'b010;
	parameter DOING1 = 3'b011;
	parameter DOING2 = 3'b100;
	parameter DONE = 3'b101;
	
	//always @ (s_sel, s_wr, offset_upper, s_din, reset_n, done) begin
	always @ (*) begin
		if(reset_n == 1'b0) next_state = INIT;
		else begin
			// address decoder of the factorial core
			if(s_sel && s_wr) begin
				if(offset_upper == 5'h0) next_opstart = s_din;
				else if (offset_upper == 5'h1) next_opclear = s_din;
				else if (offset_upper == 5'h3) next_intrEn = s_din;
				else if (offset_upper == 5'h4) next_operand = s_din;
			end
			
			// next_state
			if(next_opclear[0]) next_state = CLEAR; // clear
			else begin
				if(opdone[1:0] == 2'b11) next_state = DONE;
				else if(opdone[1]) next_state = DOING1;
				else if(next_opstart[0]) next_state = START; // start
			end
		end
		
	
		case(state)
			INIT: begin	// init state
				start = 1'b0;
				clear = 1'b1;
				next_opstart = 64'b0;
				next_operand = 64'b0;
				next_result_l = 64'b1;
				next_result_h = 64'b0;
				next_opdone = 64'b0;
				next_intrEn = 64'h00;
				next_state <= CLEAR;
				next_opclear = 64'h00;
			end
			CLEAR: begin	// clear state
				start = 1'b0;
				clear = 1'b1;
				next_result_l = 64'b1;
				next_result_h = 64'b0;
				next_opdone = 64'b0;
				//next_opclear = 64'b0;
				next_opstart = 64'b0;
			end
			START: begin	// start state
				if(done) next_state <= DOING2;
				else begin
					next_opdone[1] = 1'b1;
					if(operand == 64'b0 || operand == 64'b1) begin // exception when operand is 0 (0!)
						next_opdone[0] = 1'b1;
						next_result_h = 64'b0;
						next_result_l = 64'b1;
					end
					else begin
						clear = 1'b0;
						start = 1'b1;
					end
				end
			end
			DOING1: begin	// doing state
				if(done) begin // end multiplication operator
					clear = 1;
					start = 0;
					next_operand = operand - 1;
					next_result_h = result[127:64];
					next_result_l = result[63:0];
					if(next_operand == 64'b0 || next_operand == 64'b1) next_opdone[0] = 1'b1;
					else begin 
						//if(result_l == 64'b0) next_result_l = result_h;
						if(result[63:0] == 64'b0) next_result_l = result[127:64];
					end
					
					if(next_operand != 64'b1 || next_operand != 64'b0) next_state <= START; // 
					else begin
						next_state <= DONE;
						next_opdone = 2'b11;
					end
				end
				else begin
					clear = 0;
					start = 1;
				end
			end
			DOING2: begin
			
			end
			DONE: begin
			
			end
		endcase
	end

endmodule
