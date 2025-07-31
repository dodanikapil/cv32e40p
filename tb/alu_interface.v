import cv32e40p_pkg::*;

//`include "../rtl/cv32e40p_alu.sv"

interface alu_intf();
  logic clk;
  logic rst;
  logic [31:0] operand_a_i;
  logic [31:0] operand_b_i;
  alu_opcode_e operator_i;
  bit enable_i;
  logic result_o;

  modport DUT (input clk,rst,enable_i,operator_i,operand_a_i,operand_b_i, output result_o);
endinterface

module dut_wrapper(alu_intf intf);

import uvm_pkg::*;

cv32e40p_alu alu(
 .clk (intf.clk),
 .rst_n (intf.rst),
 .enable_i (intf.enable_i),
 .operator_i (intf.operator_i),
 .operand_a_i (intf.operand_a_i),
 .operand_b_i (intf.operand_b_i)
);

endmodule
