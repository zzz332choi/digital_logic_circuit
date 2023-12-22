module BUS(m_req, m_wr, m_addr, m_dout, m_grant, m_din, reset_n, clk, s0_sel, s1_sel, s_addr, s_din, s_wr, s0_dout, s1_dout);
	
	// input & output ports
	input m_req, m_wr, reset_n, clk;
	input [15:0] m_addr;
	input [63:0] m_dout, s0_dout, s1_dout;
	
	output s0_sel, s1_sel, m_grant, s_wr;
	output [15:0] s_addr;
	output [63:0] s_din, m_din;
	
	// regs
	reg [1:0] state;

	always @ (posedge clk or negedge reset_n /*or m_req */) begin
		if(reset_n == 1'b0) 
			state <= 2'b00;
		else
			state <= {s1_sel, s0_sel};	
	end
		
	
	// instance module bus_addr(address decoder)
	bus_addr	U1(.address(s_addr), .s0_sel(s0_sel), .s1_sel(s1_sel), .m_req(m_req)); // address decoder
	
	assign m_grant = m_req;
	assign s_addr = m_addr;
	assign s_wr = m_wr;
	assign s_din = m_dout;
	
	// instance moudle mux3
	mux3_64bit	U2(.a(64'h00), .b(s0_dout), .c(s1_dout), .s(state), .y(m_din));
	
	
endmodule
