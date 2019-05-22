module hw01(
	input clk,
	input rst_n,
	input flip,
	input hold,
	output reg [3:0] out,
	output reg dir,
	output max, min
	);
	reg [3:0] next_out;
	
	initial begin
		out = 4'b0;
		dir = 1'b0;
	end
	
	assign max = (out == 4'b1111)? 1'b1 : 1'b0;
	assign min = (out == 4'b0000)? 1'b1 : 1'b0;
	
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n)
			out = 4'b0;
		else 
			out = next_out;
	end
	
	always@* begin
		if(hold)
			next_out = out;
		else if(max)
			next_out = out - 1'b1;
		else if(min)
			next_out = out + 1'b1;
		else if(dir)
			next_out = out - 1'b1;
		else
			next_out = out + 1'b1;
	end
	
	always@(posedge clk) begin
		if(flip)
			dir = ~dir;
		else if(max & ~dir) begin
			dir = ~dir;
		end
		else if(min & dir) begin
			dir = ~dir;
		end
		else begin
			dir = dir;
		end
	end
	
endmodule