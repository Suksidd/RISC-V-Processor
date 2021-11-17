`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:03 03/27/2021 
// Design Name: 
// Module Name:    constants 
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
module constants(
    input reset,
    input [31:0] inst_add,
    output reg [11:0] const,
	 output reg [20:1] const_20,
	 output reg [31:0] const_32
);
	reg [11:0] memory [36:0];
   reg [20:1] jal_const;
	reg [31:0] U_const;
	
	// initializing memory
	always @(posedge reset)
	begin
		
	memory[0] = 25;
	memory[1] = 8;
	memory[2] = 8;
	memory[3] = 8;
	memory[4] = 8;
	memory[5] = 8; 
	memory[6] = 8;
	memory[7] = 8;
	memory[8] = 8;
	memory[9] = 0;
	memory[10] = 0;
	memory[11] = 20;
	memory[12] = 8;
	memory[13] = 8;
	memory[14] = 8;
	memory[15] = 8;
	memory[16] = 8;
	memory[17] = 8;
	memory[18] = 8;
	memory[19] = 8;
	memory[20] = 8;
	memory[21] = 8;
	memory[22] = 8;
	memory[23] = 8;
	memory[24] = 8;
	memory[25] = 8;
	memory[26] = 8;
	memory[27]= 8;
	memory[28]= 8;
	memory[29]= 8;
	memory[30]= 8;
	memory[31]= 8;
	memory[32]= 8;
	memory[33]= 8;
	memory[34]= 8;
	memory[35]= 8;
	memory[36]= 8;
	
	U_const = 246;
	jal_const = 123;
	end
	
	// assigning const based on corresponding instruction address
    always@(inst_add)
    begin
        case(inst_add)
		  40: const = memory[0];
		  44: const = memory[1];
		  48: const = memory[2];
		  52: const = memory[3];
		  56: const = memory[4];
		  60: const = memory[5];
		  64: const = memory[6];
		  68: const = memory[7];
		  72: const = memory[8];
		  76: const = memory[9];
		  80: const = memory[10];
		  84: const = memory[11];
		  88: const = memory[12];
		  92: const_20 = jal_const;
		  96: const = memory[14];
		  100: const = memory[15];
		  104: const = memory[16];
		  108: const = memory[17];
		  112: const = memory[18];
		  116: const = memory[19];
		  120: const = memory[20];
		  124: const = memory[21];
		  128: const = memory[22];
		  132: const = memory[23];
		  136: const = memory[24];
		  140: const_32 = U_const;
		  144: const_32 = U_const;
		  default:
		  $display("Error in input");
		  endcase
		  
    end

endmodule

