module ns_logic(load, inc, state, next_state);
	
	// parameters
	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b001;
	parameter INC_STATE	= 3'b010;
	parameter INC2_STATE = 3'b011;
	parameter DEC_STATE 	= 3'b100;
	parameter DEC2_STATE = 3'b101;
	
	input load, inc;				// input ports
	input [2:0] state;			// 3bits input port
	output [2:0] next_state;	// 3bits output port
	
	reg [2:0] next_state;		// 3bits reg
	
	always @ (load, inc, state) begin		
		case(state) 
			IDLE_STATE: begin
				if(load == 1) next_state <= LOAD_STATE;
				else if (inc == 1) next_state <= INC_STATE;
				else next_state <= DEC_STATE;
			end
			LOAD_STATE: begin
				if(load == 1) next_state <= LOAD_STATE;
				else if (inc == 1) next_state <= INC_STATE;
				else next_state <= DEC_STATE;
			end
			INC_STATE: begin
				if(load == 1) next_state <= LOAD_STATE;
				else if (inc == 1) next_state <= INC2_STATE;
				else next_state <= DEC_STATE;
			end
			INC2_STATE: begin
				if(load == 1) next_state <= LOAD_STATE;
				else if (inc == 1) next_state <= INC_STATE;
				else next_state <= DEC_STATE;
			end	
			DEC_STATE: begin
				if(load == 1) next_state <= LOAD_STATE;
				else if (inc == 1) next_state <= INC_STATE;
				else next_state <= DEC2_STATE;
			end
			DEC2_STATE: begin
				if(load == 1) next_state <= LOAD_STATE;
				else if (inc == 1) next_state <= INC_STATE;
				else next_state <= DEC_STATE;
			end
		endcase		
	end
	
endmodule
