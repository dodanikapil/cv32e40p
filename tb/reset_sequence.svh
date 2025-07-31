class reset_sequence extends uvm_sequence #(alu_txn);

  `uvm_object_utils(reset_sequence)
  
 alu_txn req; 
 test_cfg cfg; 
  
  function new(string name = "reset_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    cfg = new();
    req = alu_txn::type_id::create("req");
    req.rst = 1;
  endtask

endclass

