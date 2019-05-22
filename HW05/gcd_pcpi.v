`define START 2'b00
`define CALCULATE 2'b01
`define STOP 2'b10
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
	output reg           pcpi_wr,
	output reg    [31:0] pcpi_rd,
	output reg           pcpi_wait,
	output reg           pcpi_ready
);

	//PCPI memory interface, you shouldn't bother about it for now!!!
	assign mem_pcpi_write = 0;
	assign mem_pcpi_valid = 0;
	assign mem_pcpi_addr = 0;
	assign mem_pcpi_out = 0;

	wire pcpi_insn_valid = pcpi_valid && pcpi_insn[6:0] == 7'b0101011 && pcpi_insn[31:25] == 7'b0000001;

	//TODO: PCPI interface. Modify these values to fit your needs
	/*
	assign pcpi_wr = 1;
	assign pcpi_wait = 0;
	assign pcpi_ready = pcpi_insn_valid;
	assign pcpi_rd = 0;
	*/
	//TODO: Implement your GCD design here using successive subtraction method only
	reg [31:0] A, B, C, next_A, next_B;
	reg [1:0] state, next_state;
	
always@(posedge clk or negedge resetn)begin
	if(~resetn) begin
		pcpi_rd <= 0;
		state <= `START;
	end
	else begin
		pcpi_rd <= B;
		state <= next_state;
	end
end

always@(posedge clk or negedge resetn) begin
	if(state == `START) begin
		A <= pcpi_rs1;
		B <= pcpi_rs2;
	end
	else begin
		A <= next_A;
		B <= next_B;
	end
end

always@* begin
	pcpi_wait = 1;
	pcpi_ready = 0;
	pcpi_wr = 0;
	next_A = pcpi_rs1;
	next_B = pcpi_rs2;
	next_state = `START;
	case(state)
		`START : begin
			pcpi_wait = 0;
			pcpi_wr = 0;
			pcpi_ready = 0;
			next_A = A;
			next_B = B;
			if(pcpi_insn_valid)
				next_state = `CALCULATE;
			else
				next_state = `START;
		end
		`CALCULATE : begin
			pcpi_wait = 1;
			pcpi_wr = 0;
			pcpi_ready = 0;
			if(A > B) begin
				next_A = A - B;
				next_B = B;
				next_state = `CALCULATE;
			end
			else if(A < B) begin
				next_A = A;
				next_B = B - A;
				next_state = `CALCULATE;
			end
			else if(A == B)begin
				pcpi_wait = 0;
				pcpi_wr = 0;
				pcpi_ready = 0;
				next_A = A;
				next_B = B;
				next_state = `STOP;
			end
		end
		`STOP: begin
			pcpi_wait = 0;
			pcpi_wr = 1;
			pcpi_ready = 1;
			next_A = A;
			next_B = B;
			next_state = `START;
		end
	endcase
end

endmodule
