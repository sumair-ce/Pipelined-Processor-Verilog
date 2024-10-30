`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:54:59 03/09/2024 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(clk,rst,BranchSignal,JumpSignal,Jump_addr,PC,PCsrc,PCsrc2,branch_address);
input clk,rst,BranchSignal,JumpSignal,PCsrc,PCsrc2;
input [31:0]branch_address;
input [31:0] Jump_addr;
output reg [31:0] PC;


reg [31:0]temp;
reg allowMe ,allowMe2;

always@(*) begin allowMe=BranchSignal && PCsrc; end
always@(*) begin allowMe2=BranchSignal && PCsrc2; end



always @(posedge clk or posedge rst)
begin
if(rst) begin PC<=0; end
else begin
	if(JumpSignal) begin
		PC<=PC+Jump_addr; end
	else begin
		if(allowMe==1) begin PC<=branch_address; end
		else if (allowMe2==1) begin  PC<=PC+temp; end
		else begin PC<=PC+1; end
	end
end end

endmodule
