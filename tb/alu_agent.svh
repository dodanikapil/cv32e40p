class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent)
  
  alu_driver driver;
  alu_monitor mon;
  alu_seqr seqr;
      
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    driver = alu_driver::type_id::create("driver",this);
    mon = alu_monitor::type_id::create("mon",this);
    seqr = alu_seqr::type_id::create("seqr",this);
    `uvm_info ("","in alu_agent_build",UVM_DEBUG)
  endfunction
  
  function void connect_phase(uvm_phase phase);
    driver.seq_item_port.connect(seqr.seq_item_export);
    `uvm_info ("","in alu_agent_connect",UVM_DEBUG)
  endfunction
  
endclass
