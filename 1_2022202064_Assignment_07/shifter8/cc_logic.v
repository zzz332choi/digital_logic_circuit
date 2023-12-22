module cc_logic(op, shamt, d_in, d_out, d_next);
	
	input			[2:0]	op;		// 3bits input port
	input			[1:0]	shamt;	// 2bits input port
	input			[7:0]	d_in;		// 8bits input port
	input 		[7:0]	d_out;	// 8bits input port
	output reg	[7:0]	d_next;	// 8bits output port
	
	wire			[7:0]	d_lsl, d_lsr, d_asr;	// 8bits wires
	
	// parameters
	parameter NOP	=	3'b000;
	parameter LOAD	=	3'b001;
	parameter LSL	= 	3'b010;
	parameter LSR	=	3'b011;
	parameter ASR	=	3'b100;
	
	always @ (op, shamt, d_in, d_out, d_lsl, d_lsr, d_asr) begin
		case(op)
			NOP		:	d_next <= d_out;
			LOAD		:	d_next <= d_in;
			LSL		:	d_next <= d_lsl;
			LSR		:	d_next <= d_lsr;
			ASR		:	d_next <= d_asr;
			default	: d_next <= 8'bx;
		endcase	
	end
	
	
	LSL8	U0 (.shamt(shamt), .d_in(d_out), .d_out(d_lsl));
	LSR8	U1	(.shamt(shamt), .d_in(d_out), .d_out(d_lsr));
	ASR8 	U2 (.shamt(shamt), .d_in(d_out), .d_out(d_asr));
	
endmodule
