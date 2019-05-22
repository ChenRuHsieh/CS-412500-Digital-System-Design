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

  //
  // NOTE: Complete your design
  //

  // sequential part
  always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
      state <= EMPTY;
      head  <= ...
      tail  <= ...
    end else begin
      state <= #(delay) state_next;
      ...
    end
  end


  // combinational parts


endmodule
