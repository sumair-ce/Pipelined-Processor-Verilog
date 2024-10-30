`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:36 03/05/2024 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(clk,PC,out_instruction);
input [31:0] PC;
input clk;
output reg [31:0] out_instruction;
reg [31:0] instruc_mem [20:0];

initial begin
$readmemb("instmem.txt", instruc_mem);
end

/*
always @(posedge clk)
case(PC)
32'd0: out_instruction=instruc_mem[0];
32'd1: out_instruction=instruc_mem[1];
32'd2: out_instruction=instruc_mem[2];
32'd3: out_instruction=instruc_mem[3];
32'd4: out_instruction=instruc_mem[4];
32'd5: out_instruction=instruc_mem[5];
32'd6: out_instruction=instruc_mem[6];
32'd7: out_instruction=instruc_mem[7];
32'd8: out_instruction=instruc_mem[8];
32'd9: out_instruction=instruc_mem[9];
32'd10: out_instruction=instruc_mem[10];
32'd11: out_instruction=instruc_mem[11];
32'd12: out_instruction=instruc_mem[12];
32'd13: out_instruction=instruc_mem[13];
32'd14: out_instruction=instruc_mem[14];
32'd15: out_instruction=instruc_mem[15];
32'd16: out_instruction=instruc_mem[16];
endcase
*/

always@(*)
		out_instruction <= instruc_mem [PC];

endmodule


