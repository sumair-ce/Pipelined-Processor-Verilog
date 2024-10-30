`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:39:57 05/19/2024
// Design Name:   TModule
// Module Name:   G:/Academics/CSA/Projects/PipelinedProcessor/tb_TModule.v
// Project Name:  PipelinedProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_TModule;

	// Inputs
	reg clk;
	reg clk2;
	reg reset;
	reg [2:0] sw;

	// Outputs
	wire [3:0] ENABLE;
	wire [6:0] LEDOUT;

	// Instantiate the Unit Under Test (UUT)
	TModule uut (
		.clk(clk), 
		.clk2(clk2), 
		.reset(reset), 
		.sw(sw), 
		.ENABLE(ENABLE), 
		.LEDOUT(LEDOUT)
	);

	always begin #10 clk=~clk; end

	initial begin
		// Initialize Inputs
		clk = 1;
		reset=1;
		
		// Wait 100 ns for global reset to finish
		//#25 reset=0;
		
		#1;
		reset=0;
		
		//#20 reset=0;
		
		//#100;
		
	
		// Add stimulus here

	end
      
endmodule

