`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:34 11/10/2021 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(ReadData1, ReadData2, reg1, reg2, writeData, RegWrite, IsLW, Clk, Reset);

	output reg[31:0] ReadData1, ReadData2;
	input[4:0] reg1, reg2;
	input IsLW;
	input[31:0] writeData;
	input RegWrite, Clk, Reset;

	reg[31:0] registers[31:0];
	integer i;
	
	always@(posedge Clk) begin
		if(Reset) begin
			for(i=0;i<32;i=i+1) begin
				registers[i] <= 32'b0;
			end
		end
		else begin
			if(RegWrite && !IsLW) begin
				registers[reg1] <= writeData; 
			end
			else if(RegWrite && IsLW) begin
				registers[reg2] <= writeData;
			end
		end
	end
	
	always@(*) begin
		ReadData1 = registers[reg1];
		ReadData2 = registers[reg2];
	end

endmodule
