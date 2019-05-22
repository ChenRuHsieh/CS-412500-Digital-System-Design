/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Nov 27 21:08:31 2017
/////////////////////////////////////////////////////////////


module Antman_1 ( clk, rst_n, ant_r, ant_l, hit, escape, move );
  output [1:0] move;
  input clk, rst_n, ant_r, ant_l, hit, escape;
  wire   N27, N28, N29, N30, N31, n2, n3, n4;
  wire   [1:0] state;
  wire   [1:0] next_state;
  wire   [1:0] before_LR;
  assign N30 = ant_r;
  assign N31 = ant_l;

  TLATX1 \before_LR_reg[0]  ( .G(N27), .D(N30), .Q(before_LR[0]) );
  TLATX1 \before_LR_reg[1]  ( .G(N27), .D(N31), .Q(before_LR[1]) );
  DFFRX1 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rst_n), .Q(state[0]), .QN(n4) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rst_n), .Q(state[1]) );
  TLATX1 \move_reg[1]  ( .G(N27), .D(N29), .Q(move[1]) );
  TLATX1 \move_reg[0]  ( .G(N27), .D(N28), .Q(move[0]) );
  TLATX1 \next_state_reg[0]  ( .G(N27), .D(N28), .Q(next_state[0]) );
  TLATX1 \next_state_reg[1]  ( .G(N27), .D(N29), .Q(next_state[1]) );
  OAI2BB2XL U9 ( .B0(N30), .B1(n2), .A0N(n4), .A1N(state[1]), .Y(N29) );
  NOR3BXL U10 ( .AN(state[0]), .B(N31), .C(state[1]), .Y(n2) );
  NAND4X1 U11 ( .A(state[1]), .B(state[0]), .C(before_LR[1]), .D(n3), .Y(N28)
         );
  NOR3X1 U12 ( .A(N30), .B(before_LR[0]), .C(N31), .Y(n3) );
  NAND2BX1 U13 ( .AN(N30), .B(n2), .Y(N27) );
endmodule

