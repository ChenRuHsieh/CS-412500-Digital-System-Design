module GCD_PCPI(
	input			  clk, resetn,
	input             pcpi_valid,
	input      [31:0] pcpi_insn,
	input      [31:0] pcpi_rs1,
	input      [31:0] pcpi_rs2,
	input      [7:0]  mem_pcpi_in,
	input             mem_ready,
	output            mem_pcpi_valid,
	output            mem_pcpi_write,
	output     [31:0] mem_pcpi_addr,
	output     [31:0] mem_pcpi_out,
	output            pcpi_wr,
	output     [31:0] pcpi_rd,
	output            pcpi_wait,
	output            pcpi_ready
);

	//PCPI memory interface, you shouldn't bother about it for now!!!
	assign mem_pcpi_write = 0;
	assign mem_pcpi_valid = 0;
	assign mem_pcpi_addr = 0;
	assign mem_pcpi_out = 0;

	wire pcpi_insn_valid = pcpi_valid && pcpi_insn[6:0] == 7'b0101011 && pcpi_insn[31:25] == 7'b0000001;

	//TODO: PCPI interface. Modify these values to fit your needs
	assign pcpi_wr = 1;
	assign pcpi_wait = 0;
	assign pcpi_ready = pcpi_insn_valid;
	assign pcpi_rd = 0;

	//TODO: Implement your GCD design here using successive subtraction method only



endmodule
