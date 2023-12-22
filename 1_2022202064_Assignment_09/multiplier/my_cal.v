module my_cal(a, b, x, result, cnt);

	input [63:0]a;		// 64bits input port
	input [7:0]	cnt; 	// 8bbits input port
	input [127:0] b;	// 128bits input port
	input [2:0] x;		// 2bits input ports
	
	output [127:0] result;	// 128bits output port
	
	wire[63:0] a_bar, mi_a, a_lsl_one_bit, mi_a_lsl_one_bit;		// 64bits wire
	wire[127:0] w[4:0];	// 128bits wire 10
	reg[127:0] ww;
	
	// parameters
	parameter SHIFT0 = 3'b000;
	parameter PL_ONE0 = 3'b010;
	parameter MI_TWO = 3'b100;
	parameter MI_ONE0 = 3'b110;
	parameter PL_ONE1 = 3'b001;
	parameter PL_TWO = 3'b011;
	parameter MI_ONE1 = 3'b101;
	parameter SHIFT1 = 3'b111;

	
	// instance inverter 64bits	
	assign a_bar = ~a;													
	my_cla64		mi_a0(.a(a_bar), .b(64'b0), .ci(1'b1), .s(mi_a)); // -A
	
	// logical shift left one bit
	//my_LSL lsl_one1(.d_in(a), .d_out(a_lsl_one_bit)); 			 // +2A
	//my_LSL lsl_one0(.d_in(mi_a), .d_out(mi_a_lsl_one_bit)); // -2A
	
	assign a_lsl_one_bit = a << 1;
	assign mi_a_lsl_one_bit = mi_a << 1;
	
	// result 1 +A
	my_cla64		U0(.a(64'b0), .b(b[63:0]), .ci(1'b0), .s(w[0][63:0])); // low 64bits
	my_cla64		U1(.a(a), .b(b[127:64]), .ci(1'b0), .s(w[0][127:64])); // high 64bits
	
	// result 2 +2A
	my_cla64		U2(.a(64'b0), .b(b[63:0]), .ci(1'b0), .s(w[1][63:0])); 		// low 64bits
	my_cla64		U3(.a(a_lsl_one_bit), .b(b[127:64]), .ci(1'b0), .s(w[1][127:64]));	// high 64bits
	
	// result 3 -A
	my_cla64		U4(.a(64'b0), .b(b[63:0]), .ci(1'b0), .s(w[2][63:0])); 		// low 64bits
	my_cla64		U5(.a(mi_a), .b(b[127:64]), .ci(1'b0), .s(w[2][127:64]));	// high 64bits
	
	// result 4 -2A
	my_cla64		U6(.a(64'b0), .b(b[63:0]), .ci(1'b0), .s(w[3][63:0])); 		// low 64bits
	my_cla64		U7(.a(mi_a_lsl_one_bit), .b(b[127:64]), .ci(1'b0), .s(w[3][127:64]));	// high 64bits
	
	// result 5 +0
	my_cla64		U8(.a(64'b0), .b(b[63:0]), .ci(1'b0), .s(w[4][63:0])); 		// low 64bits
	my_cla64		U9(.a(64'b0), .b(b[127:64]), .ci(1'b0), .s(w[4][127:64]));	// high 64bits
	
	always @ (cnt) begin
		case (x) 
			SHIFT0:	ww <= w[4];
			PL_ONE0:	ww <= w[0];
			MI_TWO:	ww <= w[3];
			MI_ONE0:	ww <= w[2];
			PL_ONE1:	ww <= w[0];
			PL_TWO:	ww <= w[1];
			MI_ONE1:	ww <= w[2];
			SHIFT1:	ww <= w[4];
			default: ww <= 128'bx;
		endcase	
	end
	
	// arithmetic shift right 2bits
	my_ASR_2bit U10(.d_in(ww), .d_out(result));

endmodule
