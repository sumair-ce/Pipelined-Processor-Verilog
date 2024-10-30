`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:39:45 05/18/2024 
// Design Name: 
// Module Name:    CenterRegisters 
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
module CenterRegisters(
    input clk,
    input [31:0] Inst_in, PC_in, readData1_in, readData2_in, const_in, aluRes_in, MemRead_in, writeTomem, addbranch_in,
    input zero_in, RegDst_in, ALUsrc_in, RegWrite_in, MemReadd_in, MemWrite_in, Branch_in, Jump_in,
    input [2:0] MemtoReg_in,
	 input [1:0] ALUOP_in,
    input [4:0] rd_in,
    output reg [31:0] Inst_out, PC_out, readData1_out, readData2_out, const_out, aluRes_out, MemRead_out,addbranch_out,
    output reg zero_out, RegDst_out, ALUsrc_out, RegWrite_out, MemReadd_out, MemWrite_out, Branch_out, Jump_out,
    output reg [2:0] MemtoReg_out,
    output reg [4:0] rd_out,
	 output reg [1:0] ALUOP_out
);

// Define the registers to hold the pipeline stage values
reg [66:0] Reg1;  // Will hold Inst and PC
reg [112:0] Reg2; // Will hold readData1, readData2, const, rd, and control signals
reg [111:0] Reg3; // Will hold zero, aluRes, writeTomem, rd, and control signals
reg [78:0] Reg4; // Will hold MemRead, aluRes, rd, and control signals


always @(posedge clk) begin
    Reg1[31:0] <= Inst_in;
    Reg1[63:32] <= PC_in;
	 Reg1[64] <= Reg4[76];
	 Reg1[65] <= Reg4[77];
	 Reg1[66] <= Reg4[78];
	 
    
    Reg2[31:0] <= readData1_in;
    Reg2[63:32] <= readData2_in;
    Reg2[95:64] <= const_in;
    Reg2[100:96] <= rd_in;
	 Reg2[101] <= ALUsrc_in;
	 Reg2[102] <= MemReadd_in;
	 Reg2[103] <= MemWrite_in;
	 Reg2[104] <= Branch_in;
	 Reg2[107:105] <= MemtoReg_in;
	 Reg2[108] <= RegDst_in;
	 Reg2[109] <= RegWrite_in;
	 Reg2[110] <= Jump_in;
	 Reg2[112:111] <= ALUOP_in;
	 Reg2[144:113] <= Reg1[63:32];
	 
    
    Reg3[0] <= zero_in;
    Reg3[32:1] <= aluRes_in;
    Reg3[64:33] <= writeTomem;
    Reg3[69:65] <= Reg2[100:96];
	 Reg3[70] <= Reg2[101];
	 Reg3[71] <= Reg2[102];
	 Reg3[72] <= Reg2[103];
	 Reg3[73] <= Reg2[104];
	 Reg3[76:74] <= Reg2[107:105];
	 Reg3[77] <= Reg2[108];
	 Reg3[78]<= Reg2[109];
	 Reg3[79] <= Reg2[110];
	 Reg3[111:80]<=addbranch_in;
	 Reg3[143:112] <= Reg2[144:113];
	 
    
    Reg4[31:0] <= MemRead_in;
    Reg4[63:32] <= Reg3[32:1];
    Reg4[68:64] <= Reg3[96:65];
	 Reg4[69] <= Reg3[70];
	 Reg4[70] <= Reg3[71];
	 Reg4[71] <= Reg3[72];
	 Reg4[72] <= Reg3[73];
	 Reg4[75:73] <= Reg3[76:74];
	 Reg4[76] <= Reg3[77];
	 Reg4[77] <= Reg3[78];
	 Reg4[78] <= Reg3[79];
	 
	 
end



always @(*) begin
    // Output values from Reg1
    Inst_out = Reg1[31:0];
    PC_out = Reg1[63:32];
    RegDst_out = Reg1[64];
    RegWrite_out = Reg4[77];
    Jump_out = Reg1[66];
	 ALUOP_out = Reg2[112:111];
    
    // Output values from Reg2
    readData1_out = Reg2[31:0];
    readData2_out = Reg2[63:32];
    const_out = Reg2[95:64];
    rd_out = Reg4[68:64];
    ALUsrc_out = Reg2[101];
    MemReadd_out = Reg2[102];
    MemWrite_out = Reg2[103];
    Branch_out = Reg3[73];
    MemtoReg_out = Reg2[107:105];
	 
    
    // Output values from Reg3
    zero_out = Reg3[0];
    aluRes_out = Reg4[63:32];
    MemRead_out = Reg3[64:33];
	 addbranch_out = Reg3[111:80];
end

endmodule
