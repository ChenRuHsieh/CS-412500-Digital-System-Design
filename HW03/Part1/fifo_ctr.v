//////////////////////////////////////////////////////////////////////////
// Department of Computer Science
// National Tsing Hua University
// Project   : FIFO for CS4125 Digital System Design
// Module    : fifo_ctl.v
// Author    : Chih-Tsun Huang
// E-mail    : cthuang@cs.nthu.edu.tw
// Revision  : 6
// Date      : 2017/10/24
// Abstract  :
//     FIFO controller is mainly the finite state machine and its
//     control signals to manage the RAM module.
// Note      :
//     1.  The purpose of this version is to provide a design style. It is
//         not a complete module. Please fix any *unexpected feature* by
//         yourself if any.
//     2.  Feel free to rewrite this file header to your own.
//

module fifo_ctr (

	// inputs
	input wire clk,
	input wire rst_n,
	input wire push,
	input wire pop,

	// outputs
	output reg empty,
	output reg almost_empty,
	output reg full,
	output reg almost_full,
	output reg error,
	output reg cen,
	output reg wen,
	output reg oen,
	output reg [4:0] addr
);

	// small delay of flip-flop outputs
	parameter delay = 1.0;

	// state encoding
	parameter EMPTY   = 2'b00;
	parameter BETWEEN = 2'b01;
	parameter READOUT = 2'b10;
	parameter FULL    = 2'b11;

	// state vector
	reg    [1:0] state;
	reg    [1:0] state_next;

	// pointers
	reg    [4:0] head;
	reg    [4:0] head_next;
	reg    [4:0] tail;
	reg    [4:0] tail_next;

	// control flags
	reg    head_plus;
	reg    tail_plus;
	reg    addr_head;
	reg    addr_tail;

	wire do_idle = (push == 1'b0) && (pop == 1'b0);
	wire do_push = (push == 1'b1) && (pop == 1'b0);
	wire do_pop = (push == 1'b0) && (pop == 1'b1);
	wire do_push_pop = (push == 1'b1) && (pop == 1'b1);
	
	
	
	always@(head_plus or head) begin
		if (head_plus == 1'b1) begin
			head_next = (head + 1'b1) % 6'd32;
		end 
		else begin
			head_next = head;
		end
	end
	
	always@(tail_plus or tail) begin
		if (tail_plus == 1'b1) begin
			tail_next = (tail + 1'b1) % 6'd32;
		end 
		else begin
			tail_next = tail;
		end
	end
	
	always@* begin
		if(tail == head - 1'b1) begin
			almost_empty = 1'b1;
		end
		else begin
			almost_empty = 1'b0;
		end
	end
	
	always@* begin
		if(head == tail -1'b1) begin
			almost_full = 1'b1;
		end
		else begin
			almost_full = 1'b0;
		end
	end
	
	// sequential part
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 0) begin
			state <= EMPTY;
			head  <= 1'b0;
			tail  <= 1'b0;
			cen <= 1'b0;
		end 
		else begin
			state <= #(delay) state_next;
			head <= #(delay) head_next;
			tail <= #(delay) tail_next;
			cen <= 1'b0;
		end
	end

	always@*
		case(state)
		EMPTY : 
		begin
			empty = 1'b1;
			full = 1'b0;
			oen = 1'b1;
			if( do_idle | do_pop | do_push_pop ) begin
				state_next = EMPTY;
				addr = 1'b0;
				head_plus = 1'b0;
				tail_plus = 1'b0;
				wen = 1'b1;
				error = (do_pop) | (do_push_pop);
			end
			else if( do_push ) begin
				state_next = BETWEEN;
				addr = head;
				head_plus = 1'b1;
				tail_plus = 1'b0;
				wen = 1'b0;
				error = 1'b0;
			end
		end
		BETWEEN :
		begin
			empty = 1'b0;
			full = 1'b0;
			oen = 1'b1;
			if(do_push & ~almost_full) begin
				state_next = BETWEEN;
				addr = head;
				head_plus = 1'b1;
				tail_plus = 1'b0;
				wen = 1'b0;
				error = 1'b0;
			end
			else if(do_push & almost_full) begin
				state_next = FULL;
				addr = head;
				head_plus = 1'b1;
				tail_plus = 1'b0;
				wen = 1'b0;
				error = 1'b0;
			end
			else if(do_idle | do_push_pop) begin
				state_next = BETWEEN;
				addr = 1'b0;
				head_plus = 1'b0;
				tail_plus = 1'b0;
				wen = 1'b1;
				error = (do_push_pop);
			end
			else if(do_pop) begin
				state_next = READOUT;
				addr = tail;
				head_plus = 1'b0;
				tail_plus = 1'b0;
				wen = 1'b1;
				error = 1'b0;
			end
		end
		READOUT :
		begin
			empty = 1'b0;
			full = 1'b0;
			oen = 1'b0;
			if(~almost_empty) begin
				state_next = BETWEEN;
				addr = 1'b0;
				head_plus = 1'b0;
				tail_plus = 1'b1;
				wen = 1'b1;
				error = (do_push) | (do_push_pop);
			end
			else if(almost_empty) begin
				state_next = EMPTY;
				addr = 1'b0;
				head_plus = 1'b0;
				tail_plus = 1'b1;
				wen = 1'b1;
				error = (do_push) | (do_push_pop);			
			end
		end
		FULL :
		begin
			empty = 1'b0;
			full = 1'b1;
			oen = 1'b1;
			if( do_idle | do_push | do_push_pop ) begin
				state_next = FULL;
				addr = 1'b0;
				head_plus = 1'b0;
				tail_plus = 1'b0;
				wen = 1'b1;
				error = (do_push) | (do_push_pop);
			end
			else if(do_pop) begin
				state_next = READOUT;
				addr = tail;
				head_plus = 1'b0;
				tail_plus = 1'b0;
				wen = 1'b1;
				error = 1'b0;
			end
		end
	endcase

	// combinational parts


endmodule
