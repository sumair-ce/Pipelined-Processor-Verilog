`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:11:24 03/12/2024 
// Design Name: 
// Module Name:    TModule 
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
module TModule(clk, clk2, reset, sw, ENABLE, LEDOUT);

input clk, clk2, reset;
input [2:0] sw;
output [3:0] ENABLE;
output [6:0] LEDOUT;

wire [31:0] Tresult, JUMPADDRESS;
wire [31:0] read1, read2, Reg2_Reg3;
wire [31:0] PCC;
wire [15:0] CONSTANT, immed;
wire ZEROFLAG, EVENFLAG, NOTEQUALFLAG;

wire [31:0] in, writeDatafromMEM, Tresult2, Tresult3;
wire [4:0] RSS, RTT, RDD, RD_OUT; 
wire [5:0] OPP, SHAMTT, FTNN;
wire REE, WEE;
wire [1:0] ALUOPP,OLUOP_outt;
wire [2:0] Mem_toReg, MemtoReg_outt;
wire Reg_Dst, ALU_src, Reg_Write, Mem_Read, Mem_Write, Bra_nch, Ju_mp,ZERO_OUT;
wire RegDst_outt, ALUsrc_outt, RegWrite_outt, MemRead_outt, MemWrite_outt, Branch_outt, Jump_outt;

reg [31:0] CONSTANT_temp;
always @(*) begin
    CONSTANT_temp <= {16'b0, CONSTANT};
end

wire [31:0] CONSTANT_tempp;
assign CONSTANT_tempp = CONSTANT_temp;

wire [31:0] INST_OUT, PC_OUT, READDATA1_OUT, READDATA2_OUT, CONST_TEMP, TRESULT_OUT,addbranch_outt,branch_add_out;

// Program Counter 
ProgramCounter p1(
    .clk(clk), 
    .rst(reset), 
    .PC(PCC), 
    .BranchSignal(Branch_outt), 
    .JumpSignal(Jump_outt),
    .Jump_addr(JUMPADDRESS),
    .PCsrc(ZERO_OUT),
    .PCsrc2(NOTEQUALFLAG),
    .branch_address(addbranch_outt)
);

// Instruction Memory
InstructionMemory i1(
    .PC(PCC),
    .out_instruction(in),
    .clk(clk)
);

// Centered Register
CenterRegisters cr1 (
    .clk(clk), 
    .Inst_in(in), 
    .PC_in(PCC), 
    .readData1_in(read1), 
    .readData2_in(read2), 
    .const_in(CONSTANT_temp), 
    .rd_in(RDD), 
    .aluRes_in(Tresult), 
    .MemRead_in(writeDatafromMEM), 
    .writeTomem(Reg2_Reg3), 
    .zero_in(ZEROFLAG), 
    .Inst_out(INST_OUT), 
    .PC_out(PC_OUT), 
    .readData1_out(READDATA1_OUT), 
    .readData2_out(READDATA2_OUT), 
    .const_out(CONST_TEMP), 
    .rd_out(RD_OUT), 
    .aluRes_out(TRESULT_OUT), 
    .MemRead_out(Reg2_Reg3), 
    .zero_out(ZERO_OUT),
    .RegDst_in(Reg_Dst), 
    .ALUsrc_in(ALU_src), 
    .RegWrite_in(Reg_Write), 
    .MemReadd_in(Mem_Read), 
    .MemWrite_in(Mem_Write), 
    .Branch_in(Bra_nch), 
    .Jump_in(Ju_mp), 
    .MemtoReg_in(Mem_toReg), 
	 .ALUOP_in (ALUOPP),
	 .addbranch_in(branch_add_out),
    .RegDst_out(RegDst_outt), 
    .ALUsrc_out(ALUsrc_outt), 
    .RegWrite_out(RegWrite_outt), 
    .MemReadd_out(MemRead_outt), 
    .MemWrite_out(MemWrite_outt), 
    .Branch_out(Branch_outt), 
    .Jump_out(Jump_outt),
    .MemtoReg_out(MemtoReg_outt),
	 .ALUOP_out(OLUOP_outt),
	 .addbranch_out(addbranch_outt)
);

// Decoder 
Decoder d1(
    .instruction(INST_OUT), 
    .clk(clk), 
    .constant(CONSTANT),
    .imme(immed),
    .OP(OPP), 
    .RS(RSS), 
    .RT(RTT), 
    .RD(RDD), 
    .SHAMT(SHAMTT), 
    .FTN(FTNN), 
    .RE(REE), 
    .WE(WEE), 
    .ALUOP(ALUOP), 
    .JumpAddress(JUMPADDRESS)
);

// Register File
RegisterFile r1(
    .MemtoReg_signal(MemtoReg_outt),
    .RegWriteSignal(RegWrite_outt),
    .evenflagvalue(EVENFLAG),
    .RegDestination(RegDst_outt),
    .op(OPP),
    .rs(RSS),
    .rt(RTT),
    .rd(RD_OUT),
    .re(REE),
    .we(WEE),
    .clk(clk),
    .shamt(SHAMTT),
    .ftn(FTNN), 
    .writeData(TRESULT_OUT),
    .writeData2(writeDatafromMEM),
    .writeData4(Tresult2),
    .writeData3(Tresult3),
    .read_data_1(read1),
    .read_data_2(read2)
);

//Branch ALU
BranchALU b1(.branchadd(CONST_TEMP), .PC(PC_OUT), .branchadd_out(branch_add_out));

// ALU
ALU a1(
    .in_1(READDATA1_OUT),
    .Opcod(OPP), 
    .in_2(READDATA2_OUT), 
    .result(Tresult),
    .result2(Tresult2), 
    .ALUop(OLUOP_outt), 
    .zeroflag(ZEROFLAG),
    .notequalflag(NOTEQUALFLAG),
    .evenflag(EVENFLAG),
    .ALUsource(ALUsrc_outt), 
    .offset_temp(CONST_TEMP)
);

// Control Unit
ControlUnit c1(
    .Inst_opcode(OPP),
    .RegDst(Reg_Dst),
    .ALUsrc(ALU_src),
    .MemtoReg(Mem_toReg),
    .RegWrite(Reg_Write),
    .MemRead(Mem_Read),
    .MemWrite(Mem_Write),
    .Branch(Bra_nch),
    .Jump(Ju_mp),
	 .ALUoppp(ALUOPP)
);

// Data Memory 
DataMemory m1(
    .clk(clk), 
    .MemWriteSignal(MemWrite_outt),
    .MemReadSignal(MemRead_outt),
    .MemAddress(TRESULT_OUT),
    .MemWriteData(read2),
    .MemReadData(writeDatafromMEM)
);

// LUI Instruction
AdditionalInstruction lui(
    .imm(immed), 
    .out_imm(Tresult3)
);

// Seven Segment
SevenSegment s1(
    .Clk(clk2), 
    .inst(in),    .alu_in(Tresult), 
    .pc_in(PCC), 
    .switch(sw), 
    .enable(ENABLE), 
    .LED_out(LEDOUT)
);

endmodule
