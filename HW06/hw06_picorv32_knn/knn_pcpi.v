`define K						32'd5
`define MAX_INT                 32'd2147483647
`define DATA_LENGTH             32'd3073
`define NUM_CLASS				32'd10
`define NUM_TEST_IMAGE			32'd50
`define NUM_TRAIN_IMAGE			32'd950
`define IMAGE_OFFSET 			32'h00010000 

`define START 3'b000
`define TEST 3'b001
`define TRAIN 3'b010
`define COMPARE 3'b011
`define END 3'b100

module KNN_PCPI(
	input             clk, resetn,
	input             pcpi_valid,
	input      [31:0] pcpi_insn,
	input      [31:0] pcpi_rs1,
	input      [31:0] pcpi_rs2,
	output reg           pcpi_wr,
	output reg    [31:0] pcpi_rd,
	output reg           pcpi_wait,
	output reg           pcpi_ready,
	//memory interface
	input      [31:0] mem_rdata,
	input             mem_ready,
	output reg           mem_valid,
	output reg           mem_write,
	output reg    [31:0] mem_addr,
	output reg    [31:0] mem_wdata
);


	wire pcpi_insn_valid = pcpi_valid && pcpi_insn[6:0] == 7'b0101011 && pcpi_insn[31:25] == 7'b0000001;

	//TODO: PCPI interface. Modify these values to fit your needs
	/*
	assign pcpi_wr = 1;
	assign pcpi_wait = 0;
	assign pcpi_ready = pcpi_insn_valid;
	assign pcpi_rd = 0;
	*/
	//TODO: Memory interface. Modify these values to fit your needs
	assign mem_write = 1;
	assign mem_valid = 1;
	//assign mem_addr = 0;
	assign mem_wdata = 0;
	
	//TODO: Implement your k-NN design below
	
	reg [2:0] state, next_state;
	reg [31:0] step, next_step;
	reg [31:0] text_pixel, train_pixel, distance;
	
	always@(posedge clk or negedge resetn) begin
		if(~resetn) begin
			state <= `START;
			step <= 32'd1;
			pcpi_rd <= 32'd0;
		end
		else begin
			state <= next_state;
			step <= next_step;
			pcpi_rd <= distance;
		end
	end
	
	always@* begin
		next_state = `START;
		pcpi_wait = 1'b0;
		pcpi_wr = 1'b0;
		pcpi_ready = 1'b0;
		next_step = 1'b1;
		case(state)
			`START : begin
				pcpi_wait = 1'b0;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				mem_addr = 32'd0;
				if(pcpi_insn_valid) begin
					next_state = `TEST;
					mem_addr = IMAGE_OFFSET + (pcpi_rs1 * `DATA_LENGTH) + step;
				end
				else begin
					next_state = `START;
				end
			end
			`TEST : begin
				pcpi_wait = 1'b1;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				
				mem_addr = IMAGE_OFFSET + (pcpi_rs2 * `DATA_LENGTH) + step;
				text_pixel = mem_rdata;
				next_state = `TRAIN;
			end
			`TRAIN : begin
				pcpi_wait = 1'b1;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				
				train_pixel = mem_rdata;
				next_state = `COMPARE;
			end
			`COMPARE : begin
				pcpi_wait = 1'b1;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				distance = distance + (text_pixel - train_pixel) * (text_pixel - train_pixel);
				next_step = step + 1'b1;
				
				if(step == 3072) begin
					pcpi_wait = 1'b0;
					next_state = `END;
				end
				else begin
					next_state = `TEST;
				end
			end
			`END : begin
				pcpi_wait = 1'b0;
				pcpi_wr = 1'b1;
				pcpi_ready = 1'b1;
				next_state = `START;
			end
		endcase
	end
	
endmodule
