`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:57:12 03/29/2021
// Design Name:   id_ex
// Module Name:   C:/Vivado Projects/processor/testing.v
// Project Name:  processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: id_ex
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testing;

	// Inputs
	reg [4:0] if_id_register_rs1;
	reg [4:0] if_id_register_rs2;
	reg [4:0] if_id_register_rd;
	reg [31:0] if_id_output_data_1;
	reg [31:0] if_id_output_data_2;
	reg [31:0] if_id_sign_extend_immediate;
	reg clk;
	reg [9:0] control;

	// Outputs
	wire [31:0] id_ex_output_data1;
	wire [31:0] id_ex_output_data_2;
	wire [31:0] id_ex_sign_extend_immediate;
	wire [4:0] id_ex_register_rs1;
	wire [4:0] id_ex_register_rs2;
	wire [4:0] id_ex_register_rd;
	wire id_ex_memtoreg;
	wire id_ex_alusrc;
	wire id_ex_memread;
	wire id_ex_memwrite;
	wire id_ex_branch;
	wire id_ex_regwrite_control;
	wire [3:0] id_ex_alu_control;

	// Instantiate the Unit Under Test (UUT)
	id_ex uut (
		.if_id_register_rs1(if_id_register_rs1), 
		.if_id_register_rs2(if_id_register_rs2), 
		.if_id_register_rd(if_id_register_rd), 
		.if_id_output_data_1(if_id_output_data_1), 
		.if_id_output_data_2(if_id_output_data_2), 
		.if_id_sign_extend_immediate(if_id_sign_extend_immediate), 
		.clk(clk), 
		.control(control), 
		.id_ex_output_data1(id_ex_output_data1), 
		.id_ex_output_data_2(id_ex_output_data_2), 
		.id_ex_sign_extend_immediate(id_ex_sign_extend_immediate), 
		.id_ex_register_rs1(id_ex_register_rs1), 
		.id_ex_register_rs2(id_ex_register_rs2), 
		.id_ex_register_rd(id_ex_register_rd), 
		.id_ex_memtoreg(id_ex_memtoreg), 
		.id_ex_alusrc(id_ex_alusrc), 
		.id_ex_memread(id_ex_memread), 
		.id_ex_memwrite(id_ex_memwrite), 
		.id_ex_branch(id_ex_branch), 
		.id_ex_regwrite_control(id_ex_regwrite_control), 
		.id_ex_alu_control(id_ex_alu_control)
	);

	initial begin
		// Initialize Inputs
		if_id_register_rs1 = 0;
		if_id_register_rs2 = 0;
		if_id_register_rd = 0;
		if_id_output_data_1 = 0;
		if_id_output_data_2 = 0;
		if_id_sign_extend_immediate = 0;
		control = 67;

		// Wait 100 ns for global reset to finish
		#100;
		
		control = 132;
		#50
		control = 45;
        
		// Add stimulus here

	end
	initial begin
	clk = 0;
	forever #5 clk = ~clk;
	end
      
	initial
	#200 $finish;
		
endmodule

