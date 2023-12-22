module write_operation (Addr, we, to_reg);

	input				we;		// input port
	input	 [2:0]	Addr;		// 3bits input port
	output [7:0]	to_reg;	// 8bits output port
	
	wire	 [7:0]	w_a;

	_3_to_8_decoder U0 (.d(Addr), .q(w_a)); // Instance 3 to 8 decoder
	
   _and2 U1 (.a(we), .b(w_a[0]), .y(to_reg[0])); // Instance 2 input and gate
   _and2 U2 (.a(we), .b(w_a[1]), .y(to_reg[1])); // Instance 2 input and gate
   _and2 U3 (.a(we), .b(w_a[2]), .y(to_reg[2])); // Instance 2 input and gate
   _and2 U4 (.a(we), .b(w_a[3]), .y(to_reg[3])); // Instance 2 input and gate
   _and2 U5 (.a(we), .b(w_a[4]), .y(to_reg[4])); // Instance 2 input and gate
   _and2 U6 (.a(we), .b(w_a[5]), .y(to_reg[5])); // Instance 2 input and gate
   _and2 U7 (.a(we), .b(w_a[6]), .y(to_reg[6])); // Instance 2 input and gate
   _and2 U8 (.a(we), .b(w_a[7]), .y(to_reg[7])); // Instance 2 input and gate

	
endmodule
