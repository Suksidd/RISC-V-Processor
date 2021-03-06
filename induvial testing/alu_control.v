
module alu_control(alu_op, func3, sign_bit, alu_select);

input[1:0] alu_op; // alu opcode form the control unit
input[2:0] func3; // function 3 input
input sign_bit; //bit 30 in machine code, if it is one then func7 is 0x20.  Which is for operations like sub, sra
output reg[4:0] alu_select; // operation select output given to the alu.

always @(alu_op, func3, sign_bit) begin
	case(alu_op)
		// LOAD & STORE instructions
		2'b00: alu_select = 5'h0x00; 					// ADD RS1, IMM
		// BRANCH instructions
        	2'b01: begin
           		case(func3)
               		3'h0x00: alu_select = 5'h0x0A; 				// BEQ 
               		3'h0x01: alu_select = 5'h0x0B; 				// BNE
               		3'h0x04: alu_select = 5'h0x0C; 				// BLT
               		3'h0x05: alu_select = 5'h0x0D; 				// BGE
               		3'h0x06: alu_select = 5'h0x0E; 				// BLTU
               		3'h0x07: alu_select = 5'h0x0F; 				// BGEU
               		default: alu_select = 5'bxxxxx; 				// DEFAULT UNKNOW
	   		endcase
        	end
		// R-FORMAT instructions
        	2'b10: begin
           		case(func3)
				3'h0x00: begin 
                   			if(sign_bit) alu_select = 5'h0x01; 	// SUB
                   			else alu_select = 5'h0x00; 		// ADD  and  // JALR (RS1 + IMM)
				end
				3'h0x04: alu_select =  5'h0x02; 			// XOR
				3'h0x06: alu_select =  5'h0x03; 			// OR
				3'h7: alu_select = 5'h0x04; 			// AND
               			3'h0x01: alu_select = 5'h0x05; 			// SLL
				3'h0x05: begin 
					if(sign_bit) alu_select = 5'h0x07; 	// SRA
                   			else alu_select = 5'h0x06; 		// SRL
               			end
               			3'h0x02: alu_select = 5'h0x08; 			// SLT
               			3'h0x03: alu_select = 5'h0x09; 			// SLTU
               			default: alu_select = 5'bxxxxx; 			// DEFAULT UNKOWN
           		endcase 
        	end
		//The register JAL register do not use the ALU , JALR uses ADD.
        	2'b11: begin
			case(func3)
			3'0x00:	alu_select = 5'h0x00; //JALR
			default: alu_select	// JAL no ALU operation 
			endcase
		end	
		// DEFAULT UNKOWN
        	default: alu_slect = 5'bxxxxx; 					// DEFAULT UNKOWN
    	endcase
end

endmodule
