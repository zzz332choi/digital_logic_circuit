module bus(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr, m1_address, m1_dout, s0_dout, s1_dout, m0_grant, m1_grant, m_din, s0_sel, s1_sel, s_address, s_wr, s_din);
	
	// input ports & output ports
	input clk, reset_n, m0_req, m0_wr, m1_req, m1_wr;
	input [7:0] m0_address, m1_address;
	input [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	
	output m0_grant, m1_grant, s0_sel, s1_sel, s_wr;
	output [7:0] s_address;
	output [31:0] m_din, s_din;
	
	reg [1:0] state;
	
	always @ (negedge reset_n or posedge clk) begin
		if(reset_n == 1'b0) state <= 2'b00;
		else state <= {s1_sel, s0_sel};
	end
	
	// instance module bus arbitereq), .m0_
	bus_arbit	U0(.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m1_req(m1_req), .m0_grant(m0_grant), .m1_grant(m1_grant));
	
	// Instance module mux2
	mux2			U1(.a(m0_wr), .b(m1_wr), .s(m1_grant), .y(s_wr));
	// Instance module mux2_8bits
	mux2_8bit	U2(.a(m0_address), .b(m1_address), .s(m1_grant), .y(s_address));
	// Instance module mux2_32bits
	mux2_32bit	U3(.a(m0_dout), .b(m1_dout), .s(m1_grant), .y(s_din));
	
	// Instance module bus address decoder
	bus_addr		U4(.address(s_address), .s0_sel(s0_sel), .s1_sel(s1_sel));
	
	
	// Instance module mux3_32bit
	mux3_32bit	U5(.a(32'h00), .b(s0_dout), .c(s1_dout), .s(state), .y(m_din));
	
endmodule

