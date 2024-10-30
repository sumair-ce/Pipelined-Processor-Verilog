`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:00:02 05/18/2024 
// Design Name: 
// Module Name:    RegisterFile 
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

module  RegisterFile #(parameter N=32, Depth=16)(MemtoReg_signal,evenflagvalue,RegWriteSignal,RegDestination,clk,op,rs,rt,rd,re,we,shamt,ftn, writeData,writeData2,,writeData3,writeData4,read_data_1, read_data_2);
input [4:0] rs,rt,rd;
input [5:0] op,shamt,ftn;
input [N-1:0] writeData,writeData2,writeData3,writeData4;
input re,we,clk,RegDestination,RegWriteSignal,evenflagvalue;
input [2:0] MemtoReg_signal;
output [N-1:0] read_data_1, read_data_2;
reg [N-1:0] registerfile [Depth-1:0];

reg [4:0] temp_reg;

initial begin
$readmemh("regfile.txt", registerfile,0,15);
end


always @(*) begin
if (RegDestination) begin
temp_reg=rd;
end
else begin temp_reg =rt; end
end

     assign read_data_1 = registerfile[rs];
     assign  read_data_2 = registerfile[rt];


    always @(posedge clk) begin
    
        if (RegWriteSignal) begin
            case (MemtoReg_signal)
                3'b001: registerfile[temp_reg] <= writeData2;
                3'b000: registerfile[temp_reg] <= writeData;
                3'b010: registerfile[temp_reg] <= writeData3;
                3'b011: registerfile[temp_reg] <= writeData4; 
                3'b100: if (evenflagvalue) begin registerfile[temp_reg] <= writeData4; end // addie instruction
                default: registerfile[temp_reg] <= writeData;
            endcase
        end
    end

endmodule

