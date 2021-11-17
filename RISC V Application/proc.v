`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2021 18:32:06
// Design Name: 
// Module Name: proc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module proc(
input clock,
output [7:0] final_result
    );
    
	 wire reset;
	 //output [7:0]final_result 10 outputs
	wire [31:0]output1, output2, output3, output4, output5, output6, output7, output8, output9, output10;
   //assign final_result = result[7:0];
    //Processor p();
   // vio
   assign final_result= output1[7:0];
   Processor p( clock,
 reset,
output1, output2, output3, output4, output5, output6, output7, output8, output9, output10);
   vio_0 v0(clock,output1, output2, output3, output4, output5, output6, output7, output8, output9, output10,reset);
endmodule
