`uvm_analysis_imp_decl(_tb_pkt)
`uvm_analysis_imp_decl(_actual_pkt)

class alu_scbd extends uvm_scoreboard;
  `uvm_component_utils (alu_scbd)
  uvm_analysis_imp_tb_pkt #(alu_txn,alu_scbd) tb_ap_imp;
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    tb_ap_imp=new("tb_ap_imp",this);
  endfunction
  
  function void write_actual_pkt (alu_txn txn);
      endfunction
            
  function write_tb_pkt (alu_txn txn);
  endfunction
  
endclass
