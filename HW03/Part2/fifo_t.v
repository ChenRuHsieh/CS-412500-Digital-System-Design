// Put your file header here
//

module stimulus;
	parameter period = 20;
	parameter delay = 2;

  
	// inputs
	reg clk;
	reg rst_n;
	reg push, pop;
	reg [7:0] datain;
	// outputs
	wire empty, almost_empty;
	wire full, almost_full;
	wire error;
	wire [7:0] dataout;
	integer i = 0;
	fifo fifo1 (
		.clk(clk),
		.rst_n(rst_n),
		.push(push),
		.pop(pop),
		.datain(datain),

		.empty(empty),
		.almost_empty(almost_empty),
		.full(full),
		.almost_full(almost_full),
		.error(error),
		.dataout(dataout)
	);

	always #(period/2) clk = ~clk;

	initial begin
		`ifdef SYNTHESIS
		  $sdf_annotate("fifo_syn.sdf", fifo1);
		  $fsdbDumpfile("fifo_syn.fsdb");
		`else
		  $fsdbDumpfile("fifo.fsdb");
		`endif
		$fsdbDumpvars;
	end

	initial begin
		clk = 1;
		rst_n = 1;
		idle;
		#(period);
		#(delay)  rst_n = 0;
		#(period*4) rst_n = 1;

		#(period*2);
		
		#(period) invalid;
		#(period) popping;
		#(period) pushing(8'd1);
		#(period) invalid;
		#(period) popping;
		#(period) idle;
		#(period) invalid;
		#(period) idle;
		//FULL
		repeat(64) begin
			#(period) pushing(i);
			i = i + 1'b1;
		end
		#(period) invalid;
		#(period) idle;
		#(period) popping;
		#(period) idle;
		#(period) popping;
		#(period) idle;
		#(period) popping;
		#(period) idle;
		#(period) invalid;
		
		
		/*
		#(period) idle;
		#(period) popping;
		#(period) pushing(8'd1);
		#(period) idle;
		#(period) pushing(8'd2);
		#(period) pushing(8'd3);
		#(period) popping;
		#(period) pushing(8'd4);
		#(period) invalid;
		#(period) popping;
		#(period) pushing(8'd5);
		#(period) popping;
		#(period) idle;
		#(period) idle;
		#(period) idle;
		#(period) idle;
		#(period) idle;
		*/
		#(period*4);
		$finish;
	end

	// tasks
	task idle;
		begin
			push = 0;
			pop = 0;
			datain = 8'b0;
		end
	endtask
	
	task pushing;
	input [7:0] data;
		begin
			push = 1;
			pop = 0;
			datain = data;
		end
	endtask
	
	task popping;
		begin
			push = 0;
			pop = 1;
		end
	endtask
	
	task invalid;
		begin
			push = 1;
			pop = 1;
		end
	endtask

endmodule
