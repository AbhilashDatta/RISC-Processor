`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:32 08/27/2021 
// Design Name: 
// Module Name:    Lookahead_Carry_Unit 
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
module Lookahead_Carry_Unit(prop, gen, C, P, G, carry0);
	output prop, gen;
	output[3:0] C;
	input[3:0] P, G;
	input carry0;
	// Using formulas to calculate carry lookahead values
	assign C[0] = G[0] | (P[0] & carry0);
	assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & carry0);
	assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & carry0);
	assign C[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & carry0);
	// Calculating propogation and generation values
	assign prop = P[0] & P[1] & P[2] & P[3];
	assign gen = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);

endmodule