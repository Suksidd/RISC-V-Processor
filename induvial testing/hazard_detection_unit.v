

module hazard_detection_unit(ID_EXMemRead, IF_IDRegisterRs1, IF_IDRegisterRs2, ID_EXRegisterRd, stall);

input ID_EXMemRead;
input[4:0] IF_IDRegisterRs1, IF_IDRegisterRs2, ID_EXRegisterRd;
output reg stall;

always @(ID_EXMemRead, IF_IDRegisterRs1, IF_IDRegisterRs2, ID_EXRegisterRd)
	begin
	  if((ID_EXMemRead == 1) && ((ID_EXRegisterRd ==IF_IDRegisterRs1)||(ID_EXRegisterRd ==IF_IDRegisterRs2)))
	    begin
	      stall = 1;
	    end
	  else
	    begin
	      stall = 0;
	    end
	end

endmodule