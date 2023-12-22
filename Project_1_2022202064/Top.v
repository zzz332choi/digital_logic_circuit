//module Top(m_req, m_wr, m_addr, m_dout, clk, reset_n, m_grant, interrupt, m_din);
module Top(clk, reset_n, m_req, m_wr, m_addr, m_dout, m_grant, m_din, interrupt);

	// input ports & output ports
	input m_req, m_wr, reset_n, clk;
	input [15:0] m_addr;
	input [63:0] m_dout;
	
	output m_grant, interrupt;
	output [63:0] m_din;
	
	// wires
	wire s0_sel, s1_sel, s_wr;
	wire [15:0] s_addr;
	wire [63:0] s0_dout, s1_dout, s_din;
	
	
	//BUS(m_req, m_wr, m_addr, m_dout, m_grant, m_din, reset_n, clk, s0_sel, s1_sel, s_addr, s_din, s_wr, s0_dout, s1_dout);
	// intance module bus
	BUS U0(m_req, m_wr, m_addr, m_dout, m_grant, m_din, reset_n, clk, s0_sel, s1_sel, s_addr, s_din, s_wr, s0_dout, s1_dout);
	
	//ram(clk, cen, wen, addr, din, dout);
	// instance module ram
	ram U1(clk, s0_sel, s_wr, s_addr[10:3], s_din, s0_dout);

	//FactoCore(s_sel, s_wr, s_addr, s_din, reset_n, clk, s_dout, interrupt);
	// instance factocore
	FactoCore factocore(s1_sel, s_wr, s_addr, s_din, reset_n, clk, s1_dout, interrupt);
	
endmodule
