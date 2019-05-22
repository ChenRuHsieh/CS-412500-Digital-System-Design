module hw02_b(
	input clk,
	input rst_n,
	input [7:0] data,
	input [3:0] sel,
	input [3:0] load,
	output reg [7:0] R0,R1,R2,R3
	);
	//reg [7:0] next_R0,next_R1,next_R2,next_R3;
	reg [7:0] temp;
	
	
	//A
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			R0 <= 8'd0;
		end
		else if(load[0] == 1'b1) begin
			R0 <= temp;
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
			R1 <= temp;
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
			R2 <= temp;
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
			R3 <= temp;
		end
		else begin
			R3 <= R3;
		end
	end
	
	always@* begin
		temp = 8'd0;
		case(sel)
		3'd0 : temp = R0;
		3'd1 : temp = R1;
		3'd2 : temp = R2;
		3'd3 : temp = R3 + R1 * R2;
		3'd4 : temp = data;
		endcase
	end

	
	

	
endmodule

