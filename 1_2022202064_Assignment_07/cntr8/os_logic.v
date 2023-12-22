module os_logic(state, d_in, d_out);
	
	// parameters
	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b001;
	parameter INC_STATE	= 3'b010;
	parameter INC2_STATE = 3'b011;
	parameter DEC_STATE	= 3'b100;
	parameter DEC2_STATE = 3'b101;
	
	input  [2:0]	state; 	// 3bits input port
	input	 [7:0]	d_in;		// 8bits input port
	output [7:0]	d_out;	// 8bits output port
	
	reg	 [7:0]	d_out;	// 8bits reg
	wire	 [7:0]	d_inc;	// 8bits wire
	wire	 [7:0]	d_dec;	// 8bits wire
	
	always @ (state or d_in) begin
		case(state)
			IDLE_STATE : d_out <= 8'h00;
			LOAD_STATE : d_out <= d_in;
			INC_STATE  : d_out <= d_inc;
			INC2_STATE : d_out <= d_inc;
			DEC_STATE  : d_out <= d_dec;
			DEC2_STATE : d_out <= d_dec;
			default	  : d_out <= 8'bx;
		endcase
	end
	
	cla8	U0 (.a(d_out), .b(0), .ci(1), .s(d_inc), .co(w0));					// Instance 8bits carry lookahead adder
	cla8	U1 (.a(d_out), .b(8'b1111_1111), .ci(0), .s(d_dec), .co(w1));	// Instance 8bits carry lookahaed adder
	
endmodule
