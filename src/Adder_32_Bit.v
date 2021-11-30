`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:25 11/06/2021 
// Design Name: 
// Module Name:    Adder_32_Bit 
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
module Adder_32_Bit(sum, carry, input1, input2, carryIn);
	output[31:0] sum;
	output carry;
	
	input[31:0] input1, input2;
	input carryIn;
	wire carry1;
	CLU_16_bit add1(.sum(sum[15:0]), .carry(carry1), .in1(input1[15:0]), .in2(input2[15:0]), .carryIn(carryIn));
	CLU_16_bit add2(.sum(sum[31:16]), .carry(carry), .in1(input1[31:16]), .in2(input2[31:16]), .carryIn(carry1));


endmodule
