class alu_test extends uvm_test;
  `uvm_component_utils (alu_test)
  
  alu_env env;
  alu_sequence seq;
  test_cfg cfg;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build();
    env = alu_env::type_id::create("env",this);
    cfg = test_cfg::type_id::create("test_cfg",this);
    
    uvm_config_db#(test_cfg)::set(null,"*","test_cfg",cfg);
     //uvm_config_db#(test_cfg)::set(this,"*","test_cfg",cfg);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_factory factory;
    factory = uvm_factory::get();
  endfunction
  
  
  task run_phase(uvm_phase phase);
    seq = alu_sequence::type_id::create("seq",this);
//    seq.cfg=cfg;
    phase.raise_objection(this);
    `uvm_info ("","in alu_test",UVM_DEBUG)
    	seq.start(env.agent.seqr);
    phase.drop_objection(this);
  endtask
endclass
