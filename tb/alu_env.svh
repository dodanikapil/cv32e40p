class alu_env extends uvm_env;
  `uvm_component_utils(alu_env)
  
  alu_agent agent;
  alu_coverage cov;
  test_cfg cfg;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    if (!(uvm_config_db#(test_cfg)::get(this,"","test_cfg",cfg)))
      `uvm_error("alu_ENV","Couldn't get access to test configuration");
    //build all the components
    agent = alu_agent::type_id::create("agent",this);
    `uvm_info ("","in alu_env",UVM_DEBUG)
   // if (cfg.en_scoreboard ==1)
   //   scbd = alu_scbd::type_id::create("scbd",this);
    if (cfg.en_coverage ==1)
      cov = alu_coverage::type_id::create("cov",this);
  endfunction
  
  function void connect_phase (uvm_phase phase);
    super.connect();
/*    if (cfg.en_scoreboard ==1)
      begin
        agent.mon.mon_port.connect(scbd.dut_ap_imp);
        agent.exp_mon.tb_mon_port.connect(scbd.tb_ap_imp);
      end
      */
    if (cfg.en_coverage ==1)
      agent.mon.mon_port.connect(cov.cov_export);
  endfunction
      
endclass
      
