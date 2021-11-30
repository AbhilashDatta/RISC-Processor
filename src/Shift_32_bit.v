`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:52 11/06/2021 
// Design Name: 
// Module Name:    Shift_32_bit 
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
module Shift_32_bit(out, in, shiftAmt, LeftOrRight, isArith);

output[31:0] out;
input[31:0] in, shiftAmt;
input LeftOrRight, isArith;

reg[31:0] layer1, layer2, layer3, layer4, out;

integer i;

always@(in or shiftAmt or LeftOrRight or isArith) begin
	if(shiftAmt >= 32)begin
		if(!LeftOrRight && isArith)begin
			if(in[31]==0)begin
				out = 32'b0;
			end
			else begin
				out = 32'b11111111111111111111111111111111;
			end
		end
		else begin
			out = 32'b0;
		end
	end
	else begin
		if(LeftOrRight==1)begin
			if(shiftAmt[4] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i<16)begin
						layer1[i] = 0;
					end
					else begin
						layer1[i] = in[i-16];
					end
				end
			end
			else begin
				layer1 = in;
			end
			
			if(shiftAmt[3] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i<8)begin
						layer2[i] = 0;
					end
					else begin
						layer2[i] = layer1[i-8];
					end
				end
			end
			else begin
				layer2 = layer1;
			end
			
			if(shiftAmt[2] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i<4)begin
						layer3[i] = 0;
					end
					else begin
						layer3[i] = layer2[i-4];
					end
				end
			end
			else begin
				layer3 = layer2;
			end
			
			if(shiftAmt[1] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i<2)begin
						layer4[i] = 0;
					end
					else begin
						layer4[i] = layer3[i-2];
					end
				end
			end
			else begin
				layer4 = layer3;
			end
			
			if(shiftAmt[0] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i<1)begin
						out[i] = 0;
					end
					else begin
						out[i] = layer4[i-1];
					end
				end
			end
			else begin
				out = layer4;
			end
		end
		else if(isArith == 0 || in[31]==0)begin
			if(shiftAmt[4] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i > 15)begin
						layer1[i] = 0;
					end
					else begin
						layer1[i] = in[i+16];
					end
				end
			end
			else begin
				layer1 = in;
			end
			
			if(shiftAmt[3] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i>23)begin
						layer2[i] = 0;
					end
					else begin
						layer2[i] = layer1[i+8];
					end
				end
			end
			else begin
				layer2 = layer1;
			end
			
			if(shiftAmt[2] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i>27)begin
						layer3[i] = 0;
					end
					else begin
						layer3[i] = layer2[i+4];
					end
				end
			end
			else begin
				layer3 = layer2;
			end
			
			if(shiftAmt[1] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i>29)begin
						layer4[i] = 0;
					end
					else begin
						layer4[i] = layer3[i+2];
					end
				end
			end
			else begin
				layer4 = layer3;
			end
			
			if(shiftAmt[0] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i>30)begin
						out[i] = 0;
					end
					else begin
						out[i] = layer4[i+1];
					end
				end
			end
			else begin
				out = layer4;
			end
		end
		else if(isArith == 1)begin
			if(shiftAmt[4] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i > 15)begin
						layer1[i] = 1;
					end
					else begin
						layer1[i] = in[i+16];
					end
				end
			end
			else begin
				layer1 = in;
			end
			
			if(shiftAmt[3] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i>23)begin
						layer2[i] = 1;
					end
					else begin
						layer2[i] = layer1[i+8];
					end
				end
			end
			else begin
				layer2 = layer1;
			end
			
			if(shiftAmt[2] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i>27)begin
						layer3[i] = 1;
					end
					else begin
						layer3[i] = layer2[i+4];
					end
				end
			end
			else begin
				layer3 = layer2;
			end
			
			if(shiftAmt[1] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i>29)begin
						layer4[i] = 1;
					end
					else begin
						layer4[i] = layer3[i+2];
					end
				end
			end
			else begin
				layer4 = layer3;
			end
			
			if(shiftAmt[0] == 1)begin
				for(i=0;i<=31;i=i+1)begin
					if(i>30)begin
						out[i] = 1;
					end
					else begin
						out[i] = layer4[i+1];
					end
				end
			end
			else begin
				out = layer4;
			end
		end
	end
end


endmodule
