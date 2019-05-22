//////////////////////////////////////////////////////////////////////////
// Department of Computer Science
// National Tsing Hua University
// Project   : FIFO for CS4125 Digital System Design
// Module    : fifo.v
// Author    : Chih-Tsun Huang
// E-mail    : cthuang@cs.nthu.edu.tw
// Revision  : 6
// Date      : 2017/10/24
// Abstract  :
//     The top module of FIFO consists of FIFO controller and the RAM module.
// Note      :
//     1.  The purpose of this version is to provide a design style. It is
//         not a complete module. Please fix any *unexpected feature* by
//         yourself if any.
//     2.  Feel free to rewrite this file header to your own.
//

module fifo (
	input clk,
	input rst_n,
	input push,
	input pop,
	input [15:0] datain,

	output empty,
	output almost_empty,
	output full,
	output almost_full,
	output error,
	output reg [15:0] dataout
);

  //
  // NOTE: Complete your design
  // NOTE: Refer to Makefile for the way to include the memory model for simulation.
  //

	wire cen, wen, oen;
	wire [5:0] addr;

	fifo_ctr controller (
		.clk(clk),
		.rst_n(rst_n),
		.push(push),
		.pop(pop),
		
		.empty(empty),
		.almost_empty(almost_empty),
		.full(full),
		.almost_full(almost_full),
		.error(error),
		
		.cen(cen),
		.wen(wen),
		.oen(oen),
		.addr(addr)
	);
	
	reg [4:0] addr1, addr2;
	reg wen1, wen2;
	reg oen1, oen2;
	
	always@* begin
		if(addr < 6'd32) begin
			addr1 = addr[4:0];
			addr2 = 1'b0;
		end
		else begin
			addr2 = addr[4:0];
			addr1 = 1'b0;
		end
	end
	
	always@* begin
		if( ~wen & (addr < 6'd32) ) begin
			wen1 = 1'b0;
			wen2 = 1'b1;
		end
		else if( ~wen & (addr >= 6'd32) ) begin
			wen1 = 1'b1;
			wen2 = 1'b0;
		end
		else begin
			wen1 = 1'b1;
			wen2 = 1'b1;
		end
	end
	
	always@* begin
		if( ~oen & (addr < 6'd32) ) begin
			oen1 = 1'b0;
			oen2 = 1'b1;
		end
		else if( ~oen & (addr >= 6'd32) ) begin
			oen1 = 1'b1;
			oen2 = 1'b0;
		end
		else begin
			oen1 = 1'b1;
			oen2 = 1'b1;
		end
	end
	//12
	//34
	wire [7:0] dataout1, dataout2, dataout3, dataout4;
	RAM32x8 ram1 (
		.CLK(clk),
		.CEN(cen),
		.WEN(wen1),
		.OEN(oen1),
		.A(addr1),
		.D(datain[15:8]),
		
		.Q(dataout1)
	);
	
	RAM32x8 ram2 (
		.CLK(clk),
		.CEN(cen),
		.WEN(wen1),
		.OEN(oen1),
		.A(addr1),
		.D(datain[7:0]),
		
		.Q(dataout2)
	);
	
	RAM32x8 ram3 (
		.CLK(clk),
		.CEN(cen),
		.WEN(wen2),
		.OEN(oen2),
		.A(addr2),
		.D(datain[15:8]),
		
		.Q(dataout3)
	);
	
	RAM32x8 ram4 (
		.CLK(clk),
		.CEN(cen),
		.WEN(wen2),
		.OEN(oen2),
		.A(addr2),
		.D(datain[7:0]),
		
		.Q(dataout4)
	);
	
	always@* begin
		if(addr < 6'd32) begin
			dataout = {dataout1,dataout2};
		end
		else if(addr >= 6'd32) begin
			dataout = {dataout3,dataout4};
		end
	end


endmodule
