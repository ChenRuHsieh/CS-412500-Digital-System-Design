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
`define CHOOSE_SMALL 3'b100
`define RETRUN 3'b101
`define END 3'b110

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
	
	reg [2:0] state, next_state;
	reg [31:0] step, next_step;
	reg [31:0] text_pixel, train_pixel, distance, next_distance;

/*	
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
		next_step = step;
		distance = distance;
		
		
		case(state)
			`START : begin
				pcpi_wait = 1'b0;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				mem_addr = 32'd0;
				
				distance = 32'd0;
				next_step = 1'b1;
				//$display("	START.");
				if(pcpi_insn_valid) begin
					next_state = `TEST;
					mem_addr = `IMAGE_OFFSET + ((pcpi_rs1 * `DATA_LENGTH) + step) * 4;
				end
				else begin
					next_state = `START;
				end
			end
			`TEST : begin
				//$display("	TEST.");
				pcpi_wait = 1'b1;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				
				mem_addr = `IMAGE_OFFSET + ((pcpi_rs2 * `DATA_LENGTH) + step) * 4;
				text_pixel = mem_rdata;
				next_state = `TRAIN;
			end
			`TRAIN : begin
				//$display("	TRAIN");
				pcpi_wait = 1'b1;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				
				train_pixel = mem_rdata;
				next_state = `COMPARE;
			end
			`COMPARE : begin
				//$display("	COMPARE");
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
					mem_addr = `IMAGE_OFFSET + ((pcpi_rs1 * `DATA_LENGTH) + step + 1) * 4;
				end
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
*/

	reg [31:0] smallest_dis[4:0], next_smallest_dis[4:0], max_count;
	reg [31:0] smallest_label[4:0], next_smallest_label[4:0], max_label, lable, return_value;
	
	always@(posedge clk or negedge resetn) begin
		if(~resetn) begin
			state <= `START;
			step <= 32'd1;
			pcpi_rd <= 32'd0;
			distance <= 32'd0;
			smallest_dis[0] <= `MAX_INT;
			smallest_dis[1] <= `MAX_INT;
			smallest_dis[2] <= `MAX_INT;
			smallest_dis[3] <= `MAX_INT;
			smallest_dis[4] <= `MAX_INT;
			smallest_label[0] <= 32'd0;
			smallest_label[1] <= 32'd0;
			smallest_label[2] <= 32'd0;
			smallest_label[3] <= 32'd0;
			smallest_label[4] <= 32'd0;
		end
		else begin
			state <= next_state;
			step <= next_step;
			pcpi_rd <= return_value;
			distance <= next_distance;
			smallest_dis[0] <= next_smallest_dis[0];
			smallest_dis[1] <= next_smallest_dis[1];
			smallest_dis[2] <= next_smallest_dis[2];
			smallest_dis[3] <= next_smallest_dis[3];
			smallest_dis[4] <= next_smallest_dis[4];
			smallest_label[0] <= next_smallest_label[0];
			smallest_label[1] <= next_smallest_label[1];
			smallest_label[2] <= next_smallest_label[2];
			smallest_label[3] <= next_smallest_label[3];
			smallest_label[4] <= next_smallest_label[4];
		end
	end
	
	always@* begin
		next_state = `START;
		
		pcpi_wait = 1'b0;
		pcpi_wr = 1'b0;
		pcpi_ready = 1'b0;
		
		next_step = step;
		next_distance = distance;
		max_label = max_label;
		
		next_smallest_dis[0] = smallest_dis[0];
		next_smallest_dis[1] = smallest_dis[1];
		next_smallest_dis[2] = smallest_dis[2];
		next_smallest_dis[3] = smallest_dis[3];
		next_smallest_dis[4] = smallest_dis[4];
		case(state)
			`START : begin
				pcpi_wait = 1'b0;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				mem_addr = 32'd0;
				
				next_distance = 32'd0;
				next_step = 1'b1;
				
				
				if(pcpi_insn_valid && (pcpi_rs2 > 999)) begin
					next_state = `RETRUN;
				end
				else if(pcpi_insn_valid) begin
					next_state = `TEST;
					mem_addr = `IMAGE_OFFSET + ((pcpi_rs1 * `DATA_LENGTH) + step) * 4;
				end
				else begin
					next_state = `START;
				end
			end
			`TEST : begin
				
				pcpi_wait = 1'b1;
				pcpi_wr = 1'b0;
				pcpi_ready = 1'b0;
				
				mem_addr = `IMAGE_OFFSET + ((pcpi_rs2 * `DATA_LENGTH) + step) * 4;
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
				next_distance = distance + (text_pixel - train_pixel) * (text_pixel - train_pixel);
				next_step = step + 1'b1;
				
				if(step == 3072) begin
					
					next_state = `CHOOSE_SMALL;
					mem_addr = `IMAGE_OFFSET + ((pcpi_rs2 * `DATA_LENGTH)) * 4; 
				end
				else begin
					next_state = `TEST;
					mem_addr = `IMAGE_OFFSET + ((pcpi_rs1 * `DATA_LENGTH) + step + 1) * 4;
					
				end
			end
			`CHOOSE_SMALL : begin
				//$display("TRAIN_IG = %d, step = %d, distance = %d", pcpi_rs2, step, distance);
				if(distance < smallest_dis[0]) begin
					next_smallest_dis[0] = distance;
					next_smallest_label[0] = mem_rdata;
					
					next_smallest_label[1] = smallest_label[0];
					next_smallest_label[2] = smallest_label[1];
					next_smallest_label[3] = smallest_label[2];
					next_smallest_label[4] = smallest_label[3];
					
					next_smallest_dis[1] = smallest_dis[0];
					next_smallest_dis[2] = smallest_dis[1];
					next_smallest_dis[3] = smallest_dis[2];
					next_smallest_dis[4] = smallest_dis[3];
					//$display("	next_smallest_dis[0] change %d", distance);
				end
				else if(distance < smallest_dis[1]) begin
					next_smallest_dis[1] = distance;
					next_smallest_label[1] = mem_rdata;
					
					next_smallest_label[2] = smallest_label[1];
					next_smallest_label[3] = smallest_label[2];
					next_smallest_label[4] = smallest_label[3];
					
					next_smallest_dis[2] = smallest_dis[1];
					next_smallest_dis[3] = smallest_dis[2];
					next_smallest_dis[4] = smallest_dis[3];
					//$display("	next_smallest_dis[1] change %d", distance);
				end
				else if(distance < smallest_dis[2]) begin
					next_smallest_dis[2] = distance;
					next_smallest_label[2] = mem_rdata;
					
					next_smallest_label[3] = smallest_label[2];
					next_smallest_label[4] = smallest_label[3];
					
					next_smallest_dis[3] = smallest_dis[2];
					next_smallest_dis[4] = smallest_dis[3];
					//$display("	next_smallest_dis[2] change %d", distance);
				end
				else if(distance < smallest_dis[3]) begin
					next_smallest_dis[3] = distance;
					next_smallest_label[3] = mem_rdata;
					
					next_smallest_label[4] = smallest_label[3];
					
					next_smallest_dis[4] = smallest_dis[3];
					//$display("	next_smallest_dis[3] change %d", distance);
				end
				else if(distance < smallest_dis[4]) begin
					next_smallest_dis[4] = distance;
					next_smallest_label[4] = mem_rdata;
					//$display("	next_smallest_dis[4] change %d", distance);
				end
				
				if(pcpi_rs2 > 999) begin
					next_state = `RETRUN;
				end
				else begin
					next_state = `END;
					return_value = distance;
				end
			end
			`RETRUN : begin
				next_state = `END;
				//$display("	%d", pcpi_rs2);
				if(pcpi_rs2 == 1000) begin
					return_value = smallest_label[0];
					next_smallest_dis[0] = `MAX_INT;
					//$display("	smallest_label[0] = %d", smallest_label[0]);
				end
				else if(pcpi_rs2 == 1001) begin
					return_value = smallest_label[1];
					next_smallest_dis[1] = `MAX_INT;
					//$display("	smallest_label[1] = %d", smallest_label[1]);
				end
				else if(pcpi_rs2 == 1002) begin
					return_value = smallest_label[2];
					next_smallest_dis[2] = `MAX_INT;
					//$display("	smallest_label[2] = %d", smallest_label[2]);
				end
				else if(pcpi_rs2 == 1003) begin
					return_value = smallest_label[3];
					next_smallest_dis[3] = `MAX_INT;
					//$display("	smallest_label[3] = %d", smallest_label[3]);
				end
				else if(pcpi_rs2 == 1004) begin
					return_value = smallest_label[4];
					next_smallest_dis[4] = `MAX_INT;
					//$display("	smallest_label[4] = %d", smallest_label[4]);
				end
				else begin
					return_value = 32'd0;
					//$display("	smallest_label[5]");
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
