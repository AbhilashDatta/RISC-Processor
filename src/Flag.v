`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:40 11/06/2021 
// Design Name: 
// Module Name:    Flag 
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
module Flag( input signed [31:0] sum, input[2:0] setflag, input carry, output reg flag);
	reg hasCarry;
	always@(setflag or sum or carry) begin
		if(setflag == 3'b001) begin
			flag = 1;
		end
		else if(sum < 0 && setflag == 3'b010) begin
			flag = 1;
		end
		else if(setflag == 3'b010) begin
			flag = 0;
		end
		else if(sum == 0 && setflag == 3'b011) begin
			flag = 1;
		end
		else if(setflag == 3'b011) begin
			flag = 0;
		end
		else if(sum != 0 && setflag == 3'b100) begin
			flag = 1;
		end
		else if(setflag == 3'b100) begin
			flag = 0;
		end
		else if(hasCarry == 1 && setflag == 3'b101) begin
			flag = 1;
		end
		else if(setflag == 3'b101) begin
			flag = 0;
		end
		else if(hasCarry == 0 && setflag == 3'b110) begin
			flag = 1;
		end
		else if(setflag == 3'b110) begin
			flag = 0;
		end
		else if(setflag ==3'b111) begin
			flag = 0;
			hasCarry = carry;
		end
		else begin
			flag = 0;
		end
	end

endmodule
