`timescale 1ns/100ps

 module hw02_b_test;

    reg clk;
	reg rst_n;
	reg [7:0] data;
	reg [2:0] sel;
	reg [3:0] load;
    wire [7:0] R0, R1, R2, R3;
	integer i = 0;

    hw02_b h(.clk(clk),
             .rst_n(rst_n),
             .data(data),
			 .sel(sel),
			 .load(load),
			 .R0(R0),.R1(R1),.R2(R2),.R3(R3)
			);
	
	initial begin
		clk = 1'b0;
		rst_n = 1'b0; 
		#10 rst_n = 1'b1;
		
		//A = {2 , 5 , 8 ,1}
		//B = {5 , 3 , 10 , 7}
		//a0 => R1
		sel = 3'd4;load = 4'b0010;data = 8'd2;
		#10;
		//b0 => R2
		sel = 3'd4;load = 4'b0100;data = 8'd5;
		#10;
		//a0 * b0 => R3
		sel = 3'd3;load = 4'b1000;
		#10;
		
		//a1 => R1
		sel = 3'd4;load = 4'b0010;data = 8'd5;
		#10;
		//b1 => R2
		sel = 3'd4;load = 4'b0100;data = 8'd3;
		#10;
		//a1 * b1 => R3
		sel = 3'd3;load = 4'b1000;
		#10;		

		//a2 => R1
		sel = 3'd4;load = 4'b0010;data = 8'd8;
		#10;
		//b2 => R2
		sel = 3'd4;load = 4'b0100;data = 8'd10;
		#10;
		//a2 * b2 => R3
		sel = 3'd3;load = 4'b1000;
		#10;
		
		//a3 => R1
		sel = 3'd4;load = 4'b0010;data = 8'd1;
		#10;
		//b3 => R2
		sel = 3'd4;load = 4'b0100;data = 8'd7;
		#10;
		//a3 * b3 => R3
		sel = 3'd3;load = 4'b1000;
		#10;
		load = 4'b0000;
	end
	
	initial begin
		$fsdbDumpfile("hw02_b.fsdb");
		$fsdbDumpvars;
	end

	always@(posedge clk) begin
		$display("time = %d clk = %b R1 = %d R2 = %d R3 = %d", $time, clk, R1, R2, R3);
	end	


	
	always begin
		#5 clk = ~clk;
		i = i + 1;
		if( i > 60 )
			$finish;
	end

endmodule


