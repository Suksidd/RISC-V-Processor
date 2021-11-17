`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:50 03/27/2021 
// Design Name: 
// Module Name:    IFU 
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
/* This is the module where all the components of IFU are integrated*/

// Set as top module

module IFU(
	input clock,
	input reset,
	output [31:0]inst_code,
	output [31:0]PC
    );
	 
	 wire [31:0] inst_address;
	 wire [31:0] transfer_inst_code = inst_code;
	 
	 assign PC = inst_address;
	 
	 address_fetch fetch_add_unit(transfer_inst_code, inst_address, clock);
	 Inst_mem_integrated inst_mem_unit(reset,inst_address, inst_code);
	 //prefetch_buffer prefetch_unit(transfer_inst_code, clock, reset, inst_code);
	 


endmodule
