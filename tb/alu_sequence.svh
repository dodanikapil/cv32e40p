class alu_sequence extends uvm_sequence #(alu_txn);

  `uvm_object_utils(alu_sequence)
  
  rand int num_transactions = 100;
 alu_txn req; 
 test_cfg cfg; 
  constraint num_transactions_c { num_transactions inside {[10:1000]}; }
  
  function new(string name = "alu_sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    cfg = new();
    repeat (num_transactions) begin
      req = alu_txn::type_id::create("req");
      `uvm_do(req)
    end
  endtask

endclass

