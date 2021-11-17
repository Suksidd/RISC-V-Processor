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
input branch,
input zero_flag,
output pc_src
);

	assign pc_src = zero_flag&branch;

endmodule
