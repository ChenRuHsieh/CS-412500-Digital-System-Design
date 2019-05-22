module hw02_a_2(
	input clk,
	input rst_n,
	input [7:0] data_r0, data_r1, data_r2, data_r3,
	input [2:0] sel_r0, sel_r1, sel_r2, sel_r3,
	input [3:0] load,
	output reg [7:0] R0,R1,R2,R3
	);
	//reg [7:0] next_R0,next_R1,next_R2,next_R3;
	reg [7:0] temp_r0, temp_r1, temp_r2, temp_r3;
	
	initial begin
		R0 = 8'd0;
		R1 = 8'd0;
		R2 = 8'd0;
		R3 = 8'd0;
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			R0 <= 8'd0;
		end
		else if(load[0] == 1'b1) begin
			R0 <= temp_r0;
		end
		else begin
			R0 <= R0;
		end
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			R1 <= 8'd0;
		end
		else if(load[1] == 1'b1) begin
			R1 <= temp_r1;
		end
		else begin
			R1 <= R1;
		end
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			R2 <= 8'd0;
		end
		else if(load[2] == 1'b1) begin
			R2 <= temp_r2;
		end
		else begin
			R2 <= R2;
		end
	end	
	
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			R3 <= 8'd0;
		end
		else if(load[3] == 1'b1) begin
			R3 <= temp_r3;
		end
		else begin
			R3 <= R3;
		end
	end
	
	always@* begin
		temp_r0 = 8'd0;
		case(sel_r0)
		3'd0 : 
			temp_r0 = R0;
		3'd1 :
			temp_r0 = R1;
		3'd2 :
			temp_r0 = R2;
		3'd3 :
			temp_r0 = R2 + R3;
		3'd4 :
			temp_r0 = data_r0;
		endcase
	end
		
	always@* begin
		temp_r1 = 8'd0;
		case(sel_r1)
		3'd0 : 
			temp_r1 = R0;
		3'd1 :
			temp_r1 = R1;
		3'd2 :
			temp_r1 = R2;
		3'd3 :
			temp_r1 = R2 + R3;
		3'd4 :
			temp_r1 = data_r1;
		endcase
	end

	always@* begin
		temp_r2 = 8'd0;
		case(sel_r2)
		3'd0 : 
			temp_r2 = R0;
		3'd1 :
			temp_r2 = R1;
		3'd2 :
			temp_r2 = R2;
		3'd3 :
			temp_r2 = R2 + R3;
		3'd4 :
			temp_r2 = data_r2;
		endcase
	end

	always@* begin
		temp_r3 = 8'd0;
		case(sel_r3)
		3'd0 : 
			temp_r3 = R0;
		3'd1 :
			temp_r3 = R1;
		3'd2 :
			temp_r3 = R2;
		3'd3 :
			temp_r3 = R2 + R3;
		3'd4 :
			temp_r3 = data_r3;
		endcase
	end
		
endmodule

