`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:14 10/29/2021 
// Design Name: 
// Module Name:    SignExtension 
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
module SignExtension(input[15:0] in, output reg[31:0] out);
	always@(in) begin
		if(in[15]==1'b0) begin
			out = 32'b0;
			out = out + in;
		end
		else begin
			out[31:16] = 16'b1111111111111111;
			out = out + in;
		end
	end

endmodule
