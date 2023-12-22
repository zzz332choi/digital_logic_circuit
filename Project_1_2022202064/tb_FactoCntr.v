module tb_FactoCntr;

	// reg & wire
	reg s_sel, s_wr, done, reset_n;
	reg [2:0] state;
	reg [63:0] s_din, opstart, opclear, opdone, intrEn, operand, result_h, result_l;
	reg [4:0] offset_upper;
	
	reg [127:0] result;
	
	wire start, clear;
	wire [2:0] next_state;
	wire [63:0] next_opstart, next_opclear, next_opdone, next_intrEn, next_result_h, next_result_l, next_operand;
	
	// parameters 
	parameter INIT = 3'b000;
	parameter CLEAR = 3'b001;
	parameter START = 3'b010;
	parameter DOING1 = 3'b011;
	parameter DOING2 = 3'b100;
	parameter DONE = 3'b101;


	FactoCntr test(s_sel, s_wr, s_din, state, start, clear, done, 
					opstart, opclear, opdone, intrEn, operand, result_h, result_l, result,
					next_opstart, next_opclear, next_opdone, next_intrEn, next_state, next_result_h, next_result_l, next_operand,
					offset_upper, reset_n);
				
	initial begin	
		#0; s_sel = 0; s_wr = 0; s_din = 0; state = 2'b00; offset_upper = 5'h0000; 
			 s_din = 64'h00; opstart = 64'h00; opclear = 64'h00; opdone = 64'h00; intrEn = 64'h00;
			 operand = 64'h00; result_h = 64'h00; result_l = 64'h01;
			 done = 0; reset_n = 0; result = 128'h00;
			 
		#5; s_sel = 1; s_wr = 1; s_din = 1; offset_upper = 5'h00; reset_n = 1;
		
		#5; s_sel = 1; s_wr = 1; s_din = 1; offset_upper = 5'h01; 
			 s_din = 64'h01; opstart = 64'h01; opclear = 64'h01; result_h = 64'h1234; result_l = 64'hababababa;
			 
		#5; s_sel = 0; s_wr = 0; s_din = 0; state = 2'b00; offset_upper = 5'h0000; 
			 s_din = 64'h00; opstart = 64'h00; opclear = 64'h00; opdone = 64'h00; intrEn = 64'h01;		
			 operand = 64'habababa; result_h = 64'hfffffffff; result_l = 64'habbbbbbccc1;

		#5; s_sel = 1; s_wr = 1; s_din = 0; state = 2'b00; offset_upper = 5'h3; 
			 s_din = 64'h00; opstart = 64'h00; opclear = 64'h00; opdone = 64'h00; intrEn = 64'h00;
			 operand = 64'h00; result_h = 64'h00; result_l = 64'h01;
			 done = 0; reset_n = 0; result = 128'h00;		 
		
		#5;
	
	end
	
endmodule
