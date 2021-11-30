`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:15 08/27/2021 
// Design Name: 
// Module Name:    Augmented_Carry_Lookahead_Adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Augmented_Carry_Lookahead_Adder(sum, carry, prop, gen, in1, in2, carry0);

output[3:0] sum;
output carry, prop, gen;
input[3:0] in1, in2;
input carry0;

wire[3:0] P, G;
wire[4:0] C;

// Calculating propogation values
assign P[0] = in1[0] ^ in2[0];
assign P[1] = in1[1] ^ in2[1];
assign P[2] = in1[2] ^ in2[2];
assign P[3] = in1[3] ^ in2[3];

// Calculating Generation values
assign G[0] = in1[0] & in2[0];
assign G[1] = in1[1] & in2[1];
assign G[2] = in1[2] & in2[2];
assign G[3] = in1[3] & in2[3];

// Calculating lookahead carry values
assign C[0] = carry0;
assign C[1] = G[0] | (C[0] & P[0]);
assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

// Calculating sum values
assign sum[0] = P[0] ^ C[0];
assign sum[1] = P[1] ^ C[1];
assign sum[2] = P[2] ^ C[2];
assign sum[3] = P[3] ^ C[3];

// Calculating carry values
assign carry = C[4];
// Calculating net propogation value
assign prop = P[0] & P[1] & P[2] & P[3];
// Calculating net generation value
assign gen = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);

endmodule