`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:58 09/28/2021 
// Design Name: 
// Module Name:    FlipFlop 
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

module ProgramCounter(output reg[31:0] State, input[31:0] Ip, input Reset, input Clk);

always@(posedge Clk)
begin
	if(Reset)
		State <= 0;
	else
		State <= Ip;
end

endmodule
