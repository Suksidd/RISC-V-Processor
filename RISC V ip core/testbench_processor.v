`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:36:24 03/28/2021
// Design Name:   Processor
// Module Name:   C:/Vivado Projects/processor/testbench_processor.v
// Project Name:  processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_processor;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire zero_flag; 

	// Instantiate the Unit Under Test (UUT)
	Processor uut (
		.clock(clock), 
		.reset(reset), 
		.zero_flag(zero_flag)
	);

	initial begin
		reset = 0;
		#10 reset = 1;
	end
	
	initial begin
	clock = 0;
	forever #5 clock = ~clock;
   end
	
	initial
	#300 $finish;
	
	
endmodule

