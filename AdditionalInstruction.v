`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:42 03/23/2024 
// Design Name: 
// Module Name:    AdditionalInstruction 
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
module AdditionalInstruction(imm, out_imm);

input [15:0] imm;
output reg [31:0] out_imm;


integer i;

   always @(*) begin
      out_imm = imm;
      for (i = 0; i < 16; i = i + 1) begin
         out_imm = out_imm << 1;
      end
   end


endmodule
