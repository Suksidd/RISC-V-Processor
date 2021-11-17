`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:02 04/04/2021 
// Design Name: 
// Module Name:    mux 
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
module mux(
input memtoreg,
input [31:0] read_data,
input [31:0] alu_result,
output reg [31:0] write_data
);

always @(*) begin
	if(memtoreg == 0)
	write_data = read_data;
	else
	write_data = alu_result;
end
endmodule
