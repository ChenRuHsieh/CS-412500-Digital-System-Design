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
	input [7:0] datain,

	output empty,
	output almost_empty,
	output full,
	output almost_full,
	output error,
	output [7:0] dataout
);

  //
  // NOTE: Complete your design
  // NOTE: Refer to Makefile for the way to include the memory model for simulation.
  //

	wire cen, wen, oen;
	wire [4:0] addr;

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
	
	RAM32x8 ram (
		.CLK(clk),
		.CEN(cen),
		.WEN(wen),
		.OEN(oen),
		.A(addr),
		.D(datain),
		
		.Q(dataout)
	);


endmodule
