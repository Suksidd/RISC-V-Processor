`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:57 03/27/2021 
// Design Name: 
// Module Name:    Processor 
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
/*module Processor(
    input clock,
	 input reset,
	 output zero_flag
);

	  wire[31:0] inst_code;
	  wire[31:0] PC;
	  wire if_id_write;
	  wire [31:0] id_pc, id_inst_code; 
	  wire [31:0] output_data1,output_data2,write_data;
	  wire [31:0]sign_extend, bit_extend, offset_u;
	  wire [4:0]rs1,rs2,rd;
	  wire [31:0]id_ex_output_data1,id_ex_output_data2,id_ex_sign_extend_immediate;
	  wire [4:0]id_ex_register_rs1,id_ex_register_rs2,id_ex_register_rd;
	  wire id_ex_memtoreg,id_ex_alusrc,id_ex_memread,id_ex_memwrite,id_ex_branch,id_ex_regwrite_control;
	  wire [3:0]id_ex_alu_control;
	  wire [31:0]alu_result, alu_result_ex_mem, alu_result_mem_wb;
	  wire [2:0]funct3;
	  wire [6:0] funct7, opcode;
	  wire [3:0] if_id_alu_control;
	  wire [9:0]control;
     wire if_id_regwrite_control,if_id_memtoreg,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch;
	  wire zero_flag_ex_mem;
	  wire [4:0] ex_mem_register_rd, mem_wb_register_rd;
	  wire [31:0] ex_mem_output_data_2, read_data, read_data_mem_wb;
	  wire ex_mem_memtoreg,ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch, mem_wb_memtoreg,mem_wb_regwrite;
	  
	  assign if_id_write = 1;
	  
	  IFU Instruction_fetch_module(clock, reset, inst_code,PC);
	  
	  if_id IF_ID_register(clock, if_id_write, inst_code, PC, id_pc,id_inst_code);
	  
	  Decoder decoder_module(id_inst_code, output_data1, output_data2, clock, reset, 
									 write_data, sign_extend, bit_extend, if_id_regwrite_control,offset_u,rs1,rs2,rd,funct3,funct7,opcode);
			
	  control control_module(funct7,funct3,opcode, if_id_alu_control,
				 control, if_id_regwrite_control,if_id_memtoreg,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch);
		
	  id_ex ID_EX_register(rs1,rs2,rd,output_data1, output_data2, sign_extend, clock, control, 
			id_ex_output_data1,id_ex_output_data2,id_ex_sign_extend_immediate,
			id_ex_register_rs1,id_ex_register_rs2,id_ex_register_rd,
			id_ex_memtoreg,id_ex_alusrc,id_ex_memread,id_ex_memwrite,id_ex_branch,id_ex_regwrite_control,
			id_ex_alu_control);
			
	  ALU ALU_module(id_ex_output_data1, id_ex_output_data2, id_ex_alu_control, alu_result, zero_flag);
		
	  ex_mem EX_MEM_register(clock, zero_flag, zero_flag_ex_mem, id_ex_register_rd, ex_mem_register_rd, alu_result, alu_result_ex_mem,id_ex_output_data2,ex_mem_output_data_2, id_ex_memtoreg,id_ex_regwrite_control,id_ex_memread,id_ex_memwrite,id_ex_branch,ex_mem_memtoreg,ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch);
	  
	  Data_mem Data_memory_module(alu_result_ex_mem, ex_mem_output_data_2, ex_mem_memwrite, ex_mem_memread, clock, read_data);
	  
	  mem_wb MEM_WB_register(clock, ex_mem_register_rd, mem_wb_register_rd, alu_result_ex_mem, alu_result_mem_wb ,read_data, read_data_mem_wb, ex_mem_memtoreg, ex_mem_regwrite, mem_wb_memtoreg,mem_wb_regwrite );
	  
	  mux Multiplexer_module(mem_wb_memtoreg, read_data, alu_result_mem_wb, write_data);

endmodule
*/

module Processor(
    input clock,
	 input reset,
	 output zero_flag
);

	  wire[31:0] inst_code;
	  wire[31:0] PC;
	  wire if_id_write;
	  wire [31:0] if_id_pc, id_inst_code, id_ex_pc; 
	  wire [31:0] output_data1,output_data2,write_data;
	  wire [31:0]sign_extend, bit_extend, offset_u;
	  wire [4:0]rs1,rs2,rd;
	  wire [31:0]id_ex_output_data1,id_ex_output_data2,id_ex_sign_extend_immediate;
	  wire [4:0]id_ex_register_rs1,id_ex_register_rs2,id_ex_register_rd;
	  wire id_ex_memtoreg,id_ex_alusrc,id_ex_memread,id_ex_memwrite,id_ex_branch,id_ex_regwrite_control;
	  wire [3:0]id_ex_alu_control;
	  wire [31:0]alu_result, result_ex_mem, result_mem_wb;
	  wire [2:0]funct3;
	  wire [6:0] funct7, opcode;
	  wire [3:0] if_id_alu_control;
	  wire [10:0]control;
     //wire if_id_regwrite_control,if_id_memtoreg,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch;
	  wire zero_flag_ex_mem;
	  wire [4:0] ex_mem_register_rd, mem_wb_register_rd;
	  wire [31:0] ex_mem_output_data_2, read_data, read_data_mem_wb;
	  wire ex_mem_memtoreg,ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch, mem_wb_memtoreg,mem_wb_regwrite;
	  wire [1:0]FWD_RS1,FWD_RS2;
	  wire [31:0]in1,in2,alu_mux;
	  wire pc_src;
	  wire [31:0] next_address_branch, input_to_ifu, ex_mem_next_address_branch, next_address;
	  wire enable;
	  //wire [31:0]alu_result;
   // wire [31:0]mul_result;
    wire [31:0] result;
	  
	  assign if_id_write = 1;
	  
	  IFU Instruction_fetch_module(clock, reset, inst_code,PC);
	  
	  if_id IF_ID_register(clock, if_id_write, inst_code, PC, if_id_pc,id_inst_code);
	  
	  Decoder decoder_module(id_inst_code,mem_wb_register_rd, output_data1, output_data2, clock, reset, 
									 write_data, sign_extend, mem_wb_regwrite,rs1,rs2,rd,funct3,funct7,opcode);
			
	  control control_module(funct7,funct3,opcode, if_id_alu_control,
				 control,enable, if_id_regwrite_control,if_id_memtoreg,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch);
		
	  id_ex ID_EX_register(rs1,rs2,rd,output_data1, output_data2, sign_extend, clock, control, if_id_pc,enable,
			id_ex_output_data1,id_ex_output_data2,id_ex_sign_extend_immediate,
			id_ex_register_rs1,id_ex_register_rs2,id_ex_register_rd,
			id_ex_memtoreg,id_ex_alusrc,id_ex_memread,id_ex_memwrite,id_ex_branch,id_ex_regwrite_control,
			id_ex_alu_control,id_ex_pc,id_ex_enable);
			
	  forwarding_unit forwarding_module(id_ex_register_rs1,id_ex_register_rs2,ex_mem_register_rd, mem_wb_register_rd,ex_mem_regwrite,mem_wb_regwrite,FWD_RS1,FWD_RS2);
	  
	  mux3 m1(FWD_RS1,id_ex_output_data1,result_ex_mem,write_data,in1);
	  
	  mux3 m2(FWD_RS2,id_ex_output_data2,result_ex_mem,write_data,alu_mux);	//take alu_mux as the output of second mux3 to feed it to mux just before alu
	  
	  new_mux m3(id_ex_alusrc,alu_mux,id_ex_sign_extend_immediate,in2);
	  
	  adder Adder_module_branch(id_ex_pc, id_ex_sign_extend_immediate, next_address_branch);
	  
	  adder Adder_module(PC, 4, next_address); 
	  
	  //ALU ALU_module(in1, in2, id_ex_alu_control, alu_result, zero_flag);
	  execution_unit e(in1,in2, id_ex_enable, id_ex_alu_control, result,zero_flag);
	  
	  // mux m0( alu_result, mul_result, enable,result);
	  
	  pc_src Pc_src_control(ex_mem_branch, zero_flag, pc_src);
	  
	  new_mux address_mux(pc_src, next_address, next_address_branch, input_to_ifu);
		
	  ex_mem EX_MEM_register(clock, zero_flag, zero_flag_ex_mem, id_ex_register_rd, ex_mem_register_rd, result, result_ex_mem,id_ex_output_data2,ex_mem_output_data_2, id_ex_memtoreg,id_ex_regwrite_control,id_ex_memread,id_ex_memwrite,id_ex_branch,ex_mem_memtoreg,ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch,ex_mem_next_address_branch, next_address_branch,id_ex_enable, ex_mem_enable);
	  
	  Data_mem Data_memory_module(result_ex_mem, ex_mem_output_data_2, ex_mem_memwrite, ex_mem_memread, clock, read_data);
	  
	  mem_wb MEM_WB_register(clock, ex_mem_register_rd, mem_wb_register_rd, result_ex_mem, result_mem_wb ,read_data, read_data_mem_wb, ex_mem_memtoreg, ex_mem_regwrite, mem_wb_memtoreg,mem_wb_regwrite );
	  
	  mem_wb_mux Multiplexer_module(mem_wb_memtoreg, read_data, result_mem_wb, write_data);

endmodule