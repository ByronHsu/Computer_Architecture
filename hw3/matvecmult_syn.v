/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Mon Dec  2 19:26:20 2019
/////////////////////////////////////////////////////////////


module matvecmult_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_15 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_14 ( A_7_, A_6_, A_5_, A_4_, A_3_, A_2_, A_1_, B_7_, 
        B_6_, B_5_, B_4_, B_3_, B_2_, B_1_, SUM_7_, SUM_6_, SUM_5_, SUM_4_, 
        SUM_3_, SUM_2_, SUM_1_ );
  input A_7_, A_6_, A_5_, A_4_, A_3_, A_2_, A_1_, B_7_, B_6_, B_5_, B_4_, B_3_,
         B_2_, B_1_;
  output SUM_7_, SUM_6_, SUM_5_, SUM_4_, SUM_3_, SUM_2_, SUM_1_;
  wire   n1;
  wire   [7:3] carry;

  ADDFXL U1_2 ( .A(A_2_), .B(B_2_), .CI(n1), .CO(carry[3]), .S(SUM_2_) );
  ADDFXL U1_5 ( .A(A_5_), .B(B_5_), .CI(carry[5]), .CO(carry[6]), .S(SUM_5_)
         );
  ADDFXL U1_4 ( .A(A_4_), .B(B_4_), .CI(carry[4]), .CO(carry[5]), .S(SUM_4_)
         );
  ADDFXL U1_3 ( .A(A_3_), .B(B_3_), .CI(carry[3]), .CO(carry[4]), .S(SUM_3_)
         );
  ADDFXL U1_6 ( .A(A_6_), .B(B_6_), .CI(carry[6]), .CO(carry[7]), .S(SUM_6_)
         );
  XOR3X2 U1_7 ( .A(A_7_), .B(B_7_), .C(carry[7]), .Y(SUM_7_) );
  AND2X2 U1 ( .A(B_1_), .B(A_1_), .Y(n1) );
  XOR2XL U2 ( .A(B_1_), .B(A_1_), .Y(SUM_1_) );
endmodule


module matvecmult_DW_mult_uns_7 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n102), .B(n103), .Y(n55) );
  CLKINVX1 U68 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U69 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U70 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U71 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U72 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U73 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U74 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U75 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U76 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U77 ( .A(b[4]), .Y(n103) );
  XOR2X1 U78 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U79 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U80 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U81 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U82 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U83 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U84 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U85 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U86 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U87 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U88 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U89 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U90 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U91 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U92 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U93 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U94 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U95 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U96 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U97 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U98 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U99 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U100 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U101 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U102 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U103 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U104 ( .A(n101), .B(n104), .Y(n49) );
  NOR2X1 U105 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U106 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U107 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U108 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U109 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U110 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U111 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U112 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U113 ( .A(n98), .B(n107), .Y(n37) );
  NOR2X1 U114 ( .A(n98), .B(n106), .Y(n36) );
  AND2X1 U115 ( .A(a[5]), .B(b[0]), .Y(n34) );
endmodule


module matvecmult_DW_mult_uns_6 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U68 ( .A(n102), .B(n103), .Y(n55) );
  AND2XL U69 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U70 ( .A(n98), .B(n106), .Y(n36) );
  CLKINVX1 U71 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U72 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U73 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U74 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U75 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U76 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U77 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U78 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U79 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U80 ( .A(b[4]), .Y(n103) );
  XOR2X1 U81 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U82 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U83 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U84 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U85 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U86 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U87 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U88 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U89 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U90 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U91 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U92 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U93 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U94 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U95 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U96 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U97 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U98 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U99 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U100 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U101 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U102 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U103 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U104 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U105 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U106 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U107 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U108 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U109 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U110 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW_mult_uns_5 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  CLKINVX1 U67 ( .A(a[0]), .Y(n102) );
  NOR2XL U68 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U69 ( .A(n105), .B(n100), .Y(n44) );
  AND2XL U70 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U71 ( .A(n98), .B(n106), .Y(n36) );
  INVX1 U72 ( .A(b[1]), .Y(n106) );
  INVX1 U73 ( .A(a[1]), .Y(n101) );
  AND2XL U74 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NAND2XL U75 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2XL U76 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2XL U77 ( .A(b[5]), .B(a[1]), .Y(n118) );
  CLKINVX1 U78 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U79 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U80 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U81 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U82 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U83 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U84 ( .A(b[4]), .Y(n103) );
  XOR2X1 U85 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U86 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U87 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U88 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U89 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U90 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U91 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U92 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U93 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U94 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U95 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U96 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U97 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U98 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U99 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U100 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U101 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U102 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U103 ( .A(n102), .B(n104), .Y(n56) );
  NOR2X1 U104 ( .A(n102), .B(n103), .Y(n55) );
  NOR2X1 U105 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U106 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U107 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U108 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U109 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U110 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW_mult_uns_4 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  CLKINVX1 U67 ( .A(a[0]), .Y(n102) );
  NOR2XL U68 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U69 ( .A(n105), .B(n100), .Y(n44) );
  AND2XL U70 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U71 ( .A(n98), .B(n106), .Y(n36) );
  INVX1 U72 ( .A(b[1]), .Y(n106) );
  INVX1 U73 ( .A(a[1]), .Y(n101) );
  AND2XL U74 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NAND2XL U75 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2XL U76 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2XL U77 ( .A(b[6]), .B(a[0]), .Y(n122) );
  CLKINVX1 U78 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U79 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U80 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U81 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U82 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U83 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U84 ( .A(b[4]), .Y(n103) );
  XOR2X1 U85 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U86 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U87 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U88 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U89 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U90 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U91 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U92 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U93 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U94 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U95 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U96 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U97 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U98 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U99 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U100 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U101 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U102 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U103 ( .A(n102), .B(n104), .Y(n56) );
  NOR2X1 U104 ( .A(n102), .B(n103), .Y(n55) );
  NOR2X1 U105 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U106 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U107 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U108 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U109 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U110 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW_mult_uns_3 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U68 ( .A(n102), .B(n103), .Y(n55) );
  AND2XL U69 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U70 ( .A(n98), .B(n106), .Y(n36) );
  CLKINVX1 U71 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U72 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U73 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U74 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U75 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U76 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U77 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U78 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U79 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U80 ( .A(b[4]), .Y(n103) );
  XOR2X1 U81 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U82 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U83 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U84 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U85 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U86 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U87 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U88 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U89 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U90 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U91 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U92 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U93 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U94 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U95 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U96 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U97 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U98 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U99 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U100 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U101 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U102 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U103 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U104 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U105 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U106 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U107 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U108 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U109 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U110 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW_mult_uns_2 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U68 ( .A(n102), .B(n103), .Y(n55) );
  AND2XL U69 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U70 ( .A(n98), .B(n106), .Y(n36) );
  CLKINVX1 U71 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U72 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U73 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U74 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U75 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U76 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U77 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U78 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U79 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U80 ( .A(b[4]), .Y(n103) );
  XOR2X1 U81 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U82 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U83 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U84 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U85 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U86 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U87 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U88 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U89 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U90 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U91 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U92 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U93 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U94 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U95 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U96 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U97 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U98 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U99 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U100 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U101 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U102 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U103 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U104 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U105 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U106 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U107 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U108 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U109 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U110 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW_mult_uns_1 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39, n40,
         n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56, n57,
         n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  INVX3 U67 ( .A(b[0]), .Y(n112) );
  NOR2X2 U68 ( .A(n106), .B(n112), .Y(n52) );
  CLKINVX1 U69 ( .A(a[0]), .Y(n107) );
  NOR2X1 U70 ( .A(n110), .B(n107), .Y(n57) );
  CLKINVX1 U71 ( .A(b[1]), .Y(n111) );
  AND2X2 U72 ( .A(n52), .B(n58), .Y(n98) );
  NOR2X1 U73 ( .A(n107), .B(n112), .Y(product_0_) );
  NAND2XL U74 ( .A(n52), .B(n100), .Y(n101) );
  NAND2XL U75 ( .A(n99), .B(n58), .Y(n102) );
  NAND2X1 U76 ( .A(n101), .B(n102), .Y(product_1_) );
  INVXL U77 ( .A(n52), .Y(n99) );
  INVXL U78 ( .A(n58), .Y(n100) );
  NOR2X2 U79 ( .A(n107), .B(n111), .Y(n58) );
  ADDFXL U80 ( .A(n98), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  NOR2XL U81 ( .A(n103), .B(n111), .Y(n36) );
  NOR2XL U82 ( .A(n106), .B(n108), .Y(n48) );
  ADDHXL U83 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NAND2XL U84 ( .A(b[0]), .B(a[6]), .Y(n120) );
  NAND2XL U85 ( .A(b[1]), .B(a[5]), .Y(n121) );
  NAND2XL U86 ( .A(b[5]), .B(a[1]), .Y(n123) );
  AND2XL U87 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NAND2XL U88 ( .A(b[6]), .B(a[0]), .Y(n127) );
  CLKINVX1 U89 ( .A(a[1]), .Y(n106) );
  CLKINVX1 U90 ( .A(b[2]), .Y(n110) );
  CLKINVX1 U91 ( .A(a[2]), .Y(n105) );
  CLKINVX1 U92 ( .A(b[3]), .Y(n109) );
  CLKINVX1 U93 ( .A(a[3]), .Y(n104) );
  CLKINVX1 U94 ( .A(a[4]), .Y(n103) );
  CLKINVX1 U95 ( .A(b[4]), .Y(n108) );
  XOR2X1 U96 ( .A(n113), .B(n114), .Y(product_6_) );
  XOR2X1 U97 ( .A(n115), .B(n12), .Y(n114) );
  XOR2X1 U98 ( .A(n116), .B(n117), .Y(n115) );
  XOR2X1 U99 ( .A(n118), .B(n119), .Y(n117) );
  XOR2X1 U100 ( .A(n120), .B(n121), .Y(n119) );
  XOR2X1 U101 ( .A(n122), .B(n123), .Y(n118) );
  NAND2X1 U102 ( .A(b[2]), .B(a[4]), .Y(n122) );
  XOR2X1 U103 ( .A(n124), .B(n125), .Y(n116) );
  XOR2X1 U104 ( .A(n126), .B(n127), .Y(n125) );
  NAND2X1 U105 ( .A(b[4]), .B(a[2]), .Y(n126) );
  XOR2X1 U106 ( .A(n128), .B(n16), .Y(n124) );
  NAND2X1 U107 ( .A(b[3]), .B(a[3]), .Y(n128) );
  XOR2X1 U108 ( .A(n129), .B(n14), .Y(n113) );
  XNOR2X1 U109 ( .A(n2), .B(n18), .Y(n129) );
  NOR2X1 U110 ( .A(n107), .B(n109), .Y(n56) );
  NOR2X1 U111 ( .A(n107), .B(n108), .Y(n55) );
  NOR2X1 U112 ( .A(n111), .B(n106), .Y(n51) );
  NOR2X1 U113 ( .A(n110), .B(n106), .Y(n50) );
  NOR2X1 U114 ( .A(n106), .B(n109), .Y(n49) );
  NOR2X1 U115 ( .A(n112), .B(n105), .Y(n46) );
  NOR2X1 U116 ( .A(n111), .B(n105), .Y(n45) );
  NOR2X1 U117 ( .A(n110), .B(n105), .Y(n44) );
  NOR2X1 U118 ( .A(n109), .B(n105), .Y(n43) );
  NOR2X1 U119 ( .A(n112), .B(n104), .Y(n41) );
  NOR2X1 U120 ( .A(n111), .B(n104), .Y(n40) );
  NOR2X1 U121 ( .A(n110), .B(n104), .Y(n39) );
  NOR2X1 U122 ( .A(n103), .B(n112), .Y(n37) );
  AND2X1 U123 ( .A(a[5]), .B(b[0]), .Y(n34) );
endmodule


module matvecmult_DW_mult_uns_0 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  CLKINVX1 U67 ( .A(a[0]), .Y(n102) );
  NOR2XL U68 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U69 ( .A(n105), .B(n100), .Y(n44) );
  AND2XL U70 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U71 ( .A(n98), .B(n106), .Y(n36) );
  INVX1 U72 ( .A(b[1]), .Y(n106) );
  INVX1 U73 ( .A(a[1]), .Y(n101) );
  AND2XL U74 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NAND2XL U75 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2XL U76 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2XL U77 ( .A(b[6]), .B(a[0]), .Y(n122) );
  CLKINVX1 U78 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U79 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U80 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U81 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U82 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U83 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U84 ( .A(b[4]), .Y(n103) );
  XOR2X1 U85 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U86 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U87 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U88 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U89 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U90 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U91 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U92 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U93 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U94 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U95 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U96 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U97 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U98 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U99 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U100 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U101 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U102 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U103 ( .A(n102), .B(n104), .Y(n56) );
  NOR2X1 U104 ( .A(n102), .B(n103), .Y(n55) );
  NOR2X1 U105 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U106 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U107 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U108 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U109 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U110 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW01_add_6 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_5 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_4 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_3 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_2 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_1 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_0 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW_mult_uns_15 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  CLKINVX1 U67 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U68 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U69 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U70 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U71 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U72 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U73 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U74 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U75 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U76 ( .A(b[4]), .Y(n103) );
  XOR2X1 U77 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U78 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U79 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U80 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U81 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U82 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U83 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U84 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U85 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U86 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U87 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U88 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U89 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U90 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U91 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U92 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U93 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U94 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U95 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U96 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U97 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U98 ( .A(n102), .B(n104), .Y(n56) );
  NOR2X1 U99 ( .A(n102), .B(n103), .Y(n55) );
  AND2X1 U100 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U101 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U102 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U103 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U104 ( .A(n101), .B(n104), .Y(n49) );
  NOR2X1 U105 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U106 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U107 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U108 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U109 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U110 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U111 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U112 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U113 ( .A(n98), .B(n107), .Y(n37) );
  NOR2X1 U114 ( .A(n98), .B(n106), .Y(n36) );
  AND2X1 U115 ( .A(a[5]), .B(b[0]), .Y(n34) );
endmodule


module matvecmult_DW_mult_uns_14 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n102), .B(n103), .Y(n55) );
  CLKINVX1 U68 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U69 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U70 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U71 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U72 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U73 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U74 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U75 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U76 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U77 ( .A(b[4]), .Y(n103) );
  XOR2X1 U78 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U79 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U80 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U81 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U82 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U83 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U84 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U85 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U86 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U87 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U88 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U89 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U90 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U91 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U92 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U93 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U94 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U95 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U96 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U97 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U98 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U99 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U100 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U101 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U102 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U103 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U104 ( .A(n101), .B(n104), .Y(n49) );
  NOR2X1 U105 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U106 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U107 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U108 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U109 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U110 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U111 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U112 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U113 ( .A(n98), .B(n107), .Y(n37) );
  NOR2X1 U114 ( .A(n98), .B(n106), .Y(n36) );
  AND2X1 U115 ( .A(a[5]), .B(b[0]), .Y(n34) );
endmodule


module matvecmult_DW_mult_uns_13 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U68 ( .A(n102), .B(n103), .Y(n55) );
  AND2XL U69 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U70 ( .A(n98), .B(n106), .Y(n36) );
  CLKINVX1 U71 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U72 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U73 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U74 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U75 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U76 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U77 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U78 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U79 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U80 ( .A(b[4]), .Y(n103) );
  XOR2X1 U81 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U82 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U83 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U84 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U85 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U86 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U87 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U88 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U89 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U90 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U91 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U92 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U93 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U94 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U95 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U96 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U97 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U98 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U99 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U100 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U101 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U102 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U103 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U104 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U105 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U106 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U107 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U108 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U109 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U110 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW_mult_uns_12 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U68 ( .A(n102), .B(n103), .Y(n55) );
  AND2XL U69 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U70 ( .A(n98), .B(n106), .Y(n36) );
  CLKINVX1 U71 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U72 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U73 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U74 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U75 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U76 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U77 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U78 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U79 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U80 ( .A(b[4]), .Y(n103) );
  XOR2X1 U81 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U82 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U83 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U84 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U85 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U86 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U87 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U88 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U89 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U90 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U91 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U92 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U93 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U94 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U95 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U96 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U97 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U98 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U99 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U100 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U101 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U102 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U103 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U104 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U105 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U106 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U107 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U108 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U109 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U110 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW_mult_uns_11 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n102), .B(n103), .Y(n55) );
  CLKINVX1 U68 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U69 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U70 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U71 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U72 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U73 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U74 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U75 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U76 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U77 ( .A(b[4]), .Y(n103) );
  XOR2X1 U78 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U79 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U80 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U81 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U82 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U83 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U84 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U85 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U86 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U87 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U88 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U89 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U90 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U91 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U92 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U93 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U94 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U95 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U96 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U97 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U98 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U99 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U100 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U101 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U102 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U103 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U104 ( .A(n101), .B(n104), .Y(n49) );
  NOR2X1 U105 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U106 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U107 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U108 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U109 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U110 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U111 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U112 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U113 ( .A(n98), .B(n107), .Y(n37) );
  NOR2X1 U114 ( .A(n98), .B(n106), .Y(n36) );
  AND2X1 U115 ( .A(a[5]), .B(b[0]), .Y(n34) );
endmodule


module matvecmult_DW_mult_uns_10 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n102), .B(n103), .Y(n55) );
  CLKINVX1 U68 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U69 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U70 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U71 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U72 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U73 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U74 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U75 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U76 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U77 ( .A(b[4]), .Y(n103) );
  XOR2X1 U78 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U79 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U80 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U81 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U82 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U83 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U84 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U85 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U86 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U87 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U88 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U89 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U90 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U91 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U92 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U93 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U94 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U95 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U96 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U97 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U98 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U99 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U100 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U101 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U102 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U103 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U104 ( .A(n101), .B(n104), .Y(n49) );
  NOR2X1 U105 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U106 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U107 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U108 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U109 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U110 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U111 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U112 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U113 ( .A(n98), .B(n107), .Y(n37) );
  NOR2X1 U114 ( .A(n98), .B(n106), .Y(n36) );
  AND2X1 U115 ( .A(a[5]), .B(b[0]), .Y(n34) );
endmodule


module matvecmult_DW_mult_uns_9 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  CLKINVX1 U67 ( .A(a[0]), .Y(n102) );
  NOR2XL U68 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U69 ( .A(n105), .B(n100), .Y(n44) );
  AND2XL U70 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U71 ( .A(n98), .B(n106), .Y(n36) );
  INVX1 U72 ( .A(b[1]), .Y(n106) );
  INVX1 U73 ( .A(a[1]), .Y(n101) );
  AND2XL U74 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NAND2XL U75 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2XL U76 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2XL U77 ( .A(b[5]), .B(a[1]), .Y(n118) );
  CLKINVX1 U78 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U79 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U80 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U81 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U82 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U83 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U84 ( .A(b[4]), .Y(n103) );
  XOR2X1 U85 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U86 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U87 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U88 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U89 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U90 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U91 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U92 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U93 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U94 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U95 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U96 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U97 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U98 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U99 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U100 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U101 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U102 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U103 ( .A(n102), .B(n104), .Y(n56) );
  NOR2X1 U104 ( .A(n102), .B(n103), .Y(n55) );
  NOR2X1 U105 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U106 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U107 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U108 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U109 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U110 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW_mult_uns_8 ( a, b, product_6_, product_5_, product_4_, 
        product_3_, product_2_, product_1_, product_0_ );
  input [6:0] a;
  input [6:0] b;
  output product_6_, product_5_, product_4_, product_3_, product_2_,
         product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n34, n36, n37, n39,
         n40, n41, n43, n44, n45, n46, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124;

  ADDFXL U3 ( .A(n13), .B(n20), .CI(n3), .CO(n2), .S(product_5_) );
  ADDFXL U4 ( .A(n21), .B(n26), .CI(n4), .CO(n3), .S(product_4_) );
  ADDFXL U5 ( .A(n27), .B(n29), .CI(n5), .CO(n4), .S(product_3_) );
  ADDFXL U6 ( .A(n6), .B(n46), .CI(n31), .CO(n5), .S(product_2_) );
  ADDHXL U7 ( .A(n52), .B(n58), .CO(n6), .S(product_1_) );
  ADDFXL U13 ( .A(n17), .B(n22), .CI(n15), .CO(n12), .S(n13) );
  ADDFXL U14 ( .A(n24), .B(n48), .CI(n19), .CO(n14), .S(n15) );
  ADDFXL U15 ( .A(n39), .B(n54), .CI(n43), .CO(n16), .S(n17) );
  ADDHXL U16 ( .A(n36), .B(n34), .CO(n18), .S(n19) );
  ADDFXL U17 ( .A(n25), .B(n28), .CI(n23), .CO(n20), .S(n21) );
  ADDFXL U18 ( .A(n44), .B(n55), .CI(n49), .CO(n22), .S(n23) );
  ADDHXL U19 ( .A(n40), .B(n37), .CO(n24), .S(n25) );
  ADDFXL U20 ( .A(n50), .B(n56), .CI(n30), .CO(n26), .S(n27) );
  ADDHXL U21 ( .A(n45), .B(n41), .CO(n28), .S(n29) );
  ADDHXL U22 ( .A(n57), .B(n51), .CO(n30), .S(n31) );
  NOR2XL U67 ( .A(n101), .B(n104), .Y(n49) );
  NOR2XL U68 ( .A(n102), .B(n103), .Y(n55) );
  AND2XL U69 ( .A(a[5]), .B(b[0]), .Y(n34) );
  NOR2XL U70 ( .A(n98), .B(n106), .Y(n36) );
  CLKINVX1 U71 ( .A(a[0]), .Y(n102) );
  CLKINVX1 U72 ( .A(b[1]), .Y(n106) );
  CLKINVX1 U73 ( .A(a[1]), .Y(n101) );
  CLKINVX1 U74 ( .A(b[0]), .Y(n107) );
  CLKINVX1 U75 ( .A(b[2]), .Y(n105) );
  CLKINVX1 U76 ( .A(a[2]), .Y(n100) );
  CLKINVX1 U77 ( .A(b[3]), .Y(n104) );
  CLKINVX1 U78 ( .A(a[3]), .Y(n99) );
  CLKINVX1 U79 ( .A(a[4]), .Y(n98) );
  CLKINVX1 U80 ( .A(b[4]), .Y(n103) );
  XOR2X1 U81 ( .A(n108), .B(n109), .Y(product_6_) );
  XOR2X1 U82 ( .A(n110), .B(n12), .Y(n109) );
  XOR2X1 U83 ( .A(n111), .B(n112), .Y(n110) );
  XOR2X1 U84 ( .A(n113), .B(n114), .Y(n112) );
  XOR2X1 U85 ( .A(n115), .B(n116), .Y(n114) );
  NAND2X1 U86 ( .A(b[1]), .B(a[5]), .Y(n116) );
  NAND2X1 U87 ( .A(b[0]), .B(a[6]), .Y(n115) );
  XOR2X1 U88 ( .A(n117), .B(n118), .Y(n113) );
  NAND2X1 U89 ( .A(b[5]), .B(a[1]), .Y(n118) );
  NAND2X1 U90 ( .A(b[2]), .B(a[4]), .Y(n117) );
  XOR2X1 U91 ( .A(n119), .B(n120), .Y(n111) );
  XOR2X1 U92 ( .A(n121), .B(n122), .Y(n120) );
  NAND2X1 U93 ( .A(b[6]), .B(a[0]), .Y(n122) );
  NAND2X1 U94 ( .A(b[4]), .B(a[2]), .Y(n121) );
  XOR2X1 U95 ( .A(n123), .B(n16), .Y(n119) );
  NAND2X1 U96 ( .A(b[3]), .B(a[3]), .Y(n123) );
  XOR2X1 U97 ( .A(n124), .B(n14), .Y(n108) );
  XNOR2X1 U98 ( .A(n2), .B(n18), .Y(n124) );
  NOR2X1 U99 ( .A(n102), .B(n107), .Y(product_0_) );
  NOR2X1 U100 ( .A(n102), .B(n106), .Y(n58) );
  NOR2X1 U101 ( .A(n105), .B(n102), .Y(n57) );
  NOR2X1 U102 ( .A(n102), .B(n104), .Y(n56) );
  AND2X1 U103 ( .A(b[5]), .B(a[0]), .Y(n54) );
  NOR2X1 U104 ( .A(n101), .B(n107), .Y(n52) );
  NOR2X1 U105 ( .A(n106), .B(n101), .Y(n51) );
  NOR2X1 U106 ( .A(n105), .B(n101), .Y(n50) );
  NOR2X1 U107 ( .A(n101), .B(n103), .Y(n48) );
  NOR2X1 U108 ( .A(n107), .B(n100), .Y(n46) );
  NOR2X1 U109 ( .A(n106), .B(n100), .Y(n45) );
  NOR2X1 U110 ( .A(n105), .B(n100), .Y(n44) );
  NOR2X1 U111 ( .A(n104), .B(n100), .Y(n43) );
  NOR2X1 U112 ( .A(n107), .B(n99), .Y(n41) );
  NOR2X1 U113 ( .A(n106), .B(n99), .Y(n40) );
  NOR2X1 U114 ( .A(n105), .B(n99), .Y(n39) );
  NOR2X1 U115 ( .A(n98), .B(n107), .Y(n37) );
endmodule


module matvecmult_DW01_add_13 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_12 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_11 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_10 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_9 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_8 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult_DW01_add_7 ( A, B, SUM );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  XOR3X1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .Y(SUM[6]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matvecmult ( CLK, RST, vector_x, vector_b, vector_y, Q, A, finish );
  input [127:0] vector_x;
  input [127:0] vector_b;
  output [127:0] vector_y;
  input [127:0] Q;
  output [3:0] A;
  input CLK, RST;
  output finish;
  wire   N9, N10, N11, N12, N195, N196, N197, N198, N199, N200, N201, N209,
         N210, N211, N212, N213, N214, N215, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N244, N245, N246, N247, N248, N249, N250, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n1950, n1960, n1970, n1980, n1990, n2000, n2010, n202,
         n203, n204, n205, temp_6_, temp_5_, temp_4_, temp_3_, temp_2_,
         temp_1_, temp_0_, N990, N980, N970, N890, N880, N870, N860, N850,
         N840, N830, N222, N221, N220, N219, N218, N217, N216, N208, N207,
         N206, N2050, N2040, N2030, N2020, N1940, N1930, N1920, N1910, N1900,
         N1890, N1880, N1870, N1860, N1850, N1840, N1830, N1820, N1810, N1800,
         N1790, N1780, N1770, N1760, N1750, N1740, N1730, N1720, N1710, N1700,
         N1690, N1680, N1670, N1660, N1650, N1640, N1630, N1620, N1610, N1600,
         N1520, N1510, N1500, N1490, N1480, N1470, N1460, N1380, N1370, N1360,
         N1350, N1340, N1330, N1320, N1310, N1300, N1290, N1280, N1270, N1260,
         N1250, N1240, N1230, N1220, N1210, N1200, N1190, N1180, N1170, N1160,
         N1150, N1140, N1130, N1120, N1110, N1030, N1020, N1010, N1000, N960,
         N950, N940, N930, N920, N910, N900, N820, N810, N800, N790, N780,
         N770, N760, N750, N740, N730, N720, N710, N700, N690, N680, N670,
         N660, N650, N640, N630, N620, N610, N600, N590, N580, N570, N560,
         N550, N540, N530, N520, N510, N500, N490, N480, N470, N460, N450, N44,
         N43, N42, N41, N40, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30,
         N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16,
         N1590, N1580, N1570, N1560, N1550, N1540, N1530, N15, N1450, N1440,
         N1430, N1420, N1410, N1400, N14, N1390, N13, N1100, N1090, N1080,
         N1070, N1060, N1050, N1040, n2060, n2070, n2080, n2090, n2100, n2110,
         n2120, n2130, n2140, n2150, n2160, n2170, n2180, n2190, n2200, n2210,
         n2220, n223, n224, n225, n226, n2270, n2280, n2290, n2300, n2310,
         n2320, n2330, n2340, n2350, n2360, n2370, n2380, n2390, n2400, n2410,
         n2420, n243, n2440, n2450, n2460, n2470, n2480, n2490, n2500, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335;
  wire   [7:4] counter_r;

  matvecmult_DW01_inc_0 add_75 ( .A({counter_r, N12, N11, N10, N9}), .SUM({
        N234, N233, N232, N231, N230, N229, N228, N227}) );
  matvecmult_DW01_add_15 add_0_root_add_48_15 ( .A({N201, N200, N199, N198, 
        N197, N196, N195}), .B({N215, N214, N213, N212, N211, N210, N209}), 
        .SUM({temp_6_, temp_5_, temp_4_, temp_3_, temp_2_, temp_1_, temp_0_})
         );
  matvecmult_DW01_add_14 add_76 ( .A_7_(temp_6_), .A_6_(temp_5_), .A_5_(
        temp_4_), .A_4_(temp_3_), .A_3_(temp_2_), .A_2_(temp_1_), .A_1_(
        temp_0_), .B_7_(N235), .B_6_(N236), .B_5_(N237), .B_4_(N238), .B_3_(
        N239), .B_2_(N240), .B_1_(N241), .SUM_7_(N250), .SUM_6_(N249), 
        .SUM_5_(N248), .SUM_4_(N247), .SUM_3_(N246), .SUM_2_(N245), .SUM_1_(
        N244) );
  matvecmult_DW_mult_uns_7 mult_48_9 ( .a(vector_x[62:56]), .b(Q[70:64]), 
        .product_6_(N1240), .product_5_(N1230), .product_4_(N1220), 
        .product_3_(N1210), .product_2_(N1200), .product_1_(N1190), 
        .product_0_(N1180) );
  matvecmult_DW_mult_uns_6 mult_48_10 ( .a(vector_x[54:48]), .b(Q[78:72]), 
        .product_6_(N1380), .product_5_(N1370), .product_4_(N1360), 
        .product_3_(N1350), .product_2_(N1340), .product_1_(N1330), 
        .product_0_(N1320) );
  matvecmult_DW_mult_uns_5 mult_48_11 ( .a(vector_x[46:40]), .b(Q[86:80]), 
        .product_6_(N1520), .product_5_(N1510), .product_4_(N1500), 
        .product_3_(N1490), .product_2_(N1480), .product_1_(N1470), 
        .product_0_(N1460) );
  matvecmult_DW_mult_uns_4 mult_48_12 ( .a(vector_x[38:32]), .b(Q[94:88]), 
        .product_6_(N1660), .product_5_(N1650), .product_4_(N1640), 
        .product_3_(N1630), .product_2_(N1620), .product_1_(N1610), 
        .product_0_(N1600) );
  matvecmult_DW_mult_uns_3 mult_48_13 ( .a(vector_x[30:24]), .b(Q[102:96]), 
        .product_6_(N1800), .product_5_(N1790), .product_4_(N1780), 
        .product_3_(N1770), .product_2_(N1760), .product_1_(N1750), 
        .product_0_(N1740) );
  matvecmult_DW_mult_uns_2 mult_48_14 ( .a(vector_x[22:16]), .b(Q[110:104]), 
        .product_6_(N1940), .product_5_(N1930), .product_4_(N1920), 
        .product_3_(N1910), .product_2_(N1900), .product_1_(N1890), 
        .product_0_(N1880) );
  matvecmult_DW_mult_uns_1 mult_48_15 ( .a(vector_x[14:8]), .b(Q[118:112]), 
        .product_6_(N208), .product_5_(N207), .product_4_(N206), .product_3_(
        N2050), .product_2_(N2040), .product_1_(N2030), .product_0_(N2020) );
  matvecmult_DW_mult_uns_0 mult_48_16 ( .a(vector_x[6:0]), .b(Q[126:120]), 
        .product_6_(N222), .product_5_(N221), .product_4_(N220), .product_3_(
        N219), .product_2_(N218), .product_1_(N217), .product_0_(N216) );
  matvecmult_DW01_add_6 add_6_root_add_1_root_add_48_15 ( .A({N1240, N1230, 
        N1220, N1210, N1200, N1190, N1180}), .B({N1800, N1790, N1780, N1770, 
        N1760, N1750, N1740}), .SUM({N1310, N1300, N1290, N1280, N1270, N1260, 
        N1250}) );
  matvecmult_DW01_add_5 add_3_root_add_1_root_add_48_15 ( .A({N1940, N1930, 
        N1920, N1910, N1900, N1890, N1880}), .B({N222, N221, N220, N219, N218, 
        N217, N216}), .SUM({N1030, N1020, N1010, N1000, N990, N980, N970}) );
  matvecmult_DW01_add_4 add_2_root_add_1_root_add_48_15 ( .A({N1310, N1300, 
        N1290, N1280, N1270, N1260, N1250}), .B({N1030, N1020, N1010, N1000, 
        N990, N980, N970}), .SUM({N890, N880, N870, N860, N850, N840, N830})
         );
  matvecmult_DW01_add_3 add_5_root_add_1_root_add_48_15 ( .A({N1520, N1510, 
        N1500, N1490, N1480, N1470, N1460}), .B({N208, N207, N206, N2050, 
        N2040, N2030, N2020}), .SUM({N1170, N1160, N1150, N1140, N1130, N1120, 
        N1110}) );
  matvecmult_DW01_add_2 add_4_root_add_1_root_add_48_15 ( .A({N1380, N1370, 
        N1360, N1350, N1340, N1330, N1320}), .B({N1660, N1650, N1640, N1630, 
        N1620, N1610, N1600}), .SUM({N1870, N1860, N1850, N1840, N1830, N1820, 
        N1810}) );
  matvecmult_DW01_add_1 add_1_root_add_1_root_add_48_15 ( .A({N1870, N1860, 
        N1850, N1840, N1830, N1820, N1810}), .B({N1170, N1160, N1150, N1140, 
        N1130, N1120, N1110}), .SUM({N1730, N1720, N1710, N1700, N1690, N1680, 
        N1670}) );
  matvecmult_DW01_add_0 add_0_root_add_1_root_add_48_15 ( .A({N890, N880, N870, 
        N860, N850, N840, N830}), .B({N1730, N1720, N1710, N1700, N1690, N1680, 
        N1670}), .SUM({N215, N214, N213, N212, N211, N210, N209}) );
  matvecmult_DW_mult_uns_15 mult_48 ( .a(vector_x[126:120]), .b(Q[6:0]), 
        .product_6_(N19), .product_5_(N18), .product_4_(N17), .product_3_(N16), 
        .product_2_(N15), .product_1_(N14), .product_0_(N13) );
  matvecmult_DW_mult_uns_14 mult_48_2 ( .a(vector_x[118:112]), .b(Q[14:8]), 
        .product_6_(N26), .product_5_(N25), .product_4_(N24), .product_3_(N23), 
        .product_2_(N22), .product_1_(N21), .product_0_(N20) );
  matvecmult_DW_mult_uns_13 mult_48_3 ( .a(vector_x[110:104]), .b(Q[22:16]), 
        .product_6_(N40), .product_5_(N39), .product_4_(N38), .product_3_(N37), 
        .product_2_(N36), .product_1_(N35), .product_0_(N34) );
  matvecmult_DW_mult_uns_12 mult_48_4 ( .a(vector_x[102:96]), .b(Q[30:24]), 
        .product_6_(N540), .product_5_(N530), .product_4_(N520), .product_3_(
        N510), .product_2_(N500), .product_1_(N490), .product_0_(N480) );
  matvecmult_DW_mult_uns_11 mult_48_5 ( .a(vector_x[94:88]), .b(Q[38:32]), 
        .product_6_(N680), .product_5_(N670), .product_4_(N660), .product_3_(
        N650), .product_2_(N640), .product_1_(N630), .product_0_(N620) );
  matvecmult_DW_mult_uns_10 mult_48_6 ( .a(vector_x[86:80]), .b(Q[46:40]), 
        .product_6_(N820), .product_5_(N810), .product_4_(N800), .product_3_(
        N790), .product_2_(N780), .product_1_(N770), .product_0_(N760) );
  matvecmult_DW_mult_uns_9 mult_48_7 ( .a(vector_x[78:72]), .b(Q[54:48]), 
        .product_6_(N960), .product_5_(N950), .product_4_(N940), .product_3_(
        N930), .product_2_(N920), .product_1_(N910), .product_0_(N900) );
  matvecmult_DW_mult_uns_8 mult_48_8 ( .a(vector_x[70:64]), .b(Q[62:56]), 
        .product_6_(N1100), .product_5_(N1090), .product_4_(N1080), 
        .product_3_(N1070), .product_2_(N1060), .product_1_(N1050), 
        .product_0_(N1040) );
  matvecmult_DW01_add_13 add_6_root_add_2_root_add_48_15 ( .A({N19, N18, N17, 
        N16, N15, N14, N13}), .B({N680, N670, N660, N650, N640, N630, N620}), 
        .SUM({N750, N740, N730, N720, N710, N700, N690}) );
  matvecmult_DW01_add_12 add_3_root_add_2_root_add_48_15 ( .A({N820, N810, 
        N800, N790, N780, N770, N760}), .B({N1100, N1090, N1080, N1070, N1060, 
        N1050, N1040}), .SUM({N470, N460, N450, N44, N43, N42, N41}) );
  matvecmult_DW01_add_11 add_2_root_add_2_root_add_48_15 ( .A({N750, N740, 
        N730, N720, N710, N700, N690}), .B({N470, N460, N450, N44, N43, N42, 
        N41}), .SUM({N33, N32, N31, N30, N29, N28, N27}) );
  matvecmult_DW01_add_10 add_5_root_add_2_root_add_48_15 ( .A({N40, N39, N38, 
        N37, N36, N35, N34}), .B({N960, N950, N940, N930, N920, N910, N900}), 
        .SUM({N610, N600, N590, N580, N570, N560, N550}) );
  matvecmult_DW01_add_9 add_4_root_add_2_root_add_48_15 ( .A({N26, N25, N24, 
        N23, N22, N21, N20}), .B({N540, N530, N520, N510, N500, N490, N480}), 
        .SUM({N1590, N1580, N1570, N1560, N1550, N1540, N1530}) );
  matvecmult_DW01_add_8 add_1_root_add_2_root_add_48_15 ( .A({N1590, N1580, 
        N1570, N1560, N1550, N1540, N1530}), .B({N610, N600, N590, N580, N570, 
        N560, N550}), .SUM({N1450, N1440, N1430, N1420, N1410, N1400, N1390})
         );
  matvecmult_DW01_add_7 add_0_root_add_2_root_add_48_15 ( .A({N33, N32, N31, 
        N30, N29, N28, N27}), .B({N1450, N1440, N1430, N1420, N1410, N1400, 
        N1390}), .SUM({N201, N200, N199, N198, N197, N196, N195}) );
  DFFRX1 counter_r_reg_7_ ( .D(n205), .CK(CLK), .RN(n326), .Q(counter_r[7]) );
  DFFRX1 counter_r_reg_4_ ( .D(n204), .CK(CLK), .RN(n325), .Q(counter_r[4]) );
  DFFRX1 counter_r_reg_5_ ( .D(n203), .CK(CLK), .RN(n326), .Q(counter_r[5]) );
  DFFRX1 counter_r_reg_6_ ( .D(n202), .CK(CLK), .RN(n326), .Q(counter_r[6]) );
  DFFRX1 counter_r_reg_0_ ( .D(A[0]), .CK(CLK), .RN(n326), .Q(N9), .QN(n292)
         );
  DFFRX1 counter_r_reg_2_ ( .D(A[2]), .CK(CLK), .RN(n325), .Q(N11), .QN(n290)
         );
  DFFRX1 counter_r_reg_1_ ( .D(A[1]), .CK(CLK), .RN(n325), .Q(N10), .QN(n289)
         );
  DFFRX1 counter_r_reg_3_ ( .D(A[3]), .CK(CLK), .RN(n325), .Q(N12), .QN(n291)
         );
  DFFRX2 y_r_reg_14__0_ ( .D(n186), .CK(CLK), .RN(n326), .Q(vector_y[112]) );
  DFFRX2 y_r_reg_13__0_ ( .D(n178), .CK(CLK), .RN(n324), .Q(vector_y[104]) );
  DFFRX2 y_r_reg_15__0_ ( .D(n194), .CK(CLK), .RN(n325), .Q(vector_y[120]) );
  DFFRX2 y_r_reg_12__0_ ( .D(n170), .CK(CLK), .RN(n324), .Q(vector_y[96]) );
  DFFRX2 y_r_reg_11__0_ ( .D(n162), .CK(CLK), .RN(n323), .Q(vector_y[88]) );
  DFFRX2 y_r_reg_10__0_ ( .D(n154), .CK(CLK), .RN(n323), .Q(vector_y[80]) );
  DFFRX2 y_r_reg_9__0_ ( .D(n146), .CK(CLK), .RN(n323), .Q(vector_y[72]) );
  DFFRX2 y_r_reg_8__0_ ( .D(n138), .CK(CLK), .RN(n334), .Q(vector_y[64]) );
  DFFRX2 y_r_reg_7__0_ ( .D(n130), .CK(CLK), .RN(n319), .Q(vector_y[56]) );
  DFFRX2 y_r_reg_6__0_ ( .D(n122), .CK(CLK), .RN(n319), .Q(vector_y[48]) );
  DFFRX2 y_r_reg_5__0_ ( .D(n114), .CK(CLK), .RN(n322), .Q(vector_y[40]) );
  DFFRX2 y_r_reg_4__0_ ( .D(n106), .CK(CLK), .RN(n321), .Q(vector_y[32]) );
  DFFRX2 y_r_reg_3__0_ ( .D(n98), .CK(CLK), .RN(n321), .Q(vector_y[24]) );
  DFFRX2 y_r_reg_2__0_ ( .D(n90), .CK(CLK), .RN(n320), .Q(vector_y[16]) );
  DFFRX2 y_r_reg_1__0_ ( .D(n82), .CK(CLK), .RN(n318), .Q(vector_y[8]) );
  DFFRX2 y_r_reg_0__0_ ( .D(n74), .CK(CLK), .RN(n326), .Q(vector_y[0]) );
  DFFRX2 y_r_reg_14__1_ ( .D(n187), .CK(CLK), .RN(n318), .Q(vector_y[113]) );
  DFFRX2 y_r_reg_13__1_ ( .D(n179), .CK(CLK), .RN(n324), .Q(vector_y[105]) );
  DFFRX2 y_r_reg_15__1_ ( .D(n1950), .CK(CLK), .RN(n325), .Q(vector_y[121]) );
  DFFRX2 y_r_reg_12__1_ ( .D(n171), .CK(CLK), .RN(n324), .Q(vector_y[97]) );
  DFFRX2 y_r_reg_11__1_ ( .D(n163), .CK(CLK), .RN(n322), .Q(vector_y[89]) );
  DFFRX2 y_r_reg_10__1_ ( .D(n155), .CK(CLK), .RN(n323), .Q(vector_y[81]) );
  DFFRX2 y_r_reg_9__1_ ( .D(n147), .CK(CLK), .RN(n323), .Q(vector_y[73]) );
  DFFRX2 y_r_reg_8__1_ ( .D(n139), .CK(CLK), .RN(n334), .Q(vector_y[65]) );
  DFFRX2 y_r_reg_7__1_ ( .D(n131), .CK(CLK), .RN(n319), .Q(vector_y[57]) );
  DFFRX2 y_r_reg_6__1_ ( .D(n123), .CK(CLK), .RN(n319), .Q(vector_y[49]) );
  DFFRX2 y_r_reg_5__1_ ( .D(n115), .CK(CLK), .RN(n322), .Q(vector_y[41]) );
  DFFRX2 y_r_reg_4__1_ ( .D(n107), .CK(CLK), .RN(n321), .Q(vector_y[33]) );
  DFFRX2 y_r_reg_3__1_ ( .D(n99), .CK(CLK), .RN(n321), .Q(vector_y[25]) );
  DFFRX2 y_r_reg_2__1_ ( .D(n91), .CK(CLK), .RN(n320), .Q(vector_y[17]) );
  DFFRX2 y_r_reg_1__1_ ( .D(n83), .CK(CLK), .RN(n318), .Q(vector_y[9]) );
  DFFRX2 y_r_reg_0__1_ ( .D(n75), .CK(CLK), .RN(n326), .Q(vector_y[1]) );
  DFFRX2 y_r_reg_14__2_ ( .D(n188), .CK(CLK), .RN(n326), .Q(vector_y[114]) );
  DFFRX2 y_r_reg_13__2_ ( .D(n180), .CK(CLK), .RN(n324), .Q(vector_y[106]) );
  DFFRX2 y_r_reg_15__2_ ( .D(n1960), .CK(CLK), .RN(n325), .Q(vector_y[122]) );
  DFFRX2 y_r_reg_12__2_ ( .D(n172), .CK(CLK), .RN(n324), .Q(vector_y[98]) );
  DFFRX2 y_r_reg_11__2_ ( .D(n164), .CK(CLK), .RN(n325), .Q(vector_y[90]) );
  DFFRX2 y_r_reg_10__2_ ( .D(n156), .CK(CLK), .RN(n323), .Q(vector_y[82]) );
  DFFRX2 y_r_reg_9__2_ ( .D(n148), .CK(CLK), .RN(n323), .Q(vector_y[74]) );
  DFFRX2 y_r_reg_8__2_ ( .D(n140), .CK(CLK), .RN(n319), .Q(vector_y[66]) );
  DFFRX2 y_r_reg_7__2_ ( .D(n132), .CK(CLK), .RN(n319), .Q(vector_y[58]) );
  DFFRX2 y_r_reg_6__2_ ( .D(n124), .CK(CLK), .RN(n319), .Q(vector_y[50]) );
  DFFRX2 y_r_reg_5__2_ ( .D(n116), .CK(CLK), .RN(n322), .Q(vector_y[42]) );
  DFFRX2 y_r_reg_4__2_ ( .D(n108), .CK(CLK), .RN(n321), .Q(vector_y[34]) );
  DFFRX2 y_r_reg_3__2_ ( .D(n100), .CK(CLK), .RN(n321), .Q(vector_y[26]) );
  DFFRX2 y_r_reg_2__2_ ( .D(n92), .CK(CLK), .RN(n320), .Q(vector_y[18]) );
  DFFRX2 y_r_reg_1__2_ ( .D(n84), .CK(CLK), .RN(n318), .Q(vector_y[10]) );
  DFFRX2 y_r_reg_0__2_ ( .D(n76), .CK(CLK), .RN(n326), .Q(vector_y[2]) );
  DFFRX2 y_r_reg_14__3_ ( .D(n189), .CK(CLK), .RN(n321), .Q(vector_y[115]) );
  DFFRX2 y_r_reg_13__3_ ( .D(n181), .CK(CLK), .RN(n324), .Q(vector_y[107]) );
  DFFRX2 y_r_reg_15__3_ ( .D(n1970), .CK(CLK), .RN(n325), .Q(vector_y[123]) );
  DFFRX2 y_r_reg_12__3_ ( .D(n173), .CK(CLK), .RN(n324), .Q(vector_y[99]) );
  DFFRX2 y_r_reg_11__3_ ( .D(n165), .CK(CLK), .RN(n324), .Q(vector_y[91]) );
  DFFRX2 y_r_reg_10__3_ ( .D(n157), .CK(CLK), .RN(n323), .Q(vector_y[83]) );
  DFFRX2 y_r_reg_9__3_ ( .D(n149), .CK(CLK), .RN(n323), .Q(vector_y[75]) );
  DFFRX2 y_r_reg_8__3_ ( .D(n141), .CK(CLK), .RN(n326), .Q(vector_y[67]) );
  DFFRX2 y_r_reg_7__3_ ( .D(n133), .CK(CLK), .RN(n319), .Q(vector_y[59]) );
  DFFRX2 y_r_reg_6__3_ ( .D(n125), .CK(CLK), .RN(n319), .Q(vector_y[51]) );
  DFFRX2 y_r_reg_5__3_ ( .D(n117), .CK(CLK), .RN(n322), .Q(vector_y[43]) );
  DFFRX2 y_r_reg_4__3_ ( .D(n109), .CK(CLK), .RN(n321), .Q(vector_y[35]) );
  DFFRX2 y_r_reg_3__3_ ( .D(n101), .CK(CLK), .RN(n321), .Q(vector_y[27]) );
  DFFRX2 y_r_reg_2__3_ ( .D(n93), .CK(CLK), .RN(n320), .Q(vector_y[19]) );
  DFFRX2 y_r_reg_1__3_ ( .D(n85), .CK(CLK), .RN(n318), .Q(vector_y[11]) );
  DFFRX2 y_r_reg_0__3_ ( .D(n77), .CK(CLK), .RN(n326), .Q(vector_y[3]) );
  DFFRX2 y_r_reg_14__4_ ( .D(n190), .CK(CLK), .RN(n321), .Q(vector_y[116]) );
  DFFRX2 y_r_reg_13__4_ ( .D(n182), .CK(CLK), .RN(n318), .Q(vector_y[108]) );
  DFFRX2 y_r_reg_15__4_ ( .D(n1980), .CK(CLK), .RN(n325), .Q(vector_y[124]) );
  DFFRX2 y_r_reg_12__4_ ( .D(n174), .CK(CLK), .RN(n324), .Q(vector_y[100]) );
  DFFRX2 y_r_reg_11__4_ ( .D(n166), .CK(CLK), .RN(n323), .Q(vector_y[92]) );
  DFFRX2 y_r_reg_10__4_ ( .D(n158), .CK(CLK), .RN(n322), .Q(vector_y[84]) );
  DFFRX2 y_r_reg_9__4_ ( .D(n150), .CK(CLK), .RN(n323), .Q(vector_y[76]) );
  DFFRX2 y_r_reg_8__4_ ( .D(n142), .CK(CLK), .RN(n319), .Q(vector_y[68]) );
  DFFRX2 y_r_reg_7__4_ ( .D(n134), .CK(CLK), .RN(n319), .Q(vector_y[60]) );
  DFFRX2 y_r_reg_6__4_ ( .D(n126), .CK(CLK), .RN(n319), .Q(vector_y[52]) );
  DFFRX2 y_r_reg_5__4_ ( .D(n118), .CK(CLK), .RN(n322), .Q(vector_y[44]) );
  DFFRX2 y_r_reg_4__4_ ( .D(n110), .CK(CLK), .RN(n322), .Q(vector_y[36]) );
  DFFRX2 y_r_reg_3__4_ ( .D(n102), .CK(CLK), .RN(n321), .Q(vector_y[28]) );
  DFFRX2 y_r_reg_2__4_ ( .D(n94), .CK(CLK), .RN(n320), .Q(vector_y[20]) );
  DFFRX2 y_r_reg_1__4_ ( .D(n86), .CK(CLK), .RN(n320), .Q(vector_y[12]) );
  DFFRX2 y_r_reg_0__4_ ( .D(n78), .CK(CLK), .RN(n318), .Q(vector_y[4]) );
  DFFRX2 y_r_reg_14__5_ ( .D(n191), .CK(CLK), .RN(n326), .Q(vector_y[117]) );
  DFFRX2 y_r_reg_13__5_ ( .D(n183), .CK(CLK), .RN(n318), .Q(vector_y[109]) );
  DFFRX2 y_r_reg_15__5_ ( .D(n1990), .CK(CLK), .RN(n325), .Q(vector_y[125]) );
  DFFRX2 y_r_reg_12__5_ ( .D(n175), .CK(CLK), .RN(n324), .Q(vector_y[101]) );
  DFFRX2 y_r_reg_11__5_ ( .D(n167), .CK(CLK), .RN(n325), .Q(vector_y[93]) );
  DFFRX2 y_r_reg_10__5_ ( .D(n159), .CK(CLK), .RN(n324), .Q(vector_y[85]) );
  DFFRX2 y_r_reg_9__5_ ( .D(n151), .CK(CLK), .RN(n323), .Q(vector_y[77]) );
  DFFRX2 y_r_reg_8__5_ ( .D(n143), .CK(CLK), .RN(n325), .Q(vector_y[69]) );
  DFFRX2 y_r_reg_7__5_ ( .D(n135), .CK(CLK), .RN(n326), .Q(vector_y[61]) );
  DFFRX2 y_r_reg_6__5_ ( .D(n127), .CK(CLK), .RN(n319), .Q(vector_y[53]) );
  DFFRX2 y_r_reg_5__5_ ( .D(n119), .CK(CLK), .RN(n322), .Q(vector_y[45]) );
  DFFRX2 y_r_reg_4__5_ ( .D(n111), .CK(CLK), .RN(n322), .Q(vector_y[37]) );
  DFFRX2 y_r_reg_3__5_ ( .D(n103), .CK(CLK), .RN(n321), .Q(vector_y[29]) );
  DFFRX2 y_r_reg_2__5_ ( .D(n95), .CK(CLK), .RN(n320), .Q(vector_y[21]) );
  DFFRX2 y_r_reg_1__5_ ( .D(n87), .CK(CLK), .RN(n320), .Q(vector_y[13]) );
  DFFRX2 y_r_reg_0__5_ ( .D(n79), .CK(CLK), .RN(n326), .Q(vector_y[5]) );
  DFFRX2 y_r_reg_14__6_ ( .D(n192), .CK(CLK), .RN(n318), .Q(vector_y[118]) );
  DFFRX2 y_r_reg_13__6_ ( .D(n184), .CK(CLK), .RN(n326), .Q(vector_y[110]) );
  DFFRX2 y_r_reg_15__6_ ( .D(n2000), .CK(CLK), .RN(n325), .Q(vector_y[126]) );
  DFFRX2 y_r_reg_12__6_ ( .D(n176), .CK(CLK), .RN(n324), .Q(vector_y[102]) );
  DFFRX2 y_r_reg_11__6_ ( .D(n168), .CK(CLK), .RN(n323), .Q(vector_y[94]) );
  DFFRX2 y_r_reg_10__6_ ( .D(n160), .CK(CLK), .RN(n322), .Q(vector_y[86]) );
  DFFRX2 y_r_reg_9__6_ ( .D(n152), .CK(CLK), .RN(n323), .Q(vector_y[78]) );
  DFFRX2 y_r_reg_8__6_ ( .D(n144), .CK(CLK), .RN(n318), .Q(vector_y[70]) );
  DFFRX2 y_r_reg_7__6_ ( .D(n136), .CK(CLK), .RN(n326), .Q(vector_y[62]) );
  DFFRX2 y_r_reg_6__6_ ( .D(n128), .CK(CLK), .RN(n319), .Q(vector_y[54]) );
  DFFRX2 y_r_reg_5__6_ ( .D(n120), .CK(CLK), .RN(n322), .Q(vector_y[46]) );
  DFFRX2 y_r_reg_4__6_ ( .D(n112), .CK(CLK), .RN(n322), .Q(vector_y[38]) );
  DFFRX2 y_r_reg_3__6_ ( .D(n104), .CK(CLK), .RN(n321), .Q(vector_y[30]) );
  DFFRX2 y_r_reg_2__6_ ( .D(n96), .CK(CLK), .RN(n320), .Q(vector_y[22]) );
  DFFRX2 y_r_reg_1__6_ ( .D(n88), .CK(CLK), .RN(n320), .Q(vector_y[14]) );
  DFFRX2 y_r_reg_0__6_ ( .D(n80), .CK(CLK), .RN(n318), .Q(vector_y[6]) );
  DFFRX2 y_r_reg_15__7_ ( .D(n2010), .CK(CLK), .RN(n325), .Q(vector_y[127]) );
  DFFRX2 y_r_reg_12__7_ ( .D(n177), .CK(CLK), .RN(n324), .Q(vector_y[103]) );
  DFFRX2 y_r_reg_11__7_ ( .D(n169), .CK(CLK), .RN(n319), .Q(vector_y[95]) );
  DFFRX2 y_r_reg_10__7_ ( .D(n161), .CK(CLK), .RN(n319), .Q(vector_y[87]) );
  DFFRX2 y_r_reg_9__7_ ( .D(n153), .CK(CLK), .RN(n323), .Q(vector_y[79]) );
  DFFRX2 y_r_reg_8__7_ ( .D(n145), .CK(CLK), .RN(n321), .Q(vector_y[71]) );
  DFFRX2 y_r_reg_7__7_ ( .D(n137), .CK(CLK), .RN(n318), .Q(vector_y[63]) );
  DFFRX2 y_r_reg_6__7_ ( .D(n129), .CK(CLK), .RN(n324), .Q(vector_y[55]) );
  DFFRX2 y_r_reg_5__7_ ( .D(n121), .CK(CLK), .RN(n322), .Q(vector_y[47]) );
  DFFRX2 y_r_reg_4__7_ ( .D(n113), .CK(CLK), .RN(n322), .Q(vector_y[39]) );
  DFFRX2 y_r_reg_3__7_ ( .D(n105), .CK(CLK), .RN(n321), .Q(vector_y[31]) );
  DFFRX2 y_r_reg_2__7_ ( .D(n97), .CK(CLK), .RN(n320), .Q(vector_y[23]) );
  DFFRX2 y_r_reg_1__7_ ( .D(n89), .CK(CLK), .RN(n320), .Q(vector_y[15]) );
  DFFRX2 y_r_reg_0__7_ ( .D(n81), .CK(CLK), .RN(n318), .Q(vector_y[7]) );
  DFFRX2 y_r_reg_14__7_ ( .D(n193), .CK(CLK), .RN(n326), .Q(vector_y[119]) );
  DFFRX2 y_r_reg_13__7_ ( .D(n185), .CK(CLK), .RN(n321), .Q(vector_y[111]) );
  INVX6 U178 ( .A(N250), .Y(n327) );
  NOR2X1 U179 ( .A(n289), .B(n292), .Y(n2060) );
  NAND2X2 U180 ( .A(N11), .B(n291), .Y(n280) );
  NAND2X2 U181 ( .A(n290), .B(n291), .Y(n282) );
  NAND2X2 U182 ( .A(N12), .B(n290), .Y(n287) );
  NAND2X2 U183 ( .A(N12), .B(N11), .Y(n285) );
  OA22XL U184 ( .A0(n282), .A1(n224), .B0(n280), .B1(n223), .Y(n225) );
  OA22XL U185 ( .A0(n282), .A1(n2330), .B0(n280), .B1(n2320), .Y(n2340) );
  OA22XL U186 ( .A0(n282), .A1(n2420), .B0(n280), .B1(n2410), .Y(n243) );
  OA22XL U187 ( .A0(n282), .A1(n251), .B0(n280), .B1(n2500), .Y(n252) );
  OA22XL U188 ( .A0(n282), .A1(n260), .B0(n280), .B1(n259), .Y(n261) );
  OA22XL U189 ( .A0(n282), .A1(n269), .B0(n280), .B1(n268), .Y(n270) );
  OA22XL U190 ( .A0(n282), .A1(n2150), .B0(n280), .B1(n2140), .Y(n2160) );
  OA22XL U191 ( .A0(n283), .A1(n282), .B0(n281), .B1(n280), .Y(n284) );
  NOR2X1 U192 ( .A(N10), .B(N11), .Y(n53) );
  NOR2X1 U193 ( .A(n290), .B(N10), .Y(n61) );
  NOR2X1 U194 ( .A(n289), .B(N11), .Y(n58) );
  NOR2X1 U195 ( .A(n289), .B(n290), .Y(n47) );
  CLKBUFX3 U196 ( .A(n325), .Y(n320) );
  CLKBUFX3 U197 ( .A(n334), .Y(n321) );
  CLKBUFX3 U198 ( .A(n318), .Y(n322) );
  CLKBUFX3 U199 ( .A(n318), .Y(n323) );
  CLKBUFX3 U200 ( .A(n318), .Y(n324) );
  CLKBUFX3 U201 ( .A(n318), .Y(n325) );
  CLKBUFX3 U202 ( .A(n334), .Y(n326) );
  CLKBUFX3 U203 ( .A(n297), .Y(n298) );
  CLKBUFX3 U204 ( .A(n2060), .Y(n297) );
  CLKBUFX3 U205 ( .A(n295), .Y(n296) );
  CLKBUFX3 U206 ( .A(n294), .Y(n293) );
  INVX3 U207 ( .A(N248), .Y(n329) );
  INVX3 U208 ( .A(N249), .Y(n328) );
  INVX3 U209 ( .A(N247), .Y(n330) );
  CLKBUFX3 U210 ( .A(n299), .Y(n300) );
  CLKBUFX3 U211 ( .A(n279), .Y(n299) );
  CLKBUFX3 U212 ( .A(n276), .Y(n294) );
  CLKBUFX3 U213 ( .A(n277), .Y(n295) );
  INVX3 U214 ( .A(N244), .Y(n333) );
  INVX3 U215 ( .A(N245), .Y(n332) );
  INVX3 U216 ( .A(N246), .Y(n331) );
  CLKBUFX3 U217 ( .A(n45), .Y(n302) );
  NAND2X1 U218 ( .A(n61), .B(n50), .Y(n45) );
  CLKBUFX3 U219 ( .A(n46), .Y(n317) );
  NAND2X1 U220 ( .A(n47), .B(n48), .Y(n46) );
  CLKBUFX3 U221 ( .A(n52), .Y(n315) );
  NAND2X1 U222 ( .A(n53), .B(n54), .Y(n52) );
  CLKBUFX3 U223 ( .A(n57), .Y(n313) );
  NAND2X1 U224 ( .A(n58), .B(n54), .Y(n57) );
  CLKBUFX3 U225 ( .A(n59), .Y(n312) );
  NAND2X1 U226 ( .A(n58), .B(n56), .Y(n59) );
  CLKBUFX3 U227 ( .A(n67), .Y(n307) );
  NAND2X1 U228 ( .A(n53), .B(n48), .Y(n67) );
  CLKBUFX3 U229 ( .A(n68), .Y(n306) );
  NAND2X1 U230 ( .A(n53), .B(n50), .Y(n68) );
  CLKBUFX3 U231 ( .A(n69), .Y(n305) );
  NAND2X1 U232 ( .A(n58), .B(n48), .Y(n69) );
  CLKBUFX3 U233 ( .A(n70), .Y(n304) );
  NAND2X1 U234 ( .A(n58), .B(n50), .Y(n70) );
  CLKBUFX3 U235 ( .A(n49), .Y(n316) );
  NAND2X1 U236 ( .A(n47), .B(n50), .Y(n49) );
  CLKBUFX3 U237 ( .A(n55), .Y(n314) );
  NAND2X1 U238 ( .A(n56), .B(n53), .Y(n55) );
  CLKBUFX3 U239 ( .A(n60), .Y(n311) );
  NAND2X1 U240 ( .A(n54), .B(n61), .Y(n60) );
  CLKBUFX3 U241 ( .A(n62), .Y(n310) );
  NAND2X1 U242 ( .A(n56), .B(n61), .Y(n62) );
  CLKBUFX3 U243 ( .A(n63), .Y(n309) );
  NAND2X1 U244 ( .A(n54), .B(n47), .Y(n63) );
  CLKBUFX3 U245 ( .A(n65), .Y(n308) );
  NAND2X1 U246 ( .A(n56), .B(n47), .Y(n65) );
  CLKBUFX3 U247 ( .A(n71), .Y(n303) );
  NAND2X1 U248 ( .A(n48), .B(n61), .Y(n71) );
  CLKBUFX3 U249 ( .A(n334), .Y(n319) );
  CLKBUFX3 U250 ( .A(n334), .Y(n318) );
  OAI2BB2XL U251 ( .B0(n302), .B1(n327), .A0N(vector_y[111]), .A1N(n302), .Y(
        n185) );
  OAI2BB2XL U252 ( .B0(n327), .B1(n315), .A0N(vector_y[7]), .A1N(n315), .Y(n81) );
  OAI2BB2XL U253 ( .B0(n327), .B1(n314), .A0N(vector_y[15]), .A1N(n314), .Y(
        n89) );
  OAI2BB2XL U254 ( .B0(n327), .B1(n313), .A0N(vector_y[23]), .A1N(n313), .Y(
        n97) );
  OAI2BB2XL U255 ( .B0(n327), .B1(n312), .A0N(vector_y[31]), .A1N(n312), .Y(
        n105) );
  OAI2BB2XL U256 ( .B0(n327), .B1(n311), .A0N(vector_y[39]), .A1N(n311), .Y(
        n113) );
  OAI2BB2XL U257 ( .B0(n327), .B1(n310), .A0N(vector_y[47]), .A1N(n310), .Y(
        n121) );
  OAI2BB2XL U258 ( .B0(n327), .B1(n309), .A0N(vector_y[55]), .A1N(n309), .Y(
        n129) );
  OAI2BB2XL U259 ( .B0(n327), .B1(n308), .A0N(vector_y[63]), .A1N(n308), .Y(
        n137) );
  OAI2BB2XL U260 ( .B0(n327), .B1(n307), .A0N(vector_y[71]), .A1N(n307), .Y(
        n145) );
  OAI2BB2XL U261 ( .B0(n327), .B1(n306), .A0N(vector_y[79]), .A1N(n306), .Y(
        n153) );
  OAI2BB2XL U262 ( .B0(n327), .B1(n305), .A0N(vector_y[87]), .A1N(n305), .Y(
        n161) );
  OAI2BB2XL U263 ( .B0(n327), .B1(n304), .A0N(vector_y[95]), .A1N(n304), .Y(
        n169) );
  OAI2BB2XL U264 ( .B0(n327), .B1(n303), .A0N(vector_y[103]), .A1N(n303), .Y(
        n177) );
  OAI2BB2XL U265 ( .B0(n327), .B1(n317), .A0N(vector_y[119]), .A1N(n317), .Y(
        n193) );
  OAI2BB2XL U266 ( .B0(n327), .B1(n316), .A0N(vector_y[127]), .A1N(n316), .Y(
        n2010) );
  OAI2BB2XL U267 ( .B0(n302), .B1(n329), .A0N(vector_y[109]), .A1N(n302), .Y(
        n183) );
  OAI2BB2XL U268 ( .B0(n302), .B1(n328), .A0N(vector_y[110]), .A1N(n302), .Y(
        n184) );
  OAI2BB2XL U269 ( .B0(n317), .B1(n329), .A0N(vector_y[117]), .A1N(n317), .Y(
        n191) );
  OAI2BB2XL U270 ( .B0(n317), .B1(n328), .A0N(vector_y[118]), .A1N(n317), .Y(
        n192) );
  OAI2BB2XL U271 ( .B0(n329), .B1(n315), .A0N(vector_y[5]), .A1N(n315), .Y(n79) );
  OAI2BB2XL U272 ( .B0(n328), .B1(n315), .A0N(vector_y[6]), .A1N(n315), .Y(n80) );
  OAI2BB2XL U273 ( .B0(n329), .B1(n314), .A0N(vector_y[13]), .A1N(n314), .Y(
        n87) );
  OAI2BB2XL U274 ( .B0(n328), .B1(n314), .A0N(vector_y[14]), .A1N(n314), .Y(
        n88) );
  OAI2BB2XL U275 ( .B0(n329), .B1(n313), .A0N(vector_y[21]), .A1N(n313), .Y(
        n95) );
  OAI2BB2XL U276 ( .B0(n328), .B1(n313), .A0N(vector_y[22]), .A1N(n313), .Y(
        n96) );
  OAI2BB2XL U277 ( .B0(n329), .B1(n312), .A0N(vector_y[29]), .A1N(n312), .Y(
        n103) );
  OAI2BB2XL U278 ( .B0(n328), .B1(n312), .A0N(vector_y[30]), .A1N(n312), .Y(
        n104) );
  OAI2BB2XL U279 ( .B0(n329), .B1(n311), .A0N(vector_y[37]), .A1N(n311), .Y(
        n111) );
  OAI2BB2XL U280 ( .B0(n328), .B1(n311), .A0N(vector_y[38]), .A1N(n311), .Y(
        n112) );
  OAI2BB2XL U281 ( .B0(n329), .B1(n310), .A0N(vector_y[45]), .A1N(n310), .Y(
        n119) );
  OAI2BB2XL U282 ( .B0(n328), .B1(n310), .A0N(vector_y[46]), .A1N(n310), .Y(
        n120) );
  OAI2BB2XL U283 ( .B0(n329), .B1(n309), .A0N(vector_y[53]), .A1N(n309), .Y(
        n127) );
  OAI2BB2XL U284 ( .B0(n328), .B1(n309), .A0N(vector_y[54]), .A1N(n309), .Y(
        n128) );
  OAI2BB2XL U285 ( .B0(n329), .B1(n308), .A0N(vector_y[61]), .A1N(n308), .Y(
        n135) );
  OAI2BB2XL U286 ( .B0(n328), .B1(n308), .A0N(vector_y[62]), .A1N(n308), .Y(
        n136) );
  OAI2BB2XL U287 ( .B0(n329), .B1(n307), .A0N(vector_y[69]), .A1N(n307), .Y(
        n143) );
  OAI2BB2XL U288 ( .B0(n328), .B1(n307), .A0N(vector_y[70]), .A1N(n307), .Y(
        n144) );
  OAI2BB2XL U289 ( .B0(n329), .B1(n306), .A0N(vector_y[77]), .A1N(n306), .Y(
        n151) );
  OAI2BB2XL U290 ( .B0(n328), .B1(n306), .A0N(vector_y[78]), .A1N(n306), .Y(
        n152) );
  OAI2BB2XL U291 ( .B0(n329), .B1(n305), .A0N(vector_y[85]), .A1N(n305), .Y(
        n159) );
  OAI2BB2XL U292 ( .B0(n328), .B1(n305), .A0N(vector_y[86]), .A1N(n305), .Y(
        n160) );
  OAI2BB2XL U293 ( .B0(n329), .B1(n304), .A0N(vector_y[93]), .A1N(n304), .Y(
        n167) );
  OAI2BB2XL U294 ( .B0(n328), .B1(n304), .A0N(vector_y[94]), .A1N(n304), .Y(
        n168) );
  OAI2BB2XL U295 ( .B0(n329), .B1(n303), .A0N(vector_y[101]), .A1N(n303), .Y(
        n175) );
  OAI2BB2XL U296 ( .B0(n328), .B1(n303), .A0N(vector_y[102]), .A1N(n303), .Y(
        n176) );
  OAI2BB2XL U297 ( .B0(n329), .B1(n316), .A0N(vector_y[125]), .A1N(n316), .Y(
        n1990) );
  OAI2BB2XL U298 ( .B0(n328), .B1(n316), .A0N(vector_y[126]), .A1N(n316), .Y(
        n2000) );
  OAI2BB2XL U299 ( .B0(n302), .B1(n330), .A0N(vector_y[108]), .A1N(n302), .Y(
        n182) );
  OAI2BB2XL U300 ( .B0(n317), .B1(n330), .A0N(vector_y[116]), .A1N(n317), .Y(
        n190) );
  OAI2BB2XL U301 ( .B0(n330), .B1(n315), .A0N(vector_y[4]), .A1N(n315), .Y(n78) );
  OAI2BB2XL U302 ( .B0(n330), .B1(n314), .A0N(vector_y[12]), .A1N(n314), .Y(
        n86) );
  OAI2BB2XL U303 ( .B0(n330), .B1(n313), .A0N(vector_y[20]), .A1N(n313), .Y(
        n94) );
  OAI2BB2XL U304 ( .B0(n330), .B1(n312), .A0N(vector_y[28]), .A1N(n312), .Y(
        n102) );
  OAI2BB2XL U305 ( .B0(n330), .B1(n311), .A0N(vector_y[36]), .A1N(n311), .Y(
        n110) );
  OAI2BB2XL U306 ( .B0(n330), .B1(n310), .A0N(vector_y[44]), .A1N(n310), .Y(
        n118) );
  OAI2BB2XL U307 ( .B0(n330), .B1(n309), .A0N(vector_y[52]), .A1N(n309), .Y(
        n126) );
  OAI2BB2XL U308 ( .B0(n330), .B1(n308), .A0N(vector_y[60]), .A1N(n308), .Y(
        n134) );
  OAI2BB2XL U309 ( .B0(n330), .B1(n307), .A0N(vector_y[68]), .A1N(n307), .Y(
        n142) );
  OAI2BB2XL U310 ( .B0(n330), .B1(n306), .A0N(vector_y[76]), .A1N(n306), .Y(
        n150) );
  OAI2BB2XL U311 ( .B0(n330), .B1(n305), .A0N(vector_y[84]), .A1N(n305), .Y(
        n158) );
  OAI2BB2XL U312 ( .B0(n330), .B1(n304), .A0N(vector_y[92]), .A1N(n304), .Y(
        n166) );
  OAI2BB2XL U313 ( .B0(n330), .B1(n303), .A0N(vector_y[100]), .A1N(n303), .Y(
        n174) );
  OAI2BB2XL U314 ( .B0(n330), .B1(n316), .A0N(vector_y[124]), .A1N(n316), .Y(
        n1980) );
  NAND2BX1 U315 ( .AN(n292), .B(n289), .Y(n2070) );
  CLKINVX1 U316 ( .A(n2070), .Y(n277) );
  NAND2BX1 U317 ( .AN(N9), .B(n289), .Y(n2080) );
  CLKINVX1 U318 ( .A(n2080), .Y(n276) );
  NAND2BX1 U319 ( .AN(n289), .B(n292), .Y(n2090) );
  CLKINVX1 U320 ( .A(n2090), .Y(n279) );
  OAI2BB2XL U321 ( .B0(n333), .B1(n315), .A0N(vector_y[1]), .A1N(n315), .Y(n75) );
  OAI2BB2XL U322 ( .B0(n333), .B1(n314), .A0N(vector_y[9]), .A1N(n314), .Y(n83) );
  OAI2BB2XL U323 ( .B0(n333), .B1(n313), .A0N(vector_y[17]), .A1N(n313), .Y(
        n91) );
  OAI2BB2XL U324 ( .B0(n333), .B1(n312), .A0N(vector_y[25]), .A1N(n312), .Y(
        n99) );
  OAI2BB2XL U325 ( .B0(n333), .B1(n311), .A0N(vector_y[33]), .A1N(n311), .Y(
        n107) );
  OAI2BB2XL U326 ( .B0(n333), .B1(n310), .A0N(vector_y[41]), .A1N(n310), .Y(
        n115) );
  OAI2BB2XL U327 ( .B0(n333), .B1(n309), .A0N(vector_y[49]), .A1N(n309), .Y(
        n123) );
  OAI2BB2XL U328 ( .B0(n333), .B1(n308), .A0N(vector_y[57]), .A1N(n308), .Y(
        n131) );
  OAI2BB2XL U329 ( .B0(n333), .B1(n307), .A0N(vector_y[65]), .A1N(n307), .Y(
        n139) );
  OAI2BB2XL U330 ( .B0(n333), .B1(n306), .A0N(vector_y[73]), .A1N(n306), .Y(
        n147) );
  OAI2BB2XL U331 ( .B0(n333), .B1(n305), .A0N(vector_y[81]), .A1N(n305), .Y(
        n155) );
  OAI2BB2XL U332 ( .B0(n333), .B1(n304), .A0N(vector_y[89]), .A1N(n304), .Y(
        n163) );
  OAI2BB2XL U333 ( .B0(n333), .B1(n303), .A0N(vector_y[97]), .A1N(n303), .Y(
        n171) );
  OAI2BB2XL U334 ( .B0(n333), .B1(n316), .A0N(vector_y[121]), .A1N(n316), .Y(
        n1950) );
  OAI2BB2XL U335 ( .B0(n302), .B1(n333), .A0N(vector_y[105]), .A1N(n302), .Y(
        n179) );
  OAI2BB2XL U336 ( .B0(n317), .B1(n333), .A0N(vector_y[113]), .A1N(n317), .Y(
        n187) );
  OAI2BB2XL U337 ( .B0(n302), .B1(n332), .A0N(vector_y[106]), .A1N(n302), .Y(
        n180) );
  OAI2BB2XL U338 ( .B0(n302), .B1(n331), .A0N(vector_y[107]), .A1N(n302), .Y(
        n181) );
  OAI2BB2XL U339 ( .B0(n317), .B1(n332), .A0N(vector_y[114]), .A1N(n317), .Y(
        n188) );
  OAI2BB2XL U340 ( .B0(n317), .B1(n331), .A0N(vector_y[115]), .A1N(n317), .Y(
        n189) );
  OAI2BB2XL U341 ( .B0(n332), .B1(n315), .A0N(vector_y[2]), .A1N(n315), .Y(n76) );
  OAI2BB2XL U342 ( .B0(n331), .B1(n315), .A0N(vector_y[3]), .A1N(n315), .Y(n77) );
  OAI2BB2XL U343 ( .B0(n332), .B1(n314), .A0N(vector_y[10]), .A1N(n314), .Y(
        n84) );
  OAI2BB2XL U344 ( .B0(n331), .B1(n314), .A0N(vector_y[11]), .A1N(n314), .Y(
        n85) );
  OAI2BB2XL U345 ( .B0(n332), .B1(n313), .A0N(vector_y[18]), .A1N(n313), .Y(
        n92) );
  OAI2BB2XL U346 ( .B0(n331), .B1(n313), .A0N(vector_y[19]), .A1N(n313), .Y(
        n93) );
  OAI2BB2XL U347 ( .B0(n332), .B1(n312), .A0N(vector_y[26]), .A1N(n312), .Y(
        n100) );
  OAI2BB2XL U348 ( .B0(n331), .B1(n312), .A0N(vector_y[27]), .A1N(n312), .Y(
        n101) );
  OAI2BB2XL U349 ( .B0(n332), .B1(n311), .A0N(vector_y[34]), .A1N(n311), .Y(
        n108) );
  OAI2BB2XL U350 ( .B0(n331), .B1(n311), .A0N(vector_y[35]), .A1N(n311), .Y(
        n109) );
  OAI2BB2XL U351 ( .B0(n332), .B1(n310), .A0N(vector_y[42]), .A1N(n310), .Y(
        n116) );
  OAI2BB2XL U352 ( .B0(n331), .B1(n310), .A0N(vector_y[43]), .A1N(n310), .Y(
        n117) );
  OAI2BB2XL U353 ( .B0(n332), .B1(n309), .A0N(vector_y[50]), .A1N(n309), .Y(
        n124) );
  OAI2BB2XL U354 ( .B0(n331), .B1(n309), .A0N(vector_y[51]), .A1N(n309), .Y(
        n125) );
  OAI2BB2XL U355 ( .B0(n332), .B1(n308), .A0N(vector_y[58]), .A1N(n308), .Y(
        n132) );
  OAI2BB2XL U356 ( .B0(n331), .B1(n308), .A0N(vector_y[59]), .A1N(n308), .Y(
        n133) );
  OAI2BB2XL U357 ( .B0(n332), .B1(n307), .A0N(vector_y[66]), .A1N(n307), .Y(
        n140) );
  OAI2BB2XL U358 ( .B0(n331), .B1(n307), .A0N(vector_y[67]), .A1N(n307), .Y(
        n141) );
  OAI2BB2XL U359 ( .B0(n332), .B1(n306), .A0N(vector_y[74]), .A1N(n306), .Y(
        n148) );
  OAI2BB2XL U360 ( .B0(n331), .B1(n306), .A0N(vector_y[75]), .A1N(n306), .Y(
        n149) );
  OAI2BB2XL U361 ( .B0(n332), .B1(n305), .A0N(vector_y[82]), .A1N(n305), .Y(
        n156) );
  OAI2BB2XL U362 ( .B0(n331), .B1(n305), .A0N(vector_y[83]), .A1N(n305), .Y(
        n157) );
  OAI2BB2XL U363 ( .B0(n332), .B1(n304), .A0N(vector_y[90]), .A1N(n304), .Y(
        n164) );
  OAI2BB2XL U364 ( .B0(n331), .B1(n304), .A0N(vector_y[91]), .A1N(n304), .Y(
        n165) );
  OAI2BB2XL U365 ( .B0(n332), .B1(n303), .A0N(vector_y[98]), .A1N(n303), .Y(
        n172) );
  OAI2BB2XL U366 ( .B0(n331), .B1(n303), .A0N(vector_y[99]), .A1N(n303), .Y(
        n173) );
  OAI2BB2XL U367 ( .B0(n332), .B1(n316), .A0N(vector_y[122]), .A1N(n316), .Y(
        n1960) );
  OAI2BB2XL U368 ( .B0(n331), .B1(n316), .A0N(vector_y[123]), .A1N(n316), .Y(
        n1970) );
  CLKBUFX3 U369 ( .A(n335), .Y(n301) );
  CLKINVX1 U370 ( .A(N242), .Y(n335) );
  OAI2BB2XL U371 ( .B0(n302), .B1(n301), .A0N(vector_y[104]), .A1N(n302), .Y(
        n178) );
  OAI2BB2XL U372 ( .B0(n317), .B1(n301), .A0N(vector_y[112]), .A1N(n317), .Y(
        n186) );
  OAI2BB2XL U373 ( .B0(n301), .B1(n315), .A0N(vector_y[0]), .A1N(n315), .Y(n74) );
  OAI2BB2XL U374 ( .B0(n301), .B1(n314), .A0N(vector_y[8]), .A1N(n314), .Y(n82) );
  OAI2BB2XL U375 ( .B0(n301), .B1(n313), .A0N(vector_y[16]), .A1N(n313), .Y(
        n90) );
  OAI2BB2XL U376 ( .B0(n301), .B1(n312), .A0N(vector_y[24]), .A1N(n312), .Y(
        n98) );
  OAI2BB2XL U377 ( .B0(n301), .B1(n311), .A0N(vector_y[32]), .A1N(n311), .Y(
        n106) );
  OAI2BB2XL U378 ( .B0(n301), .B1(n310), .A0N(vector_y[40]), .A1N(n310), .Y(
        n114) );
  OAI2BB2XL U379 ( .B0(n301), .B1(n309), .A0N(vector_y[48]), .A1N(n309), .Y(
        n122) );
  OAI2BB2XL U380 ( .B0(n301), .B1(n308), .A0N(vector_y[56]), .A1N(n308), .Y(
        n130) );
  OAI2BB2XL U381 ( .B0(n301), .B1(n307), .A0N(vector_y[64]), .A1N(n307), .Y(
        n138) );
  OAI2BB2XL U382 ( .B0(n301), .B1(n306), .A0N(vector_y[72]), .A1N(n306), .Y(
        n146) );
  OAI2BB2XL U383 ( .B0(n301), .B1(n305), .A0N(vector_y[80]), .A1N(n305), .Y(
        n154) );
  OAI2BB2XL U384 ( .B0(n301), .B1(n304), .A0N(vector_y[88]), .A1N(n304), .Y(
        n162) );
  OAI2BB2XL U385 ( .B0(n301), .B1(n303), .A0N(vector_y[96]), .A1N(n303), .Y(
        n170) );
  OAI2BB2XL U386 ( .B0(n301), .B1(n316), .A0N(vector_y[120]), .A1N(n316), .Y(
        n194) );
  NOR2X4 U387 ( .A(RST), .B(n73), .Y(finish) );
  NOR2BX2 U388 ( .AN(n73), .B(RST), .Y(n66) );
  AO22X2 U389 ( .A0(N10), .A1(finish), .B0(N228), .B1(n66), .Y(A[1]) );
  AO22X2 U390 ( .A0(N11), .A1(finish), .B0(N229), .B1(n66), .Y(A[2]) );
  AO22X2 U391 ( .A0(N12), .A1(finish), .B0(N230), .B1(n66), .Y(A[3]) );
  AO22X2 U392 ( .A0(N9), .A1(finish), .B0(N227), .B1(n66), .Y(A[0]) );
  NOR4X1 U393 ( .A(counter_r[4]), .B(counter_r[5]), .C(counter_r[6]), .D(
        counter_r[7]), .Y(n73) );
  NOR2BX1 U394 ( .AN(n66), .B(N12), .Y(n64) );
  AND2X2 U395 ( .A(n64), .B(N9), .Y(n56) );
  AND2X2 U396 ( .A(n72), .B(N9), .Y(n50) );
  AND2X2 U397 ( .A(n64), .B(n292), .Y(n54) );
  AND2X2 U398 ( .A(n72), .B(n292), .Y(n48) );
  AO22X1 U399 ( .A0(finish), .A1(counter_r[6]), .B0(N233), .B1(n51), .Y(n202)
         );
  AO22X1 U400 ( .A0(finish), .A1(counter_r[7]), .B0(N234), .B1(n51), .Y(n205)
         );
  AND2X2 U401 ( .A(n66), .B(N12), .Y(n72) );
  NOR2X1 U402 ( .A(finish), .B(RST), .Y(n51) );
  AO22X1 U403 ( .A0(finish), .A1(counter_r[4]), .B0(N231), .B1(n51), .Y(n204)
         );
  AO22X1 U404 ( .A0(finish), .A1(counter_r[5]), .B0(N232), .B1(n51), .Y(n203)
         );
  CLKINVX1 U405 ( .A(RST), .Y(n334) );
  AO22X1 U406 ( .A0(vector_b[72]), .A1(n295), .B0(vector_b[64]), .B1(n294), 
        .Y(n2100) );
  AOI221XL U407 ( .A0(vector_b[80]), .A1(n300), .B0(vector_b[88]), .B1(n298), 
        .C0(n2100), .Y(n2180) );
  AO22X1 U408 ( .A0(vector_b[104]), .A1(n295), .B0(vector_b[96]), .B1(n294), 
        .Y(n2110) );
  AOI221XL U409 ( .A0(vector_b[112]), .A1(n300), .B0(vector_b[120]), .B1(n298), 
        .C0(n2110), .Y(n2170) );
  AO22X1 U410 ( .A0(vector_b[8]), .A1(n295), .B0(vector_b[0]), .B1(n294), .Y(
        n2120) );
  AOI221XL U411 ( .A0(vector_b[16]), .A1(n300), .B0(vector_b[24]), .B1(n298), 
        .C0(n2120), .Y(n2150) );
  AO22X1 U412 ( .A0(vector_b[40]), .A1(n295), .B0(vector_b[32]), .B1(n294), 
        .Y(n2130) );
  AOI221XL U413 ( .A0(vector_b[48]), .A1(n300), .B0(vector_b[56]), .B1(n298), 
        .C0(n2130), .Y(n2140) );
  OAI221XL U414 ( .A0(n287), .A1(n2180), .B0(n285), .B1(n2170), .C0(n2160), 
        .Y(N242) );
  AO22X1 U415 ( .A0(vector_b[73]), .A1(n277), .B0(vector_b[65]), .B1(n294), 
        .Y(n2190) );
  AOI221XL U416 ( .A0(vector_b[81]), .A1(n300), .B0(vector_b[89]), .B1(n298), 
        .C0(n2190), .Y(n2270) );
  AO22X1 U417 ( .A0(vector_b[105]), .A1(n277), .B0(vector_b[97]), .B1(n294), 
        .Y(n2200) );
  AOI221XL U418 ( .A0(vector_b[113]), .A1(n300), .B0(vector_b[121]), .B1(n298), 
        .C0(n2200), .Y(n226) );
  AO22X1 U419 ( .A0(vector_b[9]), .A1(n295), .B0(vector_b[1]), .B1(n294), .Y(
        n2210) );
  AOI221XL U420 ( .A0(vector_b[17]), .A1(n300), .B0(vector_b[25]), .B1(n298), 
        .C0(n2210), .Y(n224) );
  AO22X1 U421 ( .A0(vector_b[41]), .A1(n295), .B0(vector_b[33]), .B1(n294), 
        .Y(n2220) );
  AOI221XL U422 ( .A0(vector_b[49]), .A1(n300), .B0(vector_b[57]), .B1(n298), 
        .C0(n2220), .Y(n223) );
  OAI221XL U423 ( .A0(n287), .A1(n2270), .B0(n285), .B1(n226), .C0(n225), .Y(
        N241) );
  AO22X1 U424 ( .A0(vector_b[74]), .A1(n277), .B0(vector_b[66]), .B1(n294), 
        .Y(n2280) );
  AOI221XL U425 ( .A0(vector_b[82]), .A1(n300), .B0(vector_b[90]), .B1(n298), 
        .C0(n2280), .Y(n2360) );
  AO22X1 U426 ( .A0(vector_b[106]), .A1(n277), .B0(vector_b[98]), .B1(n294), 
        .Y(n2290) );
  AOI221XL U427 ( .A0(vector_b[114]), .A1(n300), .B0(vector_b[122]), .B1(n298), 
        .C0(n2290), .Y(n2350) );
  AO22X1 U428 ( .A0(vector_b[10]), .A1(n277), .B0(vector_b[2]), .B1(n294), .Y(
        n2300) );
  AOI221XL U429 ( .A0(vector_b[18]), .A1(n300), .B0(vector_b[26]), .B1(n298), 
        .C0(n2300), .Y(n2330) );
  AO22X1 U430 ( .A0(vector_b[42]), .A1(n277), .B0(vector_b[34]), .B1(n294), 
        .Y(n2310) );
  AOI221XL U431 ( .A0(vector_b[50]), .A1(n300), .B0(vector_b[58]), .B1(n298), 
        .C0(n2310), .Y(n2320) );
  OAI221XL U432 ( .A0(n287), .A1(n2360), .B0(n285), .B1(n2350), .C0(n2340), 
        .Y(N240) );
  AO22X1 U433 ( .A0(vector_b[75]), .A1(n296), .B0(vector_b[67]), .B1(n293), 
        .Y(n2370) );
  AOI221XL U434 ( .A0(vector_b[83]), .A1(n299), .B0(vector_b[91]), .B1(n297), 
        .C0(n2370), .Y(n2450) );
  AO22X1 U435 ( .A0(vector_b[107]), .A1(n296), .B0(vector_b[99]), .B1(n293), 
        .Y(n2380) );
  AOI221XL U436 ( .A0(vector_b[115]), .A1(n299), .B0(vector_b[123]), .B1(n297), 
        .C0(n2380), .Y(n2440) );
  AO22X1 U437 ( .A0(vector_b[11]), .A1(n296), .B0(vector_b[3]), .B1(n293), .Y(
        n2390) );
  AOI221XL U438 ( .A0(vector_b[19]), .A1(n299), .B0(vector_b[27]), .B1(n297), 
        .C0(n2390), .Y(n2420) );
  AO22X1 U439 ( .A0(vector_b[43]), .A1(n296), .B0(vector_b[35]), .B1(n293), 
        .Y(n2400) );
  AOI221XL U440 ( .A0(vector_b[51]), .A1(n300), .B0(vector_b[59]), .B1(n298), 
        .C0(n2400), .Y(n2410) );
  OAI221XL U441 ( .A0(n287), .A1(n2450), .B0(n285), .B1(n2440), .C0(n243), .Y(
        N239) );
  AO22X1 U442 ( .A0(vector_b[76]), .A1(n296), .B0(vector_b[68]), .B1(n293), 
        .Y(n2460) );
  AOI221XL U443 ( .A0(vector_b[84]), .A1(n299), .B0(vector_b[92]), .B1(n297), 
        .C0(n2460), .Y(n254) );
  AO22X1 U444 ( .A0(vector_b[108]), .A1(n296), .B0(vector_b[100]), .B1(n293), 
        .Y(n2470) );
  AOI221XL U445 ( .A0(vector_b[116]), .A1(n299), .B0(vector_b[124]), .B1(n297), 
        .C0(n2470), .Y(n253) );
  AO22X1 U446 ( .A0(vector_b[12]), .A1(n296), .B0(vector_b[4]), .B1(n293), .Y(
        n2480) );
  AOI221XL U447 ( .A0(vector_b[20]), .A1(n279), .B0(vector_b[28]), .B1(n297), 
        .C0(n2480), .Y(n251) );
  AO22X1 U448 ( .A0(vector_b[44]), .A1(n296), .B0(vector_b[36]), .B1(n293), 
        .Y(n2490) );
  AOI221XL U449 ( .A0(vector_b[52]), .A1(n299), .B0(vector_b[60]), .B1(n297), 
        .C0(n2490), .Y(n2500) );
  OAI221XL U450 ( .A0(n287), .A1(n254), .B0(n285), .B1(n253), .C0(n252), .Y(
        N238) );
  AO22X1 U451 ( .A0(vector_b[77]), .A1(n296), .B0(vector_b[69]), .B1(n293), 
        .Y(n255) );
  AOI221XL U452 ( .A0(vector_b[85]), .A1(n299), .B0(vector_b[93]), .B1(n297), 
        .C0(n255), .Y(n263) );
  AO22X1 U453 ( .A0(vector_b[109]), .A1(n296), .B0(vector_b[101]), .B1(n293), 
        .Y(n256) );
  AOI221XL U454 ( .A0(vector_b[117]), .A1(n299), .B0(vector_b[125]), .B1(n297), 
        .C0(n256), .Y(n262) );
  AO22X1 U455 ( .A0(vector_b[13]), .A1(n296), .B0(vector_b[5]), .B1(n293), .Y(
        n257) );
  AOI221XL U456 ( .A0(vector_b[21]), .A1(n299), .B0(vector_b[29]), .B1(n297), 
        .C0(n257), .Y(n260) );
  AO22X1 U457 ( .A0(vector_b[45]), .A1(n296), .B0(vector_b[37]), .B1(n293), 
        .Y(n258) );
  AOI221XL U458 ( .A0(vector_b[53]), .A1(n299), .B0(vector_b[61]), .B1(n297), 
        .C0(n258), .Y(n259) );
  OAI221XL U459 ( .A0(n287), .A1(n263), .B0(n285), .B1(n262), .C0(n261), .Y(
        N237) );
  AO22X1 U460 ( .A0(vector_b[78]), .A1(n295), .B0(vector_b[70]), .B1(n276), 
        .Y(n264) );
  AOI221XL U461 ( .A0(vector_b[86]), .A1(n299), .B0(vector_b[94]), .B1(n297), 
        .C0(n264), .Y(n272) );
  AO22X1 U462 ( .A0(vector_b[110]), .A1(n295), .B0(vector_b[102]), .B1(n276), 
        .Y(n265) );
  AOI221XL U463 ( .A0(vector_b[118]), .A1(n279), .B0(vector_b[126]), .B1(n297), 
        .C0(n265), .Y(n271) );
  AO22X1 U464 ( .A0(vector_b[14]), .A1(n295), .B0(vector_b[6]), .B1(n294), .Y(
        n266) );
  AOI221XL U465 ( .A0(vector_b[22]), .A1(n300), .B0(vector_b[30]), .B1(n297), 
        .C0(n266), .Y(n269) );
  AO22X1 U466 ( .A0(vector_b[46]), .A1(n296), .B0(vector_b[38]), .B1(n293), 
        .Y(n267) );
  AOI221XL U467 ( .A0(vector_b[54]), .A1(n299), .B0(vector_b[62]), .B1(n297), 
        .C0(n267), .Y(n268) );
  OAI221XL U468 ( .A0(n287), .A1(n272), .B0(n285), .B1(n271), .C0(n270), .Y(
        N236) );
  AO22X1 U469 ( .A0(vector_b[79]), .A1(n295), .B0(vector_b[71]), .B1(n276), 
        .Y(n273) );
  AOI221XL U470 ( .A0(vector_b[87]), .A1(n279), .B0(vector_b[95]), .B1(n2060), 
        .C0(n273), .Y(n288) );
  AO22X1 U471 ( .A0(vector_b[111]), .A1(n295), .B0(vector_b[103]), .B1(n276), 
        .Y(n274) );
  AOI221XL U472 ( .A0(vector_b[119]), .A1(n279), .B0(vector_b[127]), .B1(n2060), .C0(n274), .Y(n286) );
  AO22X1 U473 ( .A0(vector_b[15]), .A1(n295), .B0(vector_b[7]), .B1(n276), .Y(
        n275) );
  AOI221XL U474 ( .A0(vector_b[23]), .A1(n279), .B0(vector_b[31]), .B1(n2060), 
        .C0(n275), .Y(n283) );
  AO22X1 U475 ( .A0(vector_b[47]), .A1(n295), .B0(vector_b[39]), .B1(n276), 
        .Y(n278) );
  AOI221XL U476 ( .A0(vector_b[55]), .A1(n279), .B0(vector_b[63]), .B1(n2060), 
        .C0(n278), .Y(n281) );
  OAI221XL U477 ( .A0(n288), .A1(n287), .B0(n286), .B1(n285), .C0(n284), .Y(
        N235) );
endmodule

