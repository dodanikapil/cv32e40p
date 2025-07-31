class alu_seqr extends uvm_sequencer#(alu_txn);
  `uvm_component_utils(alu_seqr)
  
  function new(string name, uvm_component parent);
    super.new(name, parent); 
    `uvm_info ("","in alu_seqr_connect",UVM_DEBUG)
  endfunction
  
endclass 
