/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Nov  9 11:50:06 2017
/////////////////////////////////////////////////////////////


module fifo_ctr ( clk, rst_n, push, pop, empty, almost_empty, full, 
        almost_full, error, cen, wen, oen, addr );
  output [4:0] addr;
  input clk, rst_n, push, pop;
  output empty, almost_empty, full, almost_full, error, cen, wen, oen;
  wire   N8, N9, N10, N11, N13, N14, N15, N18, N19, N20, N21, N22, N24, N25,
         N26, N27, N79, N81, N82, N83, N84, N85, N86, N87, N90, n11, n18, n19,
         n20, n22, n23, n25, n26, n27, n28, n29, n30, n31, n34, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         \add_83/carry[4] , \add_83/carry[3] , \add_83/carry[2] ,
         \add_74/carry[4] , \add_74/carry[3] , \add_74/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15, n16, n21, n24, n32,
         n33, n36, n55, n67;
  wire   [4:0] head;
  wire   [4:0] tail;
  wire   [1:0] state;
  wire   [1:0] state_next;
  assign cen = 1'b0;
  assign almost_empty = N22;

  TLATX1 head_plus_reg ( .G(1'b1), .D(n66), .Q(n1) );
  DFFRX1 \head_reg[4]  ( .D(n61), .CK(clk), .RN(rst_n), .Q(head[4]), .QN(n50)
         );
  DFFRX1 \head_reg[1]  ( .D(n63), .CK(clk), .RN(rst_n), .Q(head[1]), .QN(n52)
         );
  DFFRX1 \tail_reg[4]  ( .D(n56), .CK(clk), .RN(rst_n), .Q(tail[4]), .QN(n2)
         );
  DFFRX1 \head_reg[3]  ( .D(n65), .CK(clk), .RN(rst_n), .Q(head[3]), .QN(n54)
         );
  DFFRX1 \head_reg[2]  ( .D(n62), .CK(clk), .RN(rst_n), .Q(head[2]), .QN(n51)
         );
  DFFRX1 \tail_reg[1]  ( .D(n58), .CK(clk), .RN(rst_n), .Q(tail[1]), .QN(n3)
         );
  DFFRX1 \state_reg[0]  ( .D(state_next[0]), .CK(clk), .RN(rst_n), .Q(state[0]), .QN(n6) );
  DFFRX1 \tail_reg[3]  ( .D(n60), .CK(clk), .RN(rst_n), .Q(tail[3]), .QN(n5)
         );
  DFFRX1 \head_reg[0]  ( .D(n64), .CK(clk), .RN(rst_n), .Q(head[0]), .QN(n53)
         );
  DFFRX1 \tail_reg[2]  ( .D(n57), .CK(clk), .RN(rst_n), .Q(tail[2]), .QN(n7)
         );
  DFFRX1 \state_reg[1]  ( .D(state_next[1]), .CK(clk), .RN(rst_n), .Q(state[1]) );
  TLATX1 \addr_reg[4]  ( .G(1'b1), .D(N87), .Q(addr[4]) );
  TLATX1 \addr_reg[3]  ( .G(1'b1), .D(N86), .Q(addr[3]) );
  TLATX1 \addr_reg[2]  ( .G(1'b1), .D(N85), .Q(addr[2]) );
  TLATX1 \addr_reg[1]  ( .G(1'b1), .D(N84), .Q(addr[1]) );
  TLATX1 \addr_reg[0]  ( .G(1'b1), .D(N83), .Q(addr[0]) );
  DFFRX1 \tail_reg[0]  ( .D(n59), .CK(clk), .RN(rst_n), .Q(tail[0]), .QN(n4)
         );
  TLATX1 error_reg ( .G(1'b1), .D(N79), .Q(error) );
  TLATX1 \state_next_reg[1]  ( .G(1'b1), .D(N82), .Q(state_next[1]) );
  TLATX1 \state_next_reg[0]  ( .G(1'b1), .D(N81), .Q(state_next[0]) );
  TLATX1 wen_reg ( .G(1'b1), .D(N90), .Q(wen) );
  TLATX1 tail_plus_reg ( .G(1'b1), .D(n36), .Q(n49), .QN(n9) );
  OAI31XL U3 ( .A0(n24), .A1(n31), .A2(n55), .B0(n26), .Y(n66) );
  CLKINVX1 U4 ( .A(n66), .Y(n21) );
  AOI31X1 U5 ( .A0(full), .A1(n23), .A2(n19), .B0(n33), .Y(n22) );
  CLKINVX1 U6 ( .A(n25), .Y(n33) );
  NAND4BX1 U7 ( .AN(n18), .B(n19), .C(n11), .D(n20), .Y(N90) );
  NOR2X1 U8 ( .A(n55), .B(n67), .Y(n31) );
  NAND2X1 U9 ( .A(n18), .B(n28), .Y(n25) );
  NAND3X1 U10 ( .A(n32), .B(n24), .C(n11), .Y(oen) );
  OA22X1 U11 ( .A0(n23), .A1(n11), .B0(n19), .B1(n32), .Y(n30) );
  OAI211X1 U12 ( .A0(n23), .A1(n20), .B0(n30), .C0(n34), .Y(N79) );
  AOI21X1 U13 ( .A0(n18), .A1(empty), .B0(n31), .Y(n34) );
  OAI211X1 U14 ( .A0(n26), .A1(n27), .B0(n11), .C0(n25), .Y(N82) );
  OAI211X1 U15 ( .A0(n19), .A1(n11), .B0(n21), .C0(n29), .Y(N81) );
  OA21XL U16 ( .A0(N22), .A1(n20), .B0(n30), .Y(n29) );
  CLKINVX1 U17 ( .A(n28), .Y(n32) );
  NAND2BX1 U18 ( .AN(n23), .B(n28), .Y(n26) );
  AND4X1 U19 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(N22) );
  XOR2X1 U20 ( .A(n3), .B(N18), .Y(n44) );
  XOR2X1 U21 ( .A(n2), .B(N21), .Y(n43) );
  XOR2X1 U22 ( .A(n7), .B(N19), .Y(n46) );
  CLKINVX1 U23 ( .A(empty), .Y(n24) );
  CLKINVX1 U24 ( .A(n20), .Y(n36) );
  CLKINVX1 U25 ( .A(n11), .Y(full) );
  CLKINVX1 U26 ( .A(n27), .Y(almost_full) );
  NOR2X1 U27 ( .A(n6), .B(state[1]), .Y(n28) );
  OAI22XL U28 ( .A0(n53), .A1(n21), .B0(n22), .B1(n4), .Y(N83) );
  OAI22XL U29 ( .A0(n52), .A1(n21), .B0(n22), .B1(n3), .Y(N84) );
  OAI22XL U30 ( .A0(n51), .A1(n21), .B0(n22), .B1(n7), .Y(N85) );
  OAI22XL U31 ( .A0(n54), .A1(n21), .B0(n22), .B1(n5), .Y(N86) );
  OAI22XL U32 ( .A0(n50), .A1(n21), .B0(n22), .B1(n2), .Y(N87) );
  NAND4X1 U33 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n27) );
  XOR2X1 U34 ( .A(n52), .B(N24), .Y(n38) );
  XOR2X1 U35 ( .A(n50), .B(N27), .Y(n37) );
  XOR2X1 U36 ( .A(n51), .B(N25), .Y(n40) );
  AOI2BB1X1 U37 ( .A0N(pop), .A1N(push), .B0(n31), .Y(n19) );
  NAND2X1 U38 ( .A(state[1]), .B(state[0]), .Y(n11) );
  NOR2X1 U39 ( .A(state[0]), .B(state[1]), .Y(empty) );
  NOR2X1 U40 ( .A(n67), .B(push), .Y(n18) );
  NAND2X1 U41 ( .A(state[1]), .B(n6), .Y(n20) );
  NOR2X1 U42 ( .A(n41), .B(n42), .Y(n39) );
  XNOR2X1 U43 ( .A(n53), .B(n4), .Y(n42) );
  XNOR2X1 U44 ( .A(n54), .B(N26), .Y(n41) );
  OAI22XL U45 ( .A0(n49), .A1(n2), .B0(n9), .B1(n8), .Y(n56) );
  XNOR2X1 U46 ( .A(\add_83/carry[4] ), .B(tail[4]), .Y(n8) );
  OAI2BB2XL U47 ( .B0(n49), .B1(n7), .A0N(N14), .A1N(n49), .Y(n57) );
  OAI2BB2XL U48 ( .B0(n49), .B1(n3), .A0N(N13), .A1N(n49), .Y(n58) );
  OAI22XL U49 ( .A0(n49), .A1(n4), .B0(tail[0]), .B1(n9), .Y(n59) );
  OAI2BB2XL U50 ( .B0(n49), .B1(n5), .A0N(N15), .A1N(n49), .Y(n60) );
  OAI2BB2XL U51 ( .B0(n50), .B1(n1), .A0N(N11), .A1N(n1), .Y(n61) );
  OAI2BB2XL U52 ( .B0(n51), .B1(n1), .A0N(N9), .A1N(n1), .Y(n62) );
  OAI2BB2XL U53 ( .B0(n52), .B1(n1), .A0N(N8), .A1N(n1), .Y(n63) );
  OAI2BB2XL U54 ( .B0(n53), .B1(n1), .A0N(n53), .A1N(n1), .Y(n64) );
  OAI2BB2XL U55 ( .B0(n54), .B1(n1), .A0N(N10), .A1N(n1), .Y(n65) );
  NAND2X1 U56 ( .A(push), .B(n67), .Y(n23) );
  ADDHXL U57 ( .A(tail[1]), .B(tail[0]), .CO(\add_83/carry[2] ), .S(N13) );
  ADDHXL U58 ( .A(tail[2]), .B(\add_83/carry[2] ), .CO(\add_83/carry[3] ), .S(
        N14) );
  ADDHXL U59 ( .A(head[1]), .B(head[0]), .CO(\add_74/carry[2] ), .S(N8) );
  CLKINVX1 U60 ( .A(pop), .Y(n67) );
  ADDHXL U61 ( .A(head[2]), .B(\add_74/carry[2] ), .CO(\add_74/carry[3] ), .S(
        N9) );
  NOR2X1 U62 ( .A(n47), .B(n48), .Y(n45) );
  XOR2X1 U63 ( .A(tail[0]), .B(n53), .Y(n48) );
  XOR2X1 U64 ( .A(tail[3]), .B(N20), .Y(n47) );
  ADDHXL U65 ( .A(tail[3]), .B(\add_83/carry[3] ), .CO(\add_83/carry[4] ), .S(
        N15) );
  ADDHXL U66 ( .A(head[3]), .B(\add_74/carry[3] ), .CO(\add_74/carry[4] ), .S(
        N10) );
  CLKINVX1 U67 ( .A(push), .Y(n55) );
  XOR2X1 U68 ( .A(\add_74/carry[4] ), .B(head[4]), .Y(N11) );
  NOR2X1 U71 ( .A(head[1]), .B(head[0]), .Y(n10) );
  AO21X1 U72 ( .A0(head[0]), .A1(head[1]), .B0(n10), .Y(N18) );
  NAND2X1 U73 ( .A(n10), .B(n51), .Y(n12) );
  OAI21XL U74 ( .A0(n10), .A1(n51), .B0(n12), .Y(N19) );
  XNOR2X1 U75 ( .A(head[3]), .B(n12), .Y(N20) );
  NOR2X1 U76 ( .A(head[3]), .B(n12), .Y(n13) );
  XOR2X1 U77 ( .A(head[4]), .B(n13), .Y(N21) );
  NOR2X1 U78 ( .A(tail[1]), .B(tail[0]), .Y(n14) );
  AO21X1 U79 ( .A0(tail[0]), .A1(tail[1]), .B0(n14), .Y(N24) );
  NAND2X1 U80 ( .A(n14), .B(n7), .Y(n15) );
  OAI21XL U81 ( .A0(n14), .A1(n7), .B0(n15), .Y(N25) );
  XNOR2X1 U82 ( .A(tail[3]), .B(n15), .Y(N26) );
  NOR2X1 U83 ( .A(tail[3]), .B(n15), .Y(n16) );
  XOR2X1 U84 ( .A(tail[4]), .B(n16), .Y(N27) );
endmodule


module fifo ( clk, rst_n, push, pop, datain, empty, almost_empty, full, 
        almost_full, error, dataout );
  input [7:0] datain;
  output [7:0] dataout;
  input clk, rst_n, push, pop;
  output empty, almost_empty, full, almost_full, error;
  wire   wen, oen;
  wire   [4:0] addr;

  RAM32x8 ram ( .Q(dataout), .A(addr), .D(datain), .CLK(clk), .CEN(1'b0), 
        .OEN(oen), .WEN(wen) );
  fifo_ctr controller ( .clk(clk), .rst_n(rst_n), .push(push), .pop(pop), 
        .empty(empty), .almost_empty(almost_empty), .full(full), .almost_full(
        almost_full), .error(error), .wen(wen), .oen(oen), .addr(addr) );
endmodule

