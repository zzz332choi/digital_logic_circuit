module FactoCore(s_sel, s_wr, s_addr, s_din, reset_n, clk, s_dout, interrupt);
	// input ports & output ports
	input s_sel, s_wr, reset_n, clk;
	input [15:0]	s_addr;
	input [63:0]	s_din;
	
	output [63:0]	s_dout;
	output interrupt;
	
	reg start, clear;
	wire done;
	wire next_start, next_clear;

	// regs
	reg [63:0] opstart, opclear, opdone, intrEn, operand, result_h, result_l;
	wire [63:0] next_opstart, next_opclear, next_opdone, next_intrEn, next_operand, next_result_h, next_result_l;
	reg [2:0] state;
	wire [2:0] next_state;
	
	wire [4:0] offset_upper; // offset upper 5bits
	assign offset_upper = {s_addr[7:3]};
	
	wire [127:0] result;
	
	
	// parameters 
	parameter INIT = 3'b000;
	parameter CLEAR = 3'b001;
	parameter START = 3'b010;
	parameter DOING = 3'b011;
	parameter DONE = 3'b100;	
	
	// ressetable register
	always @ (posedge clk or negedge reset_n) begin
		if(reset_n == 1'b0) begin
			opstart <= 64'b0;
			opclear <= 64'b0;
			opdone <= 64'b0;
			intrEn <= 64'b0;
			operand <= 64'b0;
			result_h <= 64'b0;
			result_l	<= 64'b1;
			state <= INIT;
			start <= 0;
			clear <= 1;
		end		
		else begin
			opstart <= next_opstart;
			opclear <= next_opclear;
			opdone <= next_opdone;
			intrEn <= next_intrEn;
			operand <= next_operand;
			result_h <= next_result_h;
			result_l <= next_result_l;
			state <= next_state;
			start <= next_start;
			clear <= next_clear;
		end
	end
	
		
	// factorial core output 
	Facto_os Os(s_dout, s_sel, s_wr, opdone, result_h, result_l, offset_upper);
	
	// factorial controller
	FactoCntr U0(s_sel, s_wr, s_din, state, next_start, next_clear, done, 
					opstart, opclear, opdone, intrEn, operand, result_h, result_l, result,
					next_opstart, next_opclear, next_opdone, next_intrEn, next_state, next_result_h, next_result_l, next_operand,
					offset_upper, reset_n);

	// multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result
	multiplier U1(.clk(clk), .reset_n(reset_n), .multiplier(operand), .multiplicand(result_l), 
						.op_start(start), .op_clear(clear), .op_done(done), .result(result));
	
	
	// interrupt signal
	assign interrupt = intrEn[0] & opdone[0];
	
	
endmodule

