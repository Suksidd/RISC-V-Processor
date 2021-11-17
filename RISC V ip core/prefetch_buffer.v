`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:39 03/27/2021 
// Design Name: 
// Module Name:    prefetch_buffer 
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
module prefetch_buffer(
    input [31:0] input_code,
    input clock,
	 input reset,
    output reg [31:0] output_code
    );
	 
	 reg [31:0] fifo [2:0];
	 
	 integer check = 0;
	
	always @(posedge reset)
	begin 
	 fifo[0] = 1;
	 fifo[1] = 2;
	 fifo[2] = 3;
	end
	
	always @(posedge clock)
	begin
		
		output_code = fifo[0];
		
		fifo[0] = fifo[1];
		
		fifo[1] = fifo[2];
				
		if(check == 1)		
		fifo[2] = input_code;
		
		check = 1;
		
		
	end


endmodule