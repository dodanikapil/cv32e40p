import uvm_pkg::*;

class test_cfg extends uvm_object;
  `uvm_object_utils(test_cfg)
  
  function new(string name="");
    super.new();
  endfunction
  
  int num_transactions = 100; 
  
  bit en_coverage = 0; 
  bit en_scoreboard = 0; 
  
  
endclass 
