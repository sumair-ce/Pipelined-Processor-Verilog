`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:01:00 05/19/2024 
// Design Name: 
// Module Name:    BranchALU 
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

//////////////////////////////////////////////////////////////////////////////////
module BranchALU(branchadd, PC, branchadd_out);
input [31:0] branchadd, PC;
output reg [31:0] branchadd_out;

always@(*) begin branchadd_out=PC + branchadd; end


endmodule
