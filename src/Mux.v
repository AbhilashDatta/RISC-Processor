`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:29 11/06/2021 
// Design Name: 
// Module Name:    Mux 
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
module Mux(out, a, b, sel);

output[31:0] out;
input[31:0] a,b;
input sel;

reg[31:0] out;

always@(sel or a or b)begin
	if(sel == 1)begin
		out = a;
	end
	else begin
		out = b;
	end
end

endmodule
