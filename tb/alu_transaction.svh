import cv32e40p_pkg::*;
import uvm_pkg::*;

class alu_txn extends uvm_sequence_item;
 `uvm_object_utils_begin(alu_txn)
	`uvm_field_int(operand_a_i, UVM_ALL_ON)
	`uvm_field_int(operand_b_i, UVM_ALL_ON)
	`uvm_field_enum(alu_opcode_e, operator_i, UVM_ALL_ON)
	`uvm_field_int(enable_i, UVM_ALL_ON)
 `uvm_object_utils_end

  rand logic [31:0] operand_a_i;
  rand logic [31:0] operand_b_i;
  rand alu_opcode_e operator_i;
  rand bit enable_i;


  constraint operand_range {
    operand_a_i dist {0 := 10, 32'hFFFFFFFF := 10, [1:32'hFFFFFFFE] := 80};
    operand_b_i dist {0 := 10, 32'hFFFFFFFF := 10, [1:32'hFFFFFFFE] := 80};
  }
  constraint opcode_valid {
    operator_i inside {
      ALU_ADD, ALU_SUB, ALU_ADDU, ALU_SUBU, ALU_ADDR, ALU_SUBR, ALU_ADDUR, ALU_SUBUR,
      ALU_XOR, ALU_OR, ALU_AND,
      ALU_SRA, ALU_SRL, ALU_ROR, ALU_SLL,
      ALU_BEXT, ALU_BEXTU, ALU_BINS, ALU_BCLR, ALU_BSET, ALU_BREV,
      ALU_FF1, ALU_FL1, ALU_CNT, ALU_CLB,
      ALU_EXTS, ALU_EXT,
      ALU_LTS, ALU_LTU, ALU_LES, ALU_LEU, ALU_GTS, ALU_GTU, ALU_GES, ALU_GEU, ALU_EQ, ALU_NE,
      ALU_SLTS, ALU_SLTU, ALU_SLETS, ALU_SLETU,
      ALU_ABS, ALU_CLIP, ALU_CLIPU,
      ALU_INS,
      ALU_MIN, ALU_MINU, ALU_MAX, ALU_MAXU,
      ALU_DIVU, ALU_DIV,
      ALU_SHUF, ALU_SHUF2, ALU_PCKLO, ALU_PCKHI
    };
  }  
  
  constraint enable_mode {
    enable_i dist {1 := 90, 0 := 10};
  }
  
  function new(string name = "alu_txn");
    super.new(name);
  endfunction

endclass
