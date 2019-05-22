 `timescale 1ns/100ps

 module test;

    reg clk;
	reg rst_n;
	reg flip;
	reg hold;
    wire [3:0] out;
	wire dir, max, min;
	integer i = 0;

    hw01 h(.clk(clk),
           .rst_n(rst_n),
           .flip(flip),
           .hold(hold),
		   .out(out),
		   .dir(dir),
		   .max(max),
		   .min(min)
		  );
	
	initial begin
		clk = 1'b0;
		rst_n = 1'b1;
		flip = 1'b0;
		hold = 1'b0;
		//$monitor(clk, "time = %d out = %d", $time, out);
		//$monitor($time, "clk = %b out = %d", clk, out);
		//$monitor($time, "out = %d", out);
		//$monitor($time, "clk = %b", clk);
		#1.7 hold = 1'b1;
		#1.6 hold = 1'b0;
		#2.9 flip = 1'b1;
		#3.2 flip = 1'b0;
		#3.4 rst_n = 1'b0;
		#2.1 rst_n = 1'b1;
		
	end
	
	initial begin
		$fsdbDumpfile("hw01.fsdb");
		$fsdbDumpvars;
	end
	

	always@(posedge clk) begin
		$display("time = %d clk = %b out = %d", $time, clk, out);
	end	


	
	always begin
		#0.5 clk = ~clk;
		i = i + 1;
		if( i > 100 )
			$finish;
	end

endmodule
