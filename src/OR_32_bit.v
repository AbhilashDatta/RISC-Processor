`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:26 11/06/2021 
// Design Name: 
// Module Name:    OR_32_bit 
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
module OR_32_bit(out, in1, in2);

output[31:0] out;
input[31:0] in1, in2;

assign out = in1 | in2;

endmodule
