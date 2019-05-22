`define Stop 2'b00
`define Turn_Right 2'b01
`define Turn_Left 2'b10
`define Move_Forward 2'b11

module Antman (
	input wire clk,
	input wire rst_n,
	input wire ant_r,
	input wire ant_l,
	input wire hit,
	input wire escape,
	// challenge mode
	`ifdef CHALLENGE
	output reg [`PH_WIDTH - 1:0] ph_drop,
	input wire [`PH_WIDTH - 1:0] ph_detected,
	`endif
	output reg [1:0] move
);

// parameters: action
	parameter [1:0] halt       = `HALT;
	parameter [1:0] turn_right = `RIGHT;
	parameter [1:0] turn_left  = `LEFT;
	parameter [1:0] forward    = `FORWARD;
	parameter cyc = `CYC;
	parameter delay = `DELAY;
	
	reg [1:0] dir, next_dir;
	reg [1:0] state;
	reg [1:0] next_state;
	wire [1:0] LR;
	reg [1:0] before_LR;
	
	assign LR = { ant_l , ant_r };
	
	
	always@(posedge clk or negedge rst_n) 
	begin
		if(~rst_n)
		begin
			state = `Stop;
			dir = 2'b00;
		end
		else
		begin
			state = next_state;
			dir = next_dir;
		end
	end
	
`ifndef CHALLENGE
	always@*
	case(state)
		`Stop :
			if( (LR == 2'b10) | (LR == 2'b00) )
			begin
				next_state = `Move_Forward;
				before_LR = LR;
				move = forward;
			end
			else if( (LR == 2'b01) | (LR == 2'b11) )
			begin
				next_state = `Turn_Right;
				before_LR = LR;
				move = turn_right;
			end
		`Turn_Right :
			if( (LR == 2'b01) | (LR == 2'b11) )
			begin
				next_state = `Turn_Right;
				before_LR = LR;
				move = turn_right;
			end
			else if( LR == 2'b10 )
			begin
				next_state = `Move_Forward;
				before_LR = LR;
				move = forward;
			end
		`Turn_Left :
			begin
				next_state = `Move_Forward;
				before_LR = LR;
				move = forward;
			end
		`Move_Forward :
			if( (LR == 2'b01) | (LR == 2'b11) )
			begin
				next_state = `Turn_Right;
				before_LR = LR;
				move = turn_right;
			end
			else if( (LR == 2'b00) & (before_LR == 2'b10) )
			begin
				next_state = `Turn_Left;
				before_LR = LR;
				move = turn_left;
			end
			else if( (LR == 2'b10) | (LR == 2'b00) )
			begin
				next_state = `Move_Forward;
				before_LR = LR;
				move = forward;
			end
	endcase
`endif

`ifdef CHALLENGE
	always@*
	case(state)
		`Stop :
			if( (LR == 2'b10) | (LR == 2'b00) )
			begin
				next_state = `Move_Forward;
				before_LR = LR;
				ph_drop = 2'b11;
				next_dir = dir;
				move = forward;
			end
			else if( (LR == 2'b01) | (LR == 2'b11) )
			begin
				next_state = `Turn_Right;
				before_LR = LR;
				ph_drop = 2'b11;
				next_dir = dir + 1'b1;
				move = turn_right;
			end
		`Turn_Right :
			if( (LR == 2'b01) | (LR == 2'b11) )
			begin
				next_state = `Turn_Right;
				before_LR = LR;
				ph_drop = 2'b11;
				next_dir = dir + 1'b1;
				move = turn_right;
			end
			else if( LR == 2'b10 )
			begin
				next_state = `Move_Forward;
				before_LR = LR;
				ph_drop = 2'b11;
				next_dir = dir;
				move = forward;
			end
		`Turn_Left :
			begin
				next_state = `Move_Forward;
				before_LR = LR;
				ph_drop = 2'b11;
				next_dir = dir;
				move = forward;
			end
		`Move_Forward :
			if( (LR == 2'b01) | (LR == 2'b11) )
			begin
				next_state = `Turn_Right;
				before_LR = LR;
				ph_drop = 2'b11;
				next_dir = dir + 1'b1;
				move = turn_right;
			end
			else if( (LR == 2'b00) & ( ph_detected == 2'b11) & (next_dir == 2'b00))
			begin
				next_state = `Move_Forward;
				before_LR = LR;
				ph_drop = 2'b11;
				next_dir = dir;
				move = forward;
			end
			else if( (LR == 2'b00) & (before_LR == 2'b10) )
			begin
				next_state = `Turn_Left;
				before_LR = LR;
				ph_drop = 2'b11;
				next_dir = dir - 1'b1;
				move = turn_left;
			end
			else if( (LR == 2'b10) | (LR == 2'b00) )
			begin
				next_state = `Move_Forward;
				before_LR = LR;
				ph_drop = 2'b11;
				next_dir = dir;
				move = forward;
			end
	endcase
`endif	

	

endmodule
