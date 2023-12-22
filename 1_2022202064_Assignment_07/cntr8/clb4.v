module clb4(a, b, ci, c1, c2, c3, co);

	input [3:0] a, b; //4bit input bus ports
	input ci; // input port
	output c1, c2, c3, co; // output ports
	
	// wire
	wire [3:0] p, g;
	wire w0_c1;
	wire w0_c2, w1_c2;
	wire w0_c3, w1_c3, w2_c3;
	wire w0_co, w1_co, w2_co, w3_co;
	
	//generate
	_and2 U0_and2(.a(a[0]),.b(b[0]),.y(g[0])); // Instance g[0] is the 2 input AND function operated by 'a[0]' and 'b[0]'.
	_and2 U1_and2(.a(a[1]),.b(b[1]),.y(g[1])); // Instance g[1] is the 2 input AND function operated by 'a[1]' and 'b[1]'.
	_and2 U2_and2(.a(a[2]),.b(b[2]),.y(g[2])); // Instance g[2] is the 2 input AND function operated by 'a[2]' and 'b[2]'.
	_and2 U3_and2(.a(a[3]),.b(b[3]),.y(g[3])); // Instance g[3] is the 2 input AND function operated by 'a[3]' and 'b[3]'.

	//propagate
	_or2 U4_or2(.a(a[0]),.b(b[0]),.y(p[0])); // Instance p[0] is the 2 input OR function operated by 'a[0]' and 'b[0]'.
	_or2 U5_or2(.a(a[1]),.b(b[1]),.y(p[1])); // Instance p[1] is the 2 input OR function operated by 'a[1]' and 'b[1]'.
	_or2 U6_or2(.a(a[2]),.b(b[2]),.y(p[2])); // Instance p[2] is the 2 input OR function operated by 'a[2]' and 'b[2]'.
	_or2 U7_or2(.a(a[3]),.b(b[3]),.y(p[3])); // Instance p[3] is the 2 input OR function operated by 'a[3]' and 'b[3]'.
	
	// c1 = g[0] | ( p[0] & ci );
	_and2 U8_and2(.a(p[0]), .b(ci), .y(w0_c1)); // Instance w0_c1 is the 2 input AND function operated by 'ci' and 'p[0]'.
	_or2 U9_or2(.a(g[0]), .b(w0_c1), .y(c1));   // Instance c1 is the 2 input OR function operated by 'w0_c1' and 'g[0]'.
	
	// c2 = g[1] | ( p[1] & c1 )
	// c2 = g[1] | ( p[1] & g[0] ) | ( p[1] & p[0] & ci );
	_and3 U10_and3(.a(p[1]), .b(p[0]), .c(ci), .y(w0_c2)); // Instance w0_c2 is the 3 input AND function operated by 'p[1]', 'p[0]' and 'ci'.
	_and2 U11_and2(.a(p[1]), .b(g[0]), .y(w1_c2)); 			 // Instance w1_c2 is the 2 input AND function operated by 'p[1]' and 'g[0]'.
	_or3 U12_or3(.a(g[1]), .b(w1_c2), .c(w0_c2), .y(c2));  // Instance c2 is the 3 input OR function operated by 'g[1]', 'w1_c2' and 'w0_c2'.
	
	// c3 = g[2] | ( p[2] & c2 )
	// c3 = g[2] | ( p[2] & g[1] ) | ( p[2] & p[1] & g[0] ) | ( p[2] & p[1] & p[0] & ci );
	_and2 U13_and2(.a(p[2]), .b(g[1]), .y(w0_c3));							// Instance w0_c3 is the 2 input AND function operated by 'p[2]' and 'g[1]'.
	_and3 U14_and3(.a(p[2]), .b(p[1]), .c(g[0]), .y(w1_c3));				// Instance w1_c3 is the 3 input AND function operated by 'p[2]', 'p[1]' and 'g[0]'.
	_and4 U15_and4(.a(p[2]), .b(p[1]), .c(p[0]), .d(ci), .y(w2_c3));	// Instance w2_c3 is the 4 input AND function operated by 'p[2]', p[1], 'p[0]' and 'ci'.
	_or4 U16_or4(.a(g[2]), .b(w0_c3), .c(w1_c3), .d(w2_c3), .y(c3));	// Instance c3 is the 4 input OR function operated by 'g[2]', 'w0_c3', 'w1_c3' and 'w2_c3'.

	// co = g[3] | ( p[3] & c3 )
	// co = g[3] | ( (p[3] & g[2] ) | ( p[3] & p[2] & g[1] ) | ( p[3] & p[2] & p[1] & g[0]) | ( p[3] & [2] & p[1] & p[0] & ci)
	_and2 U17_and2(.a(p[3]), .b(g[2]), .y(w0_co));											// Instance w0_co is the 2 input AND function operated by 'p[3]' and 'g[2]'.
	_and3 U18_and3(.a(p[3]), .b(p[2]), .c(g[1]), .y(w1_co));								// Instance w1_co is the 3 input AND function operated by 'p[3]', 'p[2]' and 'g[1]'.
	_and4 U19_and4(.a(p[3]), .b(p[2]), .c(p[1]), .d(g[0]), .y(w2_co));				// Instance w2_co is the 4 input AND function operated by 'p[3]', p[2], 'p[1]' and 'g[0]'.
	_and5 U20_and5(.a(p[3]), .b(p[2]), .c(p[1]), .d(p[0]), .e(ci), .y(w3_co));		// Instance w3_co is the 5 input AND function operated by 'p[3]', p[2], 'p[1]', p[0] and 'ci'.
	_or5 U21_or5(.a(g[3]), .b(w0_co), .c(w1_co), .d(w2_co), .e(w3_co), .y(co));	// Instance co is the 5 input OR function operated by 'g[3]', 'w0_c3', 'w1_c3', 'w2_c3' and 'w3_c3'.


	
endmodule

