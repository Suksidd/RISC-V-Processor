`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:13 04/11/2021 
// Design Name: 
// Module Name:    pc_src 
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

module pc_src(
input jump,
input branch,
input branch2,
input zero_flag,

output reg  pc_src1
);

	always@(*)begin
	if(jump == 1 || (zero_flag & branch) || (!zero_flag & branch2))
	pc_src1 = 1;
	else 
	pc_src1 =0;
	end


endmodule
