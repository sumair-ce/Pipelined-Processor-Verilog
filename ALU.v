`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:10:38 03/08/2024 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] in_1, in_2,
    input [1:0] ALUop,
	 input [31:0] offset_temp,
	 input [5:0] Opcod,
    output reg [31:0] result,
    output reg [31:0] result2,
    output reg zeroflag,
	 output reg notequalflag,
	 output reg evenflag,
    input ALUsource
);



always @(ALUop, ALUsource, in_1, in_2, Opcod, offset_temp) begin
	if (ALUsource==1'b0) begin
    case (ALUop)
        2'b00: begin result = in_1 + in_2; end
        2'b01: begin result = in_2 - in_1;  end
        2'b10: begin result = in_1 * in_2; end
        2'b11: begin result = in_2 - in_1; end
        default: result = 32'hxxxxxxxx;
    endcase end
	 
	 else if (ALUsource==1'b1) begin
	 case (Opcod)
		6'b000110: begin result = in_1 + offset_temp;end 
		6'b000111: begin result2 = in_1 | offset_temp; result = 32'hxxxxxxxx;end
		6'b001000: begin result2 = in_1 - offset_temp; result = 32'hxxxxxxxx;end
		6'b001010: begin result2 = in_1 - offset_temp; result = 32'hxxxxxxxx;end 
		6'b101010: begin result2 = in_1 + offset_temp; result = 32'hxxxxxxxx;end //xorie
		default: begin result = in_1 + offset_temp;end
	 endcase
	 end
	 
end

always @(result,result2) begin
    zeroflag = (result == 0) ? 1'b1 : 1'b0;
	 notequalflag = (result != 0) ? 1'b1 : 1'b0;
	 evenflag = ((result2 %2) ==0 )  ? 1'b1 : 1'b0;
end

endmodule



