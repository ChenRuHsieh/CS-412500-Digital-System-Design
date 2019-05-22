/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Nov  9 14:45:29 2017
/////////////////////////////////////////////////////////////


module fifo_ctr ( clk, rst_n, push, pop, empty, almost_empty, full, 
        almost_full, error, cen, wen, oen, addr );
  output [5:0] addr;
  input clk, rst_n, push, pop;
  output empty, almost_empty, full, almost_full, error, cen, wen, oen;
  wire   N8, N9, N10, N11, N12, N14, N15, N16, N17, N20, N21, N22, N23, N24,
         N25, N27, N28, N29, N30, N31, N86, N88, N89, N90, N91, N92, N93, N94,
         N95, N98, n11, n19, n20, n21, n23, n24, n26, n27, n28, n29, n30, n31,
         n32, n35, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, \add_83/carry[5] ,
         \add_83/carry[4] , \add_83/carry[3] , \add_83/carry[2] ,
         \add_74/carry[5] , \add_74/carry[4] , \add_74/carry[3] ,
         \add_74/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13,
         n14, n15, n16, n17, n18, n22, n33, n34, n36, n37, n73, n75, n76;
  wire   [5:0] head;
  wire   [5:0] tail;
  wire   [1:0] state;
  wire   [1:0] state_next;
  assign cen = 1'b0;
  assign almost_empty = N25;

  TLATX1 head_plus_reg ( .G(1'b1), .D(n72), .Q(n1) );
  DFFRX1 \head_reg[5]  ( .D(n66), .CK(clk), .RN(rst_n), .Q(head[5]), .QN(n53)
         );
  TLATX1 wen_reg ( .G(1'b1), .D(N98), .Q(wen) );
  TLATX1 \addr_reg[4]  ( .G(1'b1), .D(N94), .Q(addr[4]) );
  TLATX1 \addr_reg[3]  ( .G(1'b1), .D(N93), .Q(addr[3]) );
  TLATX1 \addr_reg[2]  ( .G(1'b1), .D(N92), .Q(addr[2]) );
  TLATX1 \addr_reg[1]  ( .G(1'b1), .D(N91), .Q(addr[1]) );
  TLATX1 \addr_reg[0]  ( .G(1'b1), .D(N90), .Q(addr[0]) );
  DFFRX1 \head_reg[1]  ( .D(n69), .CK(clk), .RN(rst_n), .Q(head[1]), .QN(n56)
         );
  DFFRX1 \head_reg[2]  ( .D(n68), .CK(clk), .RN(rst_n), .Q(head[2]), .QN(n55)
         );
  DFFRX1 \head_reg[4]  ( .D(n71), .CK(clk), .RN(rst_n), .Q(head[4]), .QN(n58)
         );
  DFFRX1 \tail_reg[5]  ( .D(n60), .CK(clk), .RN(rst_n), .Q(tail[5]), .QN(n7)
         );
  DFFRX1 \head_reg[3]  ( .D(n67), .CK(clk), .RN(rst_n), .Q(head[3]), .QN(n54)
         );
  DFFRX1 \tail_reg[1]  ( .D(n63), .CK(clk), .RN(rst_n), .Q(tail[1]), .QN(n4)
         );
  DFFRX1 \tail_reg[2]  ( .D(n62), .CK(clk), .RN(rst_n), .Q(tail[2]), .QN(n3)
         );
  TLATX1 \addr_reg[5]  ( .G(1'b1), .D(N95), .Q(addr[5]) );
  DFFRX1 \state_reg[0]  ( .D(state_next[0]), .CK(clk), .RN(rst_n), .Q(state[0]), .QN(n6) );
  DFFRX1 \head_reg[0]  ( .D(n70), .CK(clk), .RN(rst_n), .Q(head[0]), .QN(n57)
         );
  DFFRX1 \tail_reg[4]  ( .D(n65), .CK(clk), .RN(rst_n), .Q(tail[4]), .QN(n5)
         );
  DFFRX1 \state_reg[1]  ( .D(state_next[1]), .CK(clk), .RN(rst_n), .Q(state[1]) );
  DFFRX1 \tail_reg[3]  ( .D(n61), .CK(clk), .RN(rst_n), .Q(tail[3]), .QN(n8)
         );
  DFFRX1 \tail_reg[0]  ( .D(n64), .CK(clk), .RN(rst_n), .Q(tail[0]), .QN(n2)
         );
  TLATX1 error_reg ( .G(1'b1), .D(N86), .Q(error) );
  TLATX1 \state_next_reg[1]  ( .G(1'b1), .D(N89), .Q(state_next[1]) );
  TLATX1 \state_next_reg[0]  ( .G(1'b1), .D(N88), .Q(state_next[0]) );
  TLATX1 tail_plus_reg ( .G(1'b1), .D(n73), .Q(n52), .QN(n10) );
  OAI31XL U3 ( .A0(n34), .A1(n32), .A2(n75), .B0(n27), .Y(n72) );
  CLKINVX1 U4 ( .A(n72), .Y(n33) );
  AOI31X1 U5 ( .A0(full), .A1(n24), .A2(n20), .B0(n37), .Y(n23) );
  CLKINVX1 U6 ( .A(n26), .Y(n37) );
  NAND4BX1 U7 ( .AN(n19), .B(n20), .C(n11), .D(n21), .Y(N98) );
  NOR2X1 U8 ( .A(n75), .B(n76), .Y(n32) );
  NAND2X1 U9 ( .A(n19), .B(n29), .Y(n26) );
  OA22X1 U10 ( .A0(n24), .A1(n11), .B0(n20), .B1(n36), .Y(n31) );
  NAND3X1 U11 ( .A(n36), .B(n34), .C(n11), .Y(oen) );
  OAI211X1 U12 ( .A0(n24), .A1(n21), .B0(n31), .C0(n35), .Y(N86) );
  AOI21X1 U13 ( .A0(n19), .A1(empty), .B0(n32), .Y(n35) );
  OAI211X1 U14 ( .A0(n27), .A1(n28), .B0(n11), .C0(n26), .Y(N89) );
  OAI211X1 U15 ( .A0(n20), .A1(n11), .B0(n33), .C0(n30), .Y(N88) );
  OA21XL U16 ( .A0(N25), .A1(n21), .B0(n31), .Y(n30) );
  CLKINVX1 U17 ( .A(n29), .Y(n36) );
  NAND2BX1 U18 ( .AN(n24), .B(n29), .Y(n27) );
  AND4X1 U19 ( .A(n45), .B(n46), .C(n47), .D(n48), .Y(N25) );
  XOR2X1 U20 ( .A(n2), .B(n57), .Y(n46) );
  XOR2X1 U21 ( .A(n3), .B(N21), .Y(n45) );
  XOR2X1 U22 ( .A(n4), .B(N20), .Y(n47) );
  CLKINVX1 U23 ( .A(empty), .Y(n34) );
  CLKINVX1 U24 ( .A(n21), .Y(n73) );
  CLKINVX1 U25 ( .A(n11), .Y(full) );
  CLKINVX1 U26 ( .A(n28), .Y(almost_full) );
  NOR2X1 U27 ( .A(n6), .B(state[1]), .Y(n29) );
  OAI22XL U28 ( .A0(n57), .A1(n33), .B0(n23), .B1(n2), .Y(N90) );
  OAI22XL U29 ( .A0(n56), .A1(n33), .B0(n23), .B1(n4), .Y(N91) );
  OAI22XL U30 ( .A0(n55), .A1(n33), .B0(n23), .B1(n3), .Y(N92) );
  OAI22XL U31 ( .A0(n54), .A1(n33), .B0(n23), .B1(n8), .Y(N93) );
  OAI22XL U32 ( .A0(n58), .A1(n33), .B0(n23), .B1(n5), .Y(N94) );
  OAI22XL U33 ( .A0(n53), .A1(n33), .B0(n23), .B1(n7), .Y(N95) );
  NOR3X1 U34 ( .A(n42), .B(n43), .C(n44), .Y(n41) );
  XNOR2X1 U35 ( .A(n58), .B(N30), .Y(n44) );
  XNOR2X1 U36 ( .A(n53), .B(N31), .Y(n43) );
  XNOR2X1 U37 ( .A(n54), .B(N29), .Y(n42) );
  NAND4X1 U38 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n28) );
  XOR2X1 U39 ( .A(n57), .B(n2), .Y(n39) );
  XOR2X1 U40 ( .A(n56), .B(N27), .Y(n40) );
  XOR2X1 U41 ( .A(n55), .B(N28), .Y(n38) );
  AOI2BB1X1 U42 ( .A0N(pop), .A1N(push), .B0(n32), .Y(n20) );
  NAND2X1 U43 ( .A(state[1]), .B(state[0]), .Y(n11) );
  NOR2X1 U44 ( .A(state[0]), .B(state[1]), .Y(empty) );
  NOR2X1 U45 ( .A(n76), .B(push), .Y(n19) );
  NOR3X1 U46 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  XOR2X1 U47 ( .A(tail[4]), .B(N23), .Y(n51) );
  XOR2X1 U48 ( .A(tail[5]), .B(N24), .Y(n50) );
  XOR2X1 U49 ( .A(tail[3]), .B(N22), .Y(n49) );
  NAND2X1 U50 ( .A(state[1]), .B(n6), .Y(n21) );
  OAI22XL U51 ( .A0(n52), .A1(n7), .B0(n10), .B1(n9), .Y(n60) );
  XNOR2X1 U52 ( .A(\add_83/carry[5] ), .B(tail[5]), .Y(n9) );
  OAI2BB2XL U53 ( .B0(n52), .B1(n8), .A0N(N16), .A1N(n52), .Y(n61) );
  OAI2BB2XL U54 ( .B0(n52), .B1(n3), .A0N(N15), .A1N(n52), .Y(n62) );
  OAI2BB2XL U55 ( .B0(n52), .B1(n4), .A0N(N14), .A1N(n52), .Y(n63) );
  OAI22XL U56 ( .A0(n52), .A1(n2), .B0(tail[0]), .B1(n10), .Y(n64) );
  OAI2BB2XL U57 ( .B0(n52), .B1(n5), .A0N(N17), .A1N(n52), .Y(n65) );
  OAI2BB2XL U58 ( .B0(n53), .B1(n1), .A0N(N12), .A1N(n1), .Y(n66) );
  OAI2BB2XL U59 ( .B0(n54), .B1(n1), .A0N(N10), .A1N(n1), .Y(n67) );
  OAI2BB2XL U60 ( .B0(n55), .B1(n1), .A0N(N9), .A1N(n1), .Y(n68) );
  OAI2BB2XL U61 ( .B0(n56), .B1(n1), .A0N(N8), .A1N(n1), .Y(n69) );
  OAI2BB2XL U62 ( .B0(n57), .B1(n1), .A0N(n57), .A1N(n1), .Y(n70) );
  OAI2BB2XL U63 ( .B0(n58), .B1(n1), .A0N(N11), .A1N(n1), .Y(n71) );
  NAND2X1 U64 ( .A(push), .B(n76), .Y(n24) );
  ADDHXL U65 ( .A(tail[1]), .B(tail[0]), .CO(\add_83/carry[2] ), .S(N14) );
  ADDHXL U66 ( .A(tail[3]), .B(\add_83/carry[3] ), .CO(\add_83/carry[4] ), .S(
        N16) );
  ADDHXL U67 ( .A(head[1]), .B(head[0]), .CO(\add_74/carry[2] ), .S(N8) );
  CLKINVX1 U68 ( .A(pop), .Y(n76) );
  ADDHXL U69 ( .A(tail[2]), .B(\add_83/carry[2] ), .CO(\add_83/carry[3] ), .S(
        N15) );
  ADDHXL U70 ( .A(head[3]), .B(\add_74/carry[3] ), .CO(\add_74/carry[4] ), .S(
        N10) );
  ADDHXL U71 ( .A(head[2]), .B(\add_74/carry[2] ), .CO(\add_74/carry[3] ), .S(
        N9) );
  ADDHXL U72 ( .A(tail[4]), .B(\add_83/carry[4] ), .CO(\add_83/carry[5] ), .S(
        N17) );
  ADDHXL U73 ( .A(head[4]), .B(\add_74/carry[4] ), .CO(\add_74/carry[5] ), .S(
        N11) );
  CLKINVX1 U74 ( .A(push), .Y(n75) );
  XOR2X1 U77 ( .A(\add_74/carry[5] ), .B(head[5]), .Y(N12) );
  NAND2BX1 U78 ( .AN(head[1]), .B(n57), .Y(n12) );
  OAI2BB1X1 U79 ( .A0N(head[0]), .A1N(head[1]), .B0(n12), .Y(N20) );
  NOR2X1 U80 ( .A(n12), .B(head[2]), .Y(n13) );
  AO21X1 U81 ( .A0(n12), .A1(head[2]), .B0(n13), .Y(N21) );
  NAND2X1 U82 ( .A(n13), .B(n54), .Y(n14) );
  OAI21XL U83 ( .A0(n13), .A1(n54), .B0(n14), .Y(N22) );
  XNOR2X1 U84 ( .A(head[4]), .B(n14), .Y(N23) );
  NOR2X1 U85 ( .A(head[4]), .B(n14), .Y(n15) );
  XOR2X1 U86 ( .A(head[5]), .B(n15), .Y(N24) );
  NAND2BX1 U87 ( .AN(tail[1]), .B(n2), .Y(n16) );
  OAI2BB1X1 U88 ( .A0N(tail[0]), .A1N(tail[1]), .B0(n16), .Y(N27) );
  NOR2X1 U89 ( .A(n16), .B(tail[2]), .Y(n17) );
  AO21X1 U90 ( .A0(n16), .A1(tail[2]), .B0(n17), .Y(N28) );
  NAND2X1 U91 ( .A(n17), .B(n8), .Y(n18) );
  OAI21XL U92 ( .A0(n17), .A1(n8), .B0(n18), .Y(N29) );
  XNOR2X1 U93 ( .A(tail[4]), .B(n18), .Y(N30) );
  NOR2X1 U94 ( .A(tail[4]), .B(n18), .Y(n22) );
  XOR2X1 U95 ( .A(tail[5]), .B(n22), .Y(N31) );
endmodule


module fifo ( clk, rst_n, push, pop, datain, empty, almost_empty, full, 
        almost_full, error, dataout );
  input [15:0] datain;
  output [15:0] dataout;
  input clk, rst_n, push, pop;
  output empty, almost_empty, full, almost_full, error;
  wire   wen, oen, wen1, wen2, oen1, oen2, N20, N21, N22, N23, N24, N25, N26,
         N27, N28, N29, N30, N31, N32, N33, N34, N35, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20;
  wire   [5:0] addr;
  wire   [4:0] addr1;
  wire   [4:0] addr2;
  wire   [7:0] dataout1;
  wire   [7:0] dataout2;
  wire   [7:0] dataout3;
  wire   [7:0] dataout4;

  RAM32x8 ram1 ( .Q(dataout1), .A(addr1), .D(datain[15:8]), .CLK(clk), .CEN(
        1'b0), .OEN(oen1), .WEN(wen1) );
  RAM32x8 ram2 ( .Q(dataout2), .A(addr1), .D(datain[7:0]), .CLK(clk), .CEN(
        1'b0), .OEN(oen1), .WEN(wen1) );
  RAM32x8 ram3 ( .Q(dataout3), .A(addr2), .D(datain[15:8]), .CLK(clk), .CEN(
        1'b0), .OEN(oen2), .WEN(wen2) );
  RAM32x8 ram4 ( .Q(dataout4), .A(addr2), .D(datain[7:0]), .CLK(clk), .CEN(
        1'b0), .OEN(oen2), .WEN(wen2) );
  fifo_ctr controller ( .clk(clk), .rst_n(rst_n), .push(push), .pop(pop), 
        .empty(empty), .almost_empty(almost_empty), .full(full), .almost_full(
        almost_full), .error(error), .wen(wen), .oen(oen), .addr(addr) );
  TLATX1 \dataout_reg[15]  ( .G(1'b1), .D(N35), .Q(dataout[15]) );
  TLATX1 \dataout_reg[14]  ( .G(1'b1), .D(N34), .Q(dataout[14]) );
  TLATX1 \dataout_reg[13]  ( .G(1'b1), .D(N33), .Q(dataout[13]) );
  TLATX1 \dataout_reg[12]  ( .G(1'b1), .D(N32), .Q(dataout[12]) );
  TLATX1 \dataout_reg[11]  ( .G(1'b1), .D(N31), .Q(dataout[11]) );
  TLATX1 \dataout_reg[10]  ( .G(1'b1), .D(N30), .Q(dataout[10]) );
  TLATX1 \dataout_reg[9]  ( .G(1'b1), .D(N29), .Q(dataout[9]) );
  TLATX1 \dataout_reg[8]  ( .G(1'b1), .D(N28), .Q(dataout[8]) );
  TLATX1 \dataout_reg[7]  ( .G(1'b1), .D(N27), .Q(dataout[7]) );
  TLATX1 \dataout_reg[6]  ( .G(1'b1), .D(N26), .Q(dataout[6]) );
  TLATX1 \dataout_reg[5]  ( .G(1'b1), .D(N25), .Q(dataout[5]) );
  TLATX1 \dataout_reg[4]  ( .G(1'b1), .D(N24), .Q(dataout[4]) );
  TLATX1 \dataout_reg[3]  ( .G(1'b1), .D(N23), .Q(dataout[3]) );
  TLATX1 \dataout_reg[2]  ( .G(1'b1), .D(N22), .Q(dataout[2]) );
  TLATX1 \dataout_reg[1]  ( .G(1'b1), .D(N21), .Q(dataout[1]) );
  TLATX1 \dataout_reg[0]  ( .G(1'b1), .D(N20), .Q(dataout[0]) );
  NAND2X1 U42 ( .A(n14), .B(n11), .Y(oen1) );
  NAND2X1 U43 ( .A(addr[5]), .B(n14), .Y(oen2) );
  NOR2X2 U44 ( .A(n11), .B(n20), .Y(addr2[0]) );
  NOR2X2 U45 ( .A(n10), .B(n19), .Y(addr2[1]) );
  NOR2X2 U46 ( .A(n11), .B(n18), .Y(addr2[2]) );
  NOR2X2 U47 ( .A(n11), .B(n17), .Y(addr2[3]) );
  NOR2X2 U48 ( .A(n10), .B(n16), .Y(addr2[4]) );
  NOR2X2 U49 ( .A(addr[5]), .B(n20), .Y(addr1[0]) );
  NOR2X2 U50 ( .A(addr[5]), .B(n19), .Y(addr1[1]) );
  NOR2X2 U51 ( .A(addr[5]), .B(n18), .Y(addr1[2]) );
  NOR2X2 U52 ( .A(addr[5]), .B(n17), .Y(addr1[3]) );
  NOR2X2 U53 ( .A(addr[5]), .B(n16), .Y(addr1[4]) );
  CLKBUFX3 U54 ( .A(n13), .Y(n10) );
  CLKBUFX3 U55 ( .A(n13), .Y(n11) );
  NAND2X1 U56 ( .A(n15), .B(n11), .Y(wen1) );
  NAND2X1 U57 ( .A(addr[5]), .B(n15), .Y(wen2) );
  CLKINVX1 U58 ( .A(oen), .Y(n14) );
  CLKBUFX3 U59 ( .A(n13), .Y(n12) );
  AO22X1 U60 ( .A0(dataout4[1]), .A1(addr[5]), .B0(dataout2[1]), .B1(n12), .Y(
        N21) );
  AO22X1 U61 ( .A0(dataout4[2]), .A1(addr[5]), .B0(dataout2[2]), .B1(n12), .Y(
        N22) );
  AO22X1 U62 ( .A0(dataout4[3]), .A1(addr[5]), .B0(dataout2[3]), .B1(n12), .Y(
        N23) );
  AO22X1 U63 ( .A0(dataout4[4]), .A1(addr[5]), .B0(dataout2[4]), .B1(n12), .Y(
        N24) );
  AO22X1 U64 ( .A0(dataout4[5]), .A1(addr[5]), .B0(dataout2[5]), .B1(n12), .Y(
        N25) );
  AO22X1 U65 ( .A0(dataout4[6]), .A1(addr[5]), .B0(dataout2[6]), .B1(n12), .Y(
        N26) );
  AO22X1 U66 ( .A0(dataout4[7]), .A1(addr[5]), .B0(dataout2[7]), .B1(n12), .Y(
        N27) );
  AO22X1 U67 ( .A0(dataout3[0]), .A1(addr[5]), .B0(dataout1[0]), .B1(n12), .Y(
        N28) );
  AO22X1 U68 ( .A0(dataout3[1]), .A1(addr[5]), .B0(dataout1[1]), .B1(n12), .Y(
        N29) );
  AO22X1 U69 ( .A0(dataout3[2]), .A1(addr[5]), .B0(dataout1[2]), .B1(n12), .Y(
        N30) );
  AO22X1 U70 ( .A0(dataout3[3]), .A1(addr[5]), .B0(dataout1[3]), .B1(n12), .Y(
        N31) );
  AO22X1 U71 ( .A0(dataout3[4]), .A1(addr[5]), .B0(dataout1[4]), .B1(n12), .Y(
        N32) );
  AO22X1 U72 ( .A0(dataout3[5]), .A1(addr[5]), .B0(dataout1[5]), .B1(n12), .Y(
        N33) );
  AO22X1 U73 ( .A0(dataout3[6]), .A1(addr[5]), .B0(dataout1[6]), .B1(n12), .Y(
        N34) );
  AO22X1 U74 ( .A0(dataout3[7]), .A1(addr[5]), .B0(dataout1[7]), .B1(n12), .Y(
        N35) );
  AO22X1 U75 ( .A0(dataout4[0]), .A1(addr[5]), .B0(dataout2[0]), .B1(n11), .Y(
        N20) );
  CLKINVX1 U76 ( .A(addr[5]), .Y(n13) );
  CLKINVX1 U77 ( .A(addr[0]), .Y(n20) );
  CLKINVX1 U78 ( .A(addr[1]), .Y(n19) );
  CLKINVX1 U79 ( .A(addr[2]), .Y(n18) );
  CLKINVX1 U80 ( .A(addr[3]), .Y(n17) );
  CLKINVX1 U81 ( .A(addr[4]), .Y(n16) );
  CLKINVX1 U82 ( .A(wen), .Y(n15) );
endmodule

