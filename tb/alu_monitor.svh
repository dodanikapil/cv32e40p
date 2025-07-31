class alu_monitor extends uvm_monitor#(alu_txn);
  `uvm_component_utils(alu_monitor)
  uvm_analysis_port#(alu_txn) mon_port;
  virtual alu_intf intf;
  alu_txn txn;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    mon_port = new("anal_port",this);
    if(  !(uvm_config_db#(virtual alu_intf)::get(this,"","intf",intf)))
      `uvm_error("alu_DRVR","Couldn't access virtual interface pointer")
  endfunction
      
      task run_phase(uvm_phase phase);
    txn=alu_txn::type_id::create("txn");
    wait(intf.rst != 1);
    forever begin 
      @(posedge intf.clk); 
      txn.operand_a_i = intf.operand_a_i;
      txn.operand_b_i = intf.operand_b_i;
      txn.operator_i = intf.operator_i;
      txn.enable_i = intf.enable_i;
      mon_port.write(txn);
    end
    endtask
endclass
