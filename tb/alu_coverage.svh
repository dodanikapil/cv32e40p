import cv32e40p_pkg::*;

class alu_coverage extends uvm_component;
  `uvm_component_utils(alu_coverage);
  
  alu_txn txn;
  uvm_analysis_imp #(alu_txn,alu_coverage) cov_export;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
    alu_cg = new();
  endfunction
 
   covergroup alu_cg;
    option.per_instance = 1;

// Coverpoints
    cp_operand_a: coverpoint txn.operand_a_i {
      bins zero = {0};
      bins max  = {32'hFFFFFFFF};
      bins others = {[1:32'hFFFFFFFE]};
    }

    cp_operand_b: coverpoint txn.operand_b_i {
      bins zero = {0};
      bins max  = {32'hFFFFFFFF};
      bins others = {[1:32'hFFFFFFFE]};
    }

    cp_operator: coverpoint txn.operator_i {
    bins add[] = {ALU_ADD, ALU_SUB, ALU_ADDU, ALU_SUBU, ALU_ADDR, ALU_SUBR, ALU_ADDUR, ALU_SUBUR};
    bins logical[] = {ALU_XOR, ALU_OR, ALU_AND};
    bins shifts[] = {ALU_SRA, ALU_SRL, ALU_ROR, ALU_SLL};
    bins bit_manip[] = {ALU_BEXT, ALU_BEXTU, ALU_BINS, ALU_BCLR, ALU_BSET, ALU_BREV};
    bins bit_count[] = {ALU_FF1, ALU_FL1, ALU_CNT, ALU_CLB};
    bins extensions[] = {ALU_EXTS, ALU_EXT};
    bins comparisons[] = {ALU_LTS, ALU_LTU, ALU_LES, ALU_LEU, ALU_GTS, ALU_GTU, ALU_GES, ALU_GEU, ALU_EQ, ALU_NE};
    bins slt[] = {ALU_SLTS, ALU_SLTU, ALU_SLETS, ALU_SLETU};
    bins abs_clip[] = {ALU_ABS, ALU_CLIP, ALU_CLIPU};
    bins insert[] = {ALU_INS};
    bins min_max[] = {ALU_MIN, ALU_MINU, ALU_MAX, ALU_MAXU};
    bins div[] = {ALU_DIVU, ALU_DIV};
    bins shuffle[] = {ALU_SHUF, ALU_SHUF2, ALU_PCKLO, ALU_PCKHI};
  }

    cp_enable: coverpoint txn.enable_i {
      bins enabled  = {1'b1};
      bins disabled = {1'b0};
    }

    // Cross coverage
    cr_operand_a_operator: cross cp_operand_a, cp_operator;
    cr_operand_b_operator: cross cp_operand_b, cp_operator;
    cr_enable_operator: cross cp_enable, cp_operator;
    cr_operand_a_operand_b: cross cp_operand_a, cp_operand_b;
  endgroup


  function void build_phase(uvm_phase phase);
    cov_export = new("cov_export",this);
    super.build_phase(phase);
  endfunction
  
  function write(alu_txn t);
    txn = t;
    alu_cg.sample();
  endfunction
endclass
    
