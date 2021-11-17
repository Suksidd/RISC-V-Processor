# RISC-V-Processor
RISC-V is a new instruction set architecture used in various devices, from tiny microcontrollers to high-performance CPUs. 

RISC-V is an open standard instruction set architecture (ISA) based on the reduced instruction set computer (RISC).
Unlike most previous ISA designs, the RISC-V ISA is free to use and is distributed under open-source licencing.
RISC-V hardware is available from several firms, open-source operating systems with RISC-V support are available, and many major software toolchains support the instruction set.

A 32-bit 5-stage pipelined processor based on the RISC-V ISA is conceived and built in this project. 
Instruction Fetch, Instruction Decode, Execute, Memory, and Writeback are some of the pipelined steps. 

After each stage, some registers will save the current cycle's output and act as input for the next step in the following cycle (pipeline implementation). 
Verilog HDL is used in the implementation and synthesized using Xilinx vivado.
An application of the processor is also tested out.

Refer report for more information.
