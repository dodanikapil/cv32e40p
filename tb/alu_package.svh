package alu_package;

	typedef enum logic [4:0] {
		ALU_ADD_SUB,
		ALU_SLL,
		ALU_SRL,
		ALU_SRA,
		ALU_AND,
		ALU_OR,
		ALU_XOR,
		ALU_LT,
		ALU_LTU,
		ALU_GE,
		ALU_GEU,
		ALU_EQ,
		ALU_NEQ,
		ALU_SLT,
		ALU_SLTU,
		ALU_COPY_A,
		ALU_COPY_B
	} alu_opcode_e;
endpackage
