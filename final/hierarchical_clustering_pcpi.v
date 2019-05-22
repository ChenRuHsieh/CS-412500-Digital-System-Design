`define K						32'd5
`define MAX_INT                 32'd2147483647
`define DATA_LENGTH             32'd3073
`define NUM_CLASS				32'd10
`define NUM_TEST_IMAGE			32'd50
`define NUM_TRAIN_IMAGE			32'd950
`define IMAGE_OFFSET 			32'h00010000 

`define add_c 32'd201
`define compare 32'd202
`define chose 32'd203
`define get_new_dis 32'd204
`define print 32'd205
`define print_range 32'd206
`define rst_range 32'd207
`define get_value_r 32'd208
`define get_value_g 32'd209
`define get_value_b 32'd210


`define START 4'b0000
`define TEST 4'b0001
`define CALCULATE_DIS 4'b0010
`define RETURN 4'b0011
`define ADD 4'b0100
`define GET_RGB 4'b0101
`define PRINT 4'b0110
`define RANGE 4'b0111
`define RST_RANGE 4'b1000
`define GET_VALUE 4'b1001
`define END 4'b1111

module Hierarchical_Clustering_pcpi(
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
	output            mem_valid,
	output            mem_write,
	output reg    [31:0] mem_addr,
	output        [31:0] mem_wdata
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
	assign mem_write = 0;
	assign mem_valid = 1;
	//assign mem_addr = 0;
	assign mem_wdata = 0;
	
	//TODO: Implement your k-NN design below
	
	reg [3:0] state, next_state;
	reg [31:0] step, next_step;
	reg [31:0] text_pixel, train_pixel, distance, next_distance, return_value; 
	reg [31:0] R, G, B, MAX_R, MAX_G, MAX_B, MIN_R, MIN_G, MIN_B;
	reg [31:0] next_MAX_R, next_MAX_G, next_MAX_B, next_MIN_R, next_MIN_G, next_MIN_B;
	
	always@(posedge clk or negedge resetn) begin
		MAX_R <= next_MAX_R;
		MAX_G <= next_MAX_G;
		MAX_B <= next_MAX_B;
		MIN_R <= next_MIN_R;
		MIN_G <= next_MIN_G;
		MIN_B <= next_MIN_B;
		if(~resetn) begin
			state <= `START;
			step <= 32'd1;
			distance <= 32'd0;
			pcpi_rd <= 32'd0;
		end
		else begin
			state <= next_state;
			step <= next_step;
			distance <= next_distance;
			pcpi_rd <= return_value;
		end
	end

	always@* begin
		next_state = `START;
		pcpi_wait = 1'b0;
		pcpi_wr = 1'b0;
		pcpi_ready = 1'b0;
		next_step = step;
		next_distance = distance;
		return_value = return_value;
		mem_addr = mem_addr;
		
	
		next_MAX_R = MAX_R;
		next_MAX_G = MAX_G;
		next_MAX_B = MAX_B;
		next_MIN_R = MIN_R;
		next_MIN_G = MIN_G;
		next_MIN_B = MIN_B;
		
		
		case(state)
			`START : begin
				pcpi_wait = 1'b0;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				mem_addr = 32'd0;
				next_step = 1'b1;
				
				
				if(pcpi_insn_valid && pcpi_rs2 == `print) begin
					mem_addr = `IMAGE_OFFSET + ((pcpi_rs1 * `DATA_LENGTH) + step) * 4;
					next_state = `GET_RGB;
				end
				else if(pcpi_insn_valid && pcpi_rs2 == `rst_range) begin
					next_state = `RST_RANGE;
				end
				else if(pcpi_insn_valid && pcpi_rs2 == `print_range) begin
					next_state = `RANGE;
				end
				else if(pcpi_insn_valid) begin
					next_distance = 32'd0;
					next_state = `TEST;
					mem_addr = `IMAGE_OFFSET + ((pcpi_rs1 * `DATA_LENGTH) + step) * 4;
				end
				else begin
					next_state = `START;
				end
			end
			`GET_VALUE : begin
				return_value = mem_rdata;
				next_state = `END;
			end
			`TEST : begin
				//$display("	TEST.");
				pcpi_wait = 1'b1;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				
				mem_addr = `IMAGE_OFFSET + ((pcpi_rs2 * `DATA_LENGTH) + step) * 4;
				text_pixel = mem_rdata;
				next_state = `CALCULATE_DIS;
			end
			`CALCULATE_DIS : begin
				//$display("	CALCULATE_DIS");
				pcpi_wait = 1'b1;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				next_distance = distance + (text_pixel - mem_rdata) * (text_pixel - mem_rdata);
				next_step = step + 1'b1;
				
				if(step == 3) begin
					pcpi_wait = 1'b0;
					next_state = `RETURN;
				end
				else begin
					next_state = `TEST;
					mem_addr = `IMAGE_OFFSET + ((pcpi_rs1 * `DATA_LENGTH) + step + 1) * 4;
				end
			end
			`GET_RGB : begin
				next_step = step + 1'b1;
				if(step == 1'b1) begin
					R = mem_rdata;
					if( mem_rdata > MAX_R) begin
						next_MAX_R = mem_rdata;
					end
					if(mem_rdata < MIN_R) begin
						next_MIN_R = mem_rdata;
					end
				end
				else if(step == 2'd2) begin
					G = mem_rdata;
					if( mem_rdata > MAX_G) begin
						next_MAX_G = mem_rdata;
					end
					if(mem_rdata < MIN_G) begin
						next_MIN_G = mem_rdata;
					end
				end
				else if(step == 2'd3) begin
					B = mem_rdata;
					if( mem_rdata > MAX_B) begin
						next_MAX_B = mem_rdata;
					end
					if(mem_rdata < MIN_B) begin
						next_MIN_B = mem_rdata;
					end
				end
				
				if(step == 2'd3) begin
					next_state = `PRINT;
				end
				else begin
					next_state = `GET_RGB;
					mem_addr = `IMAGE_OFFSET + ((pcpi_rs1 * `DATA_LENGTH) + step + 1) * 4;
				end
			end
			`PRINT : begin
				$display("NODE=%d, R=%d, G=%d, B=%d", pcpi_rs1, R, G, B);
				
				next_state = `END;
			end
			`RANGE : begin
				$display("R:%d~%d", MIN_R, MAX_R);
				$display("G:%d~%d", MIN_G, MAX_G);
				$display("B:%d~%d", MIN_B, MAX_B);
				$display("ALL:%d~%d", MIN_R + MIN_G + MIN_B, MAX_R + MAX_G + MAX_B);
				next_state = `RST_RANGE;
			end
			`RST_RANGE : begin
				next_MAX_R = 32'd0;
				next_MAX_G = 32'd0;
				next_MAX_B = 32'd0;
				next_MIN_R = 32'd255;
				next_MIN_G = 32'd255;
				next_MIN_B = 32'd255;
				next_state = `END;
			end
			`RETURN : begin
				//$display("NODE_A=%d, NODE_B=%d, distance=%d", pcpi_rs1, pcpi_rs2, distance);
				return_value = distance;
				next_distance = 32'd0;
				next_state = `END;
			end
			`END : begin
				//$display("	END.");
				//$display("TRAIN_IG = %d, step = %d, distance = %d", pcpi_rs2, step, distance);
				pcpi_wait = 1'b0;
				pcpi_wr = 1'b1;
				pcpi_ready = 1'b1;
				next_state = `START;
			end
		endcase
	end




endmodule
