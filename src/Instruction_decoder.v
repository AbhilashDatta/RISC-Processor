`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:43 11/09/2021 
// Design Name: 
// Module Name:    Instruction_decoder 
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
module Instruction_decoder(opcode, reg1, reg2, label, immediate, inp, rsVal);
	output reg[7:0] opcode;
	output reg[4:0] reg1, reg2;
	output reg[31:0] label;
	output reg[15:0] immediate;
	
	input[31:0] inp, rsVal;
	
	always@(inp) begin
		if(inp[31:29] == 3'b000)  begin
			reg1 = inp[28:24];
			reg2 = inp[23:19];
			label = 32'b0;
			immediate = 16'b0;
			opcode = 8'b0;
			opcode[3:0] = inp[18:15];
		end
		else if(inp[31:29] == 3'b001) begin
			reg1 = inp[28:24];
			reg2 = 0;
			label = 32'b0;
			immediate = inp[15:0];
			opcode = 8'b0;
			opcode[2:0] = inp[18:16];
			opcode[7:5] = inp[31:29];
		end
		else if(inp[31:29] == 3'b010) begin
			reg2 = inp[28:24];
			reg1 = inp[23:19];
			label = 32'b0;
			immediate = inp[15:0];
			opcode = 8'b0;
			opcode[2:0] = inp[18:16];
			opcode[7:5] = inp[31:29];
		end
		else if(inp[31:29] == 3'b011) begin
			reg1 = 5'b11111;
			reg2 = 0;
			label = inp[28:3];
			immediate = 16'b0;
			opcode = 8'b0;
			opcode[2:0] = inp[2:0];
			opcode[7:5] = inp[31:29];
		end
		else if(inp[31:29] == 3'b100) begin
			reg1 = inp[28:24];
			reg2 = 0;
			label = inp[21:0];
			immediate = 16'b0;
			opcode = 8'b0;
			opcode[2:0] = inp[23:22];
			opcode[7:5] = inp[31:29];
		end
		else if(inp[31:29] == 3'b101) begin
			reg1 = inp[28:24];
			reg2 = 0;
			label = rsVal;
			immediate = 16'b0;
			opcode = 8'b0;
			opcode[2:0] = inp[18:16];
			opcode[7:5] = inp[31:29];
		end
	end

endmodule
