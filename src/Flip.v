`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:00:19 11/09/2021 
// Design Name: 
// Module Name:    Flip 
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
module Flip(out, in);

output[31:0] out;
input[31:0] in;

assign out = in ^ 32'b11111111111111111111111111111111;

endmodule
