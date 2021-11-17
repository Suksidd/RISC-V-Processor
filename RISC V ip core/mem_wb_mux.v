`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:32 04/06/2021 
// Design Name: 
// Module Name:    mem_wb_mux 
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
module mem_wb_mux(
input memtoreg,
input [31:0] read_data,
input [31:0] result,
output reg [31:0] write_data
);

always @(read_data or result) begin
	if(memtoreg == 1)
	write_data = read_data;
	else
	write_data = result;
end
endmodule
