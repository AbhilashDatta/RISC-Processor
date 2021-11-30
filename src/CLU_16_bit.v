`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:35 08/27/2021 
// Design Name: 
// Module Name:    CLU_16_bit 
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
`include "Augmented_Carry_Lookahead_Adder.v"
`include "Lookahead_Carry_Unit.v"
module CLU_16_bit(sum, carry, in1, in2, carryIn);

output[15:0] sum;
output carry;

input[15:0] in1, in2;
input carryIn;
wire[3:0] prop;
wire[3:0] gen;
wire[4:0] C;

// 4 bit Carry lookahead adders
assign C[0] = carryIn;
Augmented_Carry_Lookahead_Adder cla1(.sum(sum[3:0]), .carry(), .prop(prop[0]), .gen(gen[0]), .in1(in1[3:0]), .in2(in2[3:0]), .carry0(C[0]));
Augmented_Carry_Lookahead_Adder cla2(.sum(sum[7:4]), .carry(), .prop(prop[1]), .gen(gen[1]), .in1(in1[7:4]), .in2(in2[7:4]), .carry0(C[1]));
Augmented_Carry_Lookahead_Adder cla3(.sum(sum[11:8]), .carry(), .prop(prop[2]), .gen(gen[2]), .in1(in1[11:8]), .in2(in2[11:8]), .carry0(C[2]));
Augmented_Carry_Lookahead_Adder cla4(.sum(sum[15:12]), .carry(), .prop(prop[3]), .gen(gen[3]), .in1(in1[15:12]), .in2(in2[15:12]), .carry0(C[3]));
// Using 16 bit lookahead unit
Lookahead_Carry_Unit lcu(.prop(), .gen(), .C(C[4:1]), .P(prop), .G(gen), .carry0(C[0]));
assign carry = C[4];

endmodule