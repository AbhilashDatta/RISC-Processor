`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:12 11/06/2021 
// Design Name: 
// Module Name:    Multiplexer_4_input 
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
module Multiplexer_4_input(out, sumOut, andOut, orOut, shiftOut, sel);

output[31:0] out;
input[31:0] sumOut, andOut, orOut, shiftOut;
input[1:0] sel;

reg[31:0] out;
parameter sum_ = 2'b00, and_ = 2'b01, or_ = 2'b10, shift_ = 2'b11;  

always@(sel or sumOut or andOut or orOut or shiftOut) begin
	if(sel == sum_) begin
		out = sumOut;
	end
	else if(sel == and_) begin
		out = andOut;
	end
	else if(sel == or_) begin
		out = orOut;
	end
	else begin
		out = shiftOut;
	end
end


endmodule
