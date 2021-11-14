`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:34 11/07/2021 
// Design Name: 
// Module Name:    ALUControl 
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
module ALUControl(input[7:0] ALUop, output reg isArith, isTwoC, LeftOrRight, output reg[1:0] Operation, output reg[2:0] SetFlag);
	
	always@(ALUop) begin
		isArith = ALUop[7];
		isTwoC = ALUop[6];
		LeftOrRight = ALUop[5];
		Operation = ALUop[4:3];
		SetFlag = ALUop[2:0];
	end

endmodule
