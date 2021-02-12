// 16 bit CPU Modules

//---------------------------------
module yAdder1(z, cout, a, b, cin);
  
  // outputs and inputs
  output z, cout;
  input a, b, cin;
  
  // interconnects
  wire outAndL, outAndR, outXorL;
  
  // logic for the Adder
  xor left_xor(outXorL, a, b);
  xor right_xor(z, cin, outXorL);
  and left_and(outAndL, a, b);
  and right_and(outAndR, outXorL, cin);
  or my_or(cout, outAndR, outAndL);
  
endmodule
//---------------------------------

//---------------------------------
// 16 bit adder
module yAdder(z, cout, a, b, cin);
  
  // outputs
  output [15:0] z;
  output cout;
  
  // inputs
  input [15:0] a, b;
  input cin;
  
  // interconnects
  wire[15:0] in, out;
  
  // yAdder1 is defined in yAdder1.v
  yAdder1 mine[15:0](z, out, a, b, in);
  
  assign in[0] = cin;
  assign in[15:1] = out[14:0];
  
endmodule
//---------------------------------

//---------------------------------
module yMux1(z,a,b,c);
	output z;
	input a, b, c;
  	wire notC, upper, lower;
  	
  	// gates and interconnections for MUX
  not my_not(notC, c);
  and upperAnd(upper, a, notC);
  and lowerAnd(lower, c, b);
  or my_or(z, upper, lower);

endmodule

//---------------------------------

//---------------------------------
module yMux(z, a, b, c);
  
  
  
	parameter SIZE = 2;
  	output [SIZE - 1:0] z;
  	input	[SIZE - 1:0] a, b;
  	input  [0:0] c;
  
  // Assigns signals to the two single-bit muxes
  yMux1 mine[SIZE - 1:0](z, a, b, c);
  
endmodule
//---------------------------------

//---------------------------------
module yMux4to1(z, a0, a1, a2, a3, c);
  
  parameter SIZE = 2;
  output [SIZE - 1:0] z;
  input [SIZE - 1:0] a0, a1, a2, a3;
  input [1:0] c;
  wire [SIZE - 1:0] zLo, zHi;
  
  yMux #(SIZE) lo(zLo, a0, a1, c[0]);
  yMux #(SIZE) hi(zHi, a2, a3, c[0]);
  yMux #(SIZE) final(z, zLo, zHi, c[1]);
  
endmodule
//---------------------------------

//---------------------------------
// 16 bit Arith
module yArith(z, cout, a, b, ctrl);
  
    // add if ctrl=0, subtract if ctrl=1
  	output [15:0] z;
    output cout;
  
  	input [15:0] a, b;
    input ctrl;
  
  	wire[15:0] notB, tmp;
    wire cin;
  
  	not myNot[15:0](notB, b);
  	yMux #(16) mux(tmp, b, notB, ctrl);
  
    assign cin = ctrl;
    yAdder add(z, cout, a, tmp, cin);
  
endmodule
//---------------------------------

//---------------------------------
// 16 bit ALU
module yAlu(z, zero, a, b, op);
  
  input [15:0] a, b;
  input [2:0] op;
  
  output [15:0] z;
  output zero;
  
  wire [15:0] zAnd, zOr, zArith, slt;
  wire condition, cout;
  
  assign slt [15:1] = 0;
  xor (condition, a[15], b[15]);
  yMux #(1) sltMux(slt[0], zArith[15], a[15], condition);
  
  and myAnd[15:0](zAnd, a, b);
  or myOr[15:0](zOr, a, b);
  
  yArith myArith(zArith, cout, a, b, op[2]);
  yMux4to1 #(16) myMux(z, zAnd, zOr, zArith, slt, op[1:0]);
  
  wire z1;
  or or1[0:0] (z1, z[15], z[14], z[13], z[12], z[11], z[10], z[9], z[8], z[7], z[6], z[5], z[4], z[3], z[2], z[1], z[0]);
  not last(zero, z1);
  
endmodule
