`timescale 1ns/100ps

 module hw02_a_1_test;

    reg clk;
	reg rst_n;
	reg [7:0] data_r0, data_r1, data_r2, data_r3;
	reg [2:0] sel_r0, sel_r1, sel_r2, sel_r3;
	reg [3:0] load;
    wire [7:0] R0, R1, R2, R3;
	integer i = 0;

    hw02_a_2 h(.clk(clk),
			   .rst_n(rst_n),
			   .data_r0(data_r0),.data_r1(data_r1),.data_r2(data_r2),.data_r3(data_r3),
			   .sel_r0(sel_r0),.sel_r1(sel_r1),.sel_r2(sel_r2),.sel_r3(sel_r3),
			   .load(load),
			   .R0(R0),.R1(R1),.R2(R2),.R3(R3)
			  );
	
	initial begin
		clk = 1'b0;
		rst_n = 1'b1;
		
		//R0~3都變成1
		sel_r0 = 3'd4;sel_r1 = 3'd4;sel_r2 = 3'd4;sel_r3 = 3'd4;
		load = 4'b1111;
		data_r0 = 8'd1;data_r1 = 8'd1;data_r2 = 8'd1;data_r3 = 8'd1;
		#10
		
		repeat(4) begin
			//R2+R3 => R0、R3
			sel_r0 = 3'd3;
			sel_r3 = 3'd3;
			load = 4'b1001;
			#10;
			
			//R0 => R3
			//sel = 3'd0;
			//load = 4'b1000;
			//#10;
			
			//R2+R3 => R0、R2
			sel_r0 = 3'd3;
			sel_r2 = 3'd3;
			load = 4'b0101;
			#10 load = 4'b0;
			
			//R0 => R2
			//sel = 3'd0;
			//load = 4'b0100;
			//#10;		
		end	
		
	end
	
	initial begin
		$fsdbDumpfile("hw02_a_2.fsdb");
		$fsdbDumpvars;
	end
	

	always@(posedge clk) begin
		$display("time = %d clk = %b R0 = %d", $time, clk, R0);
	end	


	
	always begin
		#5 clk = ~clk;
		i = i + 1;
		if( i > 30 )
			$finish;
	end

endmodule


