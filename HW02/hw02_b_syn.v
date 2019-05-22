/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Oct 17 22:43:07 2017
/////////////////////////////////////////////////////////////


module hw02_b_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(b[0]), .Y(n133) );
  CLKINVX1 U85 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n131) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n132) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n129) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n130) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n128) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n127) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n125) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n126) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n124) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n128), .B(n125), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n133), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n131), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n129), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n127), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n125), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n133), .B(n132), .Y(n71) );
  NOR2X1 U125 ( .A(n131), .B(n132), .Y(n70) );
  NOR2X1 U126 ( .A(n129), .B(n132), .Y(n69) );
  NOR2X1 U127 ( .A(n127), .B(n132), .Y(n68) );
  NOR2X1 U128 ( .A(n132), .B(n125), .Y(n67) );
  NOR2X1 U129 ( .A(n132), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n133), .B(n130), .Y(n64) );
  NOR2X1 U131 ( .A(n131), .B(n130), .Y(n63) );
  NOR2X1 U132 ( .A(n129), .B(n130), .Y(n62) );
  NOR2X1 U133 ( .A(n127), .B(n130), .Y(n61) );
  NOR2X1 U134 ( .A(n130), .B(n125), .Y(n60) );
  NOR2X1 U135 ( .A(n133), .B(n128), .Y(n58) );
  NOR2X1 U136 ( .A(n131), .B(n128), .Y(n57) );
  NOR2X1 U137 ( .A(n129), .B(n128), .Y(n56) );
  NOR2X1 U138 ( .A(n127), .B(n128), .Y(n55) );
  NOR2X1 U139 ( .A(n133), .B(n126), .Y(n53) );
  NOR2X1 U140 ( .A(n131), .B(n126), .Y(n52) );
  NOR2X1 U141 ( .A(n129), .B(n126), .Y(n51) );
  NOR2X1 U142 ( .A(n124), .B(n133), .Y(n49) );
  NOR2X1 U143 ( .A(n124), .B(n131), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module hw02_b_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  NOR2X1 U1 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U2 ( .A(B[0]), .Y(n2) );
  XNOR2X1 U3 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module hw02_b ( clk, rst_n, data, sel, load, R0, R1, R2, R3 );
  input [7:0] data;
  input [3:0] sel;
  input [3:0] load;
  output [7:0] R0;
  output [7:0] R1;
  output [7:0] R2;
  output [7:0] R3;
  input clk, rst_n;
  wire   N34, N35, N36, N37, N38, N39, N40, N41, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n28, n29, n30, n32, n34, n36, n38, n40, n42, n44, n46,
         n47, n50, n51, n53, n55, n57, n59, n61, n63, n65, n66, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, N33, N32, N31, N30, N29, N28, N27, N26, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  hw02_b_DW_mult_uns_0 mult_68 ( .a(R1), .b(R2), .product({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, N33, N32, N31, N30, 
        N29, N28, N27, N26}) );
  hw02_b_DW01_add_0 add_68 ( .A(R3), .B({N33, N32, N31, N30, N29, N28, N27, 
        N26}), .CI(1'b0), .SUM({N41, N40, N39, N38, N37, N36, N35, N34}) );
  DFFRX1 \R0_reg[7]  ( .D(n122), .CK(clk), .RN(rst_n), .Q(R0[7]), .QN(n91) );
  DFFRX1 \R0_reg[6]  ( .D(n119), .CK(clk), .RN(rst_n), .Q(R0[6]), .QN(n90) );
  DFFRX1 \R0_reg[5]  ( .D(n116), .CK(clk), .RN(rst_n), .Q(R0[5]), .QN(n89) );
  DFFRX1 \R0_reg[4]  ( .D(n113), .CK(clk), .RN(rst_n), .Q(R0[4]), .QN(n88) );
  DFFRX1 \R0_reg[3]  ( .D(n110), .CK(clk), .RN(rst_n), .Q(R0[3]), .QN(n87) );
  DFFRX1 \R0_reg[2]  ( .D(n107), .CK(clk), .RN(rst_n), .Q(R0[2]), .QN(n86) );
  DFFRX1 \R0_reg[1]  ( .D(n104), .CK(clk), .RN(rst_n), .Q(R0[1]), .QN(n85) );
  DFFRX1 \R0_reg[0]  ( .D(n101), .CK(clk), .RN(rst_n), .Q(R0[0]), .QN(n84) );
  DFFRX1 \R3_reg[7]  ( .D(n99), .CK(clk), .RN(rst_n), .Q(R3[7]) );
  DFFRX1 \R3_reg[6]  ( .D(n98), .CK(clk), .RN(rst_n), .Q(R3[6]) );
  DFFRX1 \R3_reg[5]  ( .D(n97), .CK(clk), .RN(rst_n), .Q(R3[5]) );
  DFFRX1 \R3_reg[4]  ( .D(n96), .CK(clk), .RN(rst_n), .Q(R3[4]) );
  DFFRX1 \R3_reg[3]  ( .D(n95), .CK(clk), .RN(rst_n), .Q(R3[3]) );
  DFFRX1 \R3_reg[2]  ( .D(n94), .CK(clk), .RN(rst_n), .Q(R3[2]) );
  DFFRX1 \R3_reg[1]  ( .D(n93), .CK(clk), .RN(rst_n), .Q(R3[1]) );
  DFFRX1 \R3_reg[0]  ( .D(n92), .CK(clk), .RN(rst_n), .Q(R3[0]) );
  DFFRX1 \R1_reg[7]  ( .D(n121), .CK(clk), .RN(rst_n), .Q(R1[7]), .QN(n138) );
  DFFRX1 \R2_reg[7]  ( .D(n123), .CK(clk), .RN(rst_n), .Q(R2[7]), .QN(n131) );
  DFFRX1 \R1_reg[6]  ( .D(n118), .CK(clk), .RN(rst_n), .Q(R1[6]), .QN(n137) );
  DFFRX1 \R2_reg[6]  ( .D(n120), .CK(clk), .RN(rst_n), .Q(R2[6]), .QN(n130) );
  DFFRX1 \R1_reg[3]  ( .D(n109), .CK(clk), .RN(rst_n), .Q(R1[3]), .QN(n139) );
  DFFRX1 \R2_reg[4]  ( .D(n114), .CK(clk), .RN(rst_n), .Q(R2[4]), .QN(n136) );
  DFFRX1 \R1_reg[5]  ( .D(n115), .CK(clk), .RN(rst_n), .Q(R1[5]), .QN(n132) );
  DFFRX1 \R1_reg[4]  ( .D(n112), .CK(clk), .RN(rst_n), .Q(R1[4]), .QN(n133) );
  DFFRX1 \R1_reg[2]  ( .D(n106), .CK(clk), .RN(rst_n), .Q(R1[2]), .QN(n135) );
  DFFRX1 \R1_reg[1]  ( .D(n103), .CK(clk), .RN(rst_n), .Q(R1[1]), .QN(n134) );
  DFFRX1 \R1_reg[0]  ( .D(n100), .CK(clk), .RN(rst_n), .Q(R1[0]), .QN(n129) );
  DFFRX1 \R2_reg[5]  ( .D(n117), .CK(clk), .RN(rst_n), .Q(R2[5]), .QN(n125) );
  DFFRX1 \R2_reg[3]  ( .D(n111), .CK(clk), .RN(rst_n), .Q(R2[3]), .QN(n126) );
  DFFRX1 \R2_reg[2]  ( .D(n108), .CK(clk), .RN(rst_n), .Q(R2[2]), .QN(n128) );
  DFFRX1 \R2_reg[1]  ( .D(n105), .CK(clk), .RN(rst_n), .Q(R2[1]), .QN(n127) );
  DFFRX1 \R2_reg[0]  ( .D(n102), .CK(clk), .RN(rst_n), .Q(R2[0]), .QN(n124) );
  NOR3X1 U116 ( .A(sel[0]), .B(sel[1]), .C(n142), .Y(n72) );
  NOR3X1 U117 ( .A(n144), .B(sel[2]), .C(n143), .Y(n73) );
  CLKINVX1 U118 ( .A(load[1]), .Y(n147) );
  NOR2BX1 U119 ( .AN(n141), .B(n148), .Y(n70) );
  NOR2X1 U120 ( .A(n147), .B(n140), .Y(n47) );
  NAND3X1 U121 ( .A(n143), .B(n142), .C(n144), .Y(n50) );
  NOR2X1 U122 ( .A(n146), .B(n141), .Y(n30) );
  AOI22X1 U123 ( .A0(data[7]), .A1(n72), .B0(N41), .B1(n73), .Y(n51) );
  AOI2BB2X1 U124 ( .B0(n141), .B1(R2[5]), .A0N(sel[3]), .A1N(n34), .Y(n10) );
  AOI2BB2X1 U125 ( .B0(n141), .B1(R2[6]), .A0N(sel[3]), .A1N(n32), .Y(n7) );
  AOI2BB2X1 U126 ( .B0(n141), .B1(R2[7]), .A0N(sel[3]), .A1N(n28), .Y(n4) );
  OAI22XL U127 ( .A0(n47), .A1(n132), .B0(n10), .B1(n147), .Y(n115) );
  OAI22XL U128 ( .A0(n47), .A1(n137), .B0(n7), .B1(n147), .Y(n118) );
  OAI22XL U129 ( .A0(n47), .A1(n138), .B0(n4), .B1(n147), .Y(n121) );
  AOI22X1 U130 ( .A0(data[5]), .A1(n72), .B0(N39), .B1(n73), .Y(n55) );
  AOI22X1 U131 ( .A0(data[6]), .A1(n72), .B0(N40), .B1(n73), .Y(n53) );
  OAI221XL U132 ( .A0(n11), .A1(n148), .B0(n89), .B1(n68), .C0(n75), .Y(n116)
         );
  AOI2BB2X1 U133 ( .B0(n70), .B1(R2[5]), .A0N(n71), .A1N(n55), .Y(n75) );
  OAI221XL U134 ( .A0(n8), .A1(n148), .B0(n90), .B1(n68), .C0(n74), .Y(n119)
         );
  AOI2BB2X1 U135 ( .B0(n70), .B1(R2[6]), .A0N(n71), .A1N(n53), .Y(n74) );
  OAI221XL U136 ( .A0(n5), .A1(n148), .B0(n91), .B1(n68), .C0(n69), .Y(n122)
         );
  AOI2BB2X1 U137 ( .B0(n70), .B1(R2[7]), .A0N(n71), .A1N(n51), .Y(n69) );
  OA21XL U138 ( .A0(n89), .A1(n50), .B0(n55), .Y(n34) );
  OA21XL U139 ( .A0(n90), .A1(n50), .B0(n53), .Y(n32) );
  OA21XL U140 ( .A0(n91), .A1(n50), .B0(n51), .Y(n28) );
  OAI222XL U141 ( .A0(n146), .A1(n11), .B0(n34), .B1(n29), .C0(n30), .C1(n125), 
        .Y(n117) );
  OAI222XL U142 ( .A0(n146), .A1(n8), .B0(n32), .B1(n29), .C0(n30), .C1(n130), 
        .Y(n120) );
  OAI222XL U143 ( .A0(n146), .A1(n5), .B0(n28), .B1(n29), .C0(n30), .C1(n131), 
        .Y(n123) );
  AO22X1 U144 ( .A0(R3[5]), .A1(n145), .B0(load[3]), .B1(n9), .Y(n97) );
  NAND2X1 U145 ( .A(n10), .B(n11), .Y(n9) );
  AO22X1 U146 ( .A0(R3[6]), .A1(n145), .B0(load[3]), .B1(n6), .Y(n98) );
  NAND2X1 U147 ( .A(n7), .B(n8), .Y(n6) );
  AO22X1 U148 ( .A0(R3[7]), .A1(n145), .B0(load[3]), .B1(n3), .Y(n99) );
  NAND2X1 U149 ( .A(n4), .B(n5), .Y(n3) );
  AOI2BB2X1 U150 ( .B0(n141), .B1(R2[3]), .A0N(sel[3]), .A1N(n38), .Y(n16) );
  AOI2BB2X1 U151 ( .B0(n141), .B1(R2[4]), .A0N(sel[3]), .A1N(n36), .Y(n13) );
  OAI22XL U152 ( .A0(n47), .A1(n139), .B0(n16), .B1(n147), .Y(n109) );
  OAI22XL U153 ( .A0(n47), .A1(n133), .B0(n13), .B1(n147), .Y(n112) );
  AOI22X1 U154 ( .A0(data[3]), .A1(n72), .B0(N37), .B1(n73), .Y(n59) );
  AOI22X1 U155 ( .A0(data[4]), .A1(n72), .B0(N38), .B1(n73), .Y(n57) );
  OAI221XL U156 ( .A0(n17), .A1(n148), .B0(n87), .B1(n68), .C0(n77), .Y(n110)
         );
  AOI2BB2X1 U157 ( .B0(n70), .B1(R2[3]), .A0N(n71), .A1N(n59), .Y(n77) );
  OAI221XL U158 ( .A0(n14), .A1(n148), .B0(n88), .B1(n68), .C0(n76), .Y(n113)
         );
  AOI2BB2X1 U159 ( .B0(n70), .B1(R2[4]), .A0N(n71), .A1N(n57), .Y(n76) );
  OA21XL U160 ( .A0(n87), .A1(n50), .B0(n59), .Y(n38) );
  OA21XL U161 ( .A0(n88), .A1(n50), .B0(n57), .Y(n36) );
  OAI222XL U162 ( .A0(n146), .A1(n17), .B0(n38), .B1(n29), .C0(n30), .C1(n126), 
        .Y(n111) );
  OAI222XL U163 ( .A0(n146), .A1(n14), .B0(n36), .B1(n29), .C0(n30), .C1(n136), 
        .Y(n114) );
  AO22X1 U164 ( .A0(R3[3]), .A1(n145), .B0(load[3]), .B1(n15), .Y(n95) );
  NAND2X1 U165 ( .A(n16), .B(n17), .Y(n15) );
  AO22X1 U166 ( .A0(R3[4]), .A1(n145), .B0(load[3]), .B1(n12), .Y(n96) );
  NAND2X1 U167 ( .A(n13), .B(n14), .Y(n12) );
  AOI2BB2X1 U168 ( .B0(n141), .B1(R2[0]), .A0N(sel[3]), .A1N(n44), .Y(n25) );
  AOI2BB2X1 U169 ( .B0(n141), .B1(R2[1]), .A0N(sel[3]), .A1N(n42), .Y(n22) );
  AOI2BB2X1 U170 ( .B0(n141), .B1(R2[2]), .A0N(sel[3]), .A1N(n40), .Y(n19) );
  OAI22XL U171 ( .A0(n47), .A1(n134), .B0(n22), .B1(n147), .Y(n103) );
  OAI22XL U172 ( .A0(n47), .A1(n135), .B0(n19), .B1(n147), .Y(n106) );
  AOI22X1 U173 ( .A0(data[0]), .A1(n72), .B0(N34), .B1(n73), .Y(n65) );
  AOI22X1 U174 ( .A0(data[1]), .A1(n72), .B0(N35), .B1(n73), .Y(n63) );
  AOI22X1 U175 ( .A0(data[2]), .A1(n72), .B0(N36), .B1(n73), .Y(n61) );
  OAI221XL U176 ( .A0(n23), .A1(n148), .B0(n85), .B1(n68), .C0(n79), .Y(n104)
         );
  AOI2BB2X1 U177 ( .B0(n70), .B1(R2[1]), .A0N(n71), .A1N(n63), .Y(n79) );
  OAI221XL U178 ( .A0(n20), .A1(n148), .B0(n86), .B1(n68), .C0(n78), .Y(n107)
         );
  AOI2BB2X1 U179 ( .B0(n70), .B1(R2[2]), .A0N(n71), .A1N(n61), .Y(n78) );
  OA21XL U180 ( .A0(n84), .A1(n50), .B0(n65), .Y(n44) );
  OA21XL U181 ( .A0(n85), .A1(n50), .B0(n63), .Y(n42) );
  OA21XL U182 ( .A0(n86), .A1(n50), .B0(n61), .Y(n40) );
  OAI222XL U183 ( .A0(n146), .A1(n26), .B0(n44), .B1(n29), .C0(n30), .C1(n124), 
        .Y(n102) );
  OAI222XL U184 ( .A0(n146), .A1(n23), .B0(n42), .B1(n29), .C0(n30), .C1(n127), 
        .Y(n105) );
  OAI222XL U185 ( .A0(n146), .A1(n20), .B0(n40), .B1(n29), .C0(n30), .C1(n128), 
        .Y(n108) );
  AO22X1 U186 ( .A0(R3[0]), .A1(n145), .B0(load[3]), .B1(n24), .Y(n92) );
  NAND2X1 U187 ( .A(n25), .B(n26), .Y(n24) );
  AO22X1 U188 ( .A0(R3[1]), .A1(n145), .B0(load[3]), .B1(n21), .Y(n93) );
  NAND2X1 U189 ( .A(n22), .B(n23), .Y(n21) );
  AO22X1 U190 ( .A0(R3[2]), .A1(n145), .B0(load[3]), .B1(n18), .Y(n94) );
  NAND2X1 U191 ( .A(n19), .B(n20), .Y(n18) );
  OAI22XL U192 ( .A0(n47), .A1(n129), .B0(n25), .B1(n147), .Y(n100) );
  OAI221XL U193 ( .A0(n26), .A1(n148), .B0(n84), .B1(n68), .C0(n80), .Y(n101)
         );
  AOI2BB2X1 U194 ( .B0(n70), .B1(R2[0]), .A0N(n71), .A1N(n65), .Y(n80) );
  NAND2X1 U195 ( .A(R1[0]), .B(n140), .Y(n26) );
  NAND2X1 U196 ( .A(R1[1]), .B(n140), .Y(n23) );
  NAND2X1 U197 ( .A(R1[2]), .B(n140), .Y(n20) );
  NAND2X1 U198 ( .A(R1[4]), .B(n140), .Y(n14) );
  NAND2X1 U199 ( .A(R1[5]), .B(n140), .Y(n11) );
  NAND2X1 U200 ( .A(R1[3]), .B(n140), .Y(n17) );
  NAND2X1 U201 ( .A(R1[6]), .B(n140), .Y(n8) );
  NAND2X1 U202 ( .A(R1[7]), .B(n140), .Y(n5) );
  NAND2BX1 U203 ( .AN(sel[3]), .B(load[0]), .Y(n71) );
  AOI2BB1X1 U204 ( .A0N(sel[3]), .A1N(n50), .B0(n148), .Y(n68) );
  NAND2BX1 U205 ( .AN(sel[3]), .B(load[2]), .Y(n29) );
  CLKBUFX3 U206 ( .A(n66), .Y(n140) );
  NOR4X1 U207 ( .A(n144), .B(sel[1]), .C(sel[2]), .D(sel[3]), .Y(n66) );
  CLKINVX1 U208 ( .A(sel[0]), .Y(n144) );
  CLKINVX1 U209 ( .A(sel[1]), .Y(n143) );
  CLKBUFX3 U210 ( .A(n46), .Y(n141) );
  NOR4X1 U211 ( .A(n143), .B(sel[0]), .C(sel[2]), .D(sel[3]), .Y(n46) );
  CLKINVX1 U212 ( .A(sel[2]), .Y(n142) );
  CLKINVX1 U213 ( .A(load[3]), .Y(n145) );
  CLKINVX1 U214 ( .A(load[0]), .Y(n148) );
  CLKINVX1 U215 ( .A(load[2]), .Y(n146) );
endmodule

