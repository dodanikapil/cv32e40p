class alu_driver extends uvm_driver#(alu_txn);
  `uvm_component_utils(alu_driver)
  
  virtual alu_intf intf;
  alu_txn txn;
      
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(  !(uvm_config_db#(virtual alu_intf)::get(this,"","intf",intf)))
      `uvm_error("alu_DRVR","Couldn't access virtual interface pointer")
  endfunction
  
   virtual task reset_phase(uvm_phase phase);
    phase.raise_objection(this);
    intf.rst = 1'b1;
    #20;
    intf.rst = 1'b0;
    phase.drop_objection(this);
  endtask

  task run_phase(uvm_phase phase);
    txn = alu_txn::type_id::create("txn");
    forever begin
      `uvm_info ("","in alu_driver_start",UVM_DEBUG)
      seq_item_port.get_next_item(txn);
      @(posedge intf.clk);
      seq_item_port.item_done();
      intf.operand_a_i <= txn.operand_a_i;
      intf.operand_b_i <= txn.operand_b_i;
      intf.operator_i <= txn.operator_i;
      intf.enable_i <= txn.enable_i;
      `uvm_info ("","in alu_driver_end",UVM_DEBUG)
      `uvm_info ("alu_driver",$sformatf("received clk=%h,rst=%h,enable_i=%h,operator_i=%h,operand_a_i=%h,operand_b_i=%h",intf.clk,intf.rst,intf.enable_i,intf.operator_i,intf.operand_a_i,intf.operand_b_i),UVM_LOW)
    end
      `uvm_info ("alu_driver2",$sformatf("received clk=%h,rst=%h,enable_i=%h,operator_i=%h,operand_a_i=%h,operand_b_i=%h",intf.clk,intf.rst,intf.enable_i,intf.operator_i,intf.operand_a_i,intf.operand_b_i),UVM_LOW)
  endtask
endclass
