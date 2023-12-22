module tl_cntr_w_left (clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);
	
	input		clk, reset_n, Ta, Tal, Tb, Tbl;	// input ports
	output	[1:0]	La, Lb;							// 2bit output ports
	reg		[1:0] La, Lb;							// reg data types
	
	reg [2:0] state, next_state;
	
	// Encoded states
	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	parameter S5 = 3'b101;
	parameter S6 = 3'b110;
	parameter S7 = 3'b111;
	
	// Encoded colors for outputs La and Lb
	parameter GREEN	= 2'b00;
	parameter YELLOW	= 2'b01;
	parameter LEFT 	= 2'b10;
	parameter RED		= 2'b11;
	
	// sequential circuit part
	always @ (posedge clk or negedge reset_n) begin
		if(reset_n == 1'b0) state <= S0;
		else state <= next_state;
	end
	
	
	// combinational circuit part

	// state transition condition
	always @ (Ta, Tal, Tb, Tbl) begin
		casex({state, Ta, Tal, Tb, Tbl})
			{S0, 1'b0, 1'bx, 1'bx, 1'bx}: next_state <= S1;
			{S0, 1'b1, 1'bx, 1'bx, 1'bx}: next_state <= S0;			
			{S1, 1'bx, 1'bx, 1'bx, 1'bx}: next_state <= S2;			
			{S2, 1'bx, 1'b0, 1'bx, 1'bx}: next_state <= S3;
			{S2, 1'bx, 1'b1, 1'bx, 1'bx}: next_state <= S2;			
			{S3, 1'bx, 1'bx, 1'bx, 1'bx}: next_state <= S4;
			{S4, 1'bx, 1'bx, 1'b0, 1'bx}: next_state <= S5;
			{S4, 1'bx, 1'bx, 1'b1, 1'bx}: next_state <= S4;			
			{S5, 1'bx, 1'bx, 1'bx, 1'bx}: next_state <= S6;			
			{S6, 1'bx, 1'bx, 1'bx, 1'b0}: next_state <= S7;
			{S6, 1'bx, 1'bx, 1'bx, 1'b1}: next_state <= S6;			
			{S7, 1'bx, 1'bx, 1'bx, 1'bx}: next_state <= S0;			
			default: next_state <= 3'bxxx;
		endcase
	end
	
	// state output generation
	always @ (state) begin
		casex(state) 
			S0: begin La = GREEN;	Lb = RED;		end
			S1: begin La = YELLOW;	Lb = RED;		end
			S2: begin La = LEFT;		Lb = RED;		end
			S3: begin La = YELLOW;	Lb = RED;		end
			S4: begin La = RED; 		Lb = GREEN;		end
			S5: begin La = RED;		Lb = YELLOW;	end
			S6: begin La = RED; 		Lb = LEFT;		end
			S7: begin La = RED; 		Lb = YELLOW; 	end
			default: begin La = 2'bxx; Lb = 2'bxx; end
		endcase
	end
	
	
	
endmodule
