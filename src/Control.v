`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:59:56 11/06/2021 
// Design Name: 
// Module Name:    Control 
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
module Control( input[7:0] OpCode, output reg Branch, output reg[7:0] ALUop, output reg ALUsrc, output reg BLop, output reg MemWrite, output reg MemToReg, output reg RegWrite);
	always@(OpCode) begin
		// Add
		if(OpCode == 8'b00000000) begin
			Branch = 0;
			ALUop = 8'b00000111;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// Addi
		else if(OpCode == 8'b00100000) begin
			Branch = 0;
			ALUop = 8'b00000111;
			ALUsrc = 1;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// Comp
		else if(OpCode == 8'b00000001) begin
			Branch = 0;
			ALUop = 8'b01000000;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// Compi
		else if(OpCode == 8'b00100001) begin
			Branch = 0;
			ALUop = 8'b01000000;
			ALUsrc = 1;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// And
		else if(OpCode == 8'b00000010) begin
			Branch = 0;
			ALUop = 8'b00001000;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// Xor
		else if(OpCode == 8'b00000011) begin
			Branch = 0;
			ALUop = 8'b00010000;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// shllv
		else if(OpCode == 8'b00000100) begin
			Branch = 0;
			ALUop = 8'b00111000;
			ALUsrc = 1;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// shrlv
		else if(OpCode == 8'b00000101) begin
			Branch = 0;
			ALUop = 8'b00011000;
			ALUsrc = 1;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// shrav
		else if(OpCode == 8'b00000110) begin
			Branch = 0;
			ALUop = 8'b10011000;
			ALUsrc = 1;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// shll
		else if(OpCode == 8'b00100010) begin
			Branch = 0;
			ALUop = 8'b00111000;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// shrl
		else if(OpCode == 8'b00100011) begin
			Branch = 0;
			ALUop = 8'b00011000;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// shra
		else if(OpCode == 8'b00100100) begin
			Branch = 0;
			ALUop = 8'b10011000;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// lw
		else if(OpCode == 8'b01000000) begin
			Branch = 0;
			ALUop = 8'b00000000;
			ALUsrc = 1;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 1;
			RegWrite = 1;
		end
		// sw
		else if(OpCode == 8'b01000001) begin
			Branch = 0;
			ALUop = 8'b00000000;
			ALUsrc = 1;
			BLop = 0;
			MemWrite = 1;
			MemToReg = 0;
			RegWrite = 0;
		end
		// b
		else if(OpCode == 8'b01100000) begin
			Branch = 1;
			ALUop = 8'b00000001;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 0;
		end
		// bl
		else if(OpCode == 8'b01100001) begin
			Branch = 1;
			ALUop = 8'b00000001;
			ALUsrc = 0;
			BLop = 1;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 1;
		end
		// bcy
		else if(OpCode == 8'b01100010) begin
			Branch = 1;
			ALUop = 8'b00000101;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 0;
		end
		// bncy
		else if(OpCode == 8'b01100011) begin
			Branch = 1;
			ALUop = 8'b00000110;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 0;
		end
		// bltz
		else if(OpCode == 8'b10000000) begin
			Branch = 1;
			ALUop = 8'b00000010;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 0;
		end
		// bz
		else if(OpCode == 8'b10000001) begin
			Branch = 1;
			ALUop = 8'b00000011;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 0;
		end
		// bnz
		else if(OpCode == 8'b10000010) begin
			Branch = 1;
			ALUop = 8'b00000100;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 0;
		end
		// br
		else if(OpCode == 8'b10100000) begin
			Branch = 1;
			ALUop = 8'b00000001;
			ALUsrc = 0;
			BLop = 0;
			MemWrite = 0;
			MemToReg = 0;
			RegWrite = 0;
		end
	end

endmodule
